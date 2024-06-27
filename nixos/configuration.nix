{ pkgs, lib, ... }:
let
  machineID = builtins.readFile "/etc/machine-id";
  private = ''
    2c2b13ee31dc4e37b74274aa5608c424
  '';
  work = ''
    9c2d20d6761e4395861207cef10569e4
  '';
in {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./sync.nix
    ./nix-alien.nix
    ./keyd.nix
    ./home.nix
  ] ++ lib.optional (machineID == private) ./private-laptop.nix
    ++ lib.optional (machineID == private) ./laptop-packages.nix
    ++ lib.optional (machineID == work) ./cynet.nix;

  console.keyMap = "de";
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    # WAYLAND_DISPLAY = "wayland-1";
    # GTK_THEME = "adwaita:dark";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
  };
  hardware = {
    bluetooth = {
      enable = true;
      settings = { General = { Experimental = true; }; };
    };
    pulseaudio = { enable = false; };
  };
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  security.rtkit.enable = true;
  sound.enable = true;
  system.autoUpgrade.enable = true;
  time.timeZone = "Europe/Berlin";

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  boot = {
    kernel = {
      # sysctl = {
      #   "fs.inotify.max_user_watches" = "1048576"; # 128 times the default 8192
      #   "fs.inotify.max_user_instances" = "8192";
      #   "clearcpuid" = "514";
      # };
    };
    extraModprobeConfig = ''
      options hid_apple fnmode=1
      options hid_apple swap_opt_cmd=1
    '';
    # kernelParams =
    #   [ "amd_iommu=on" "clearcpuid=514" "vm.max_map_count=1000000" ];
    initrd.systemd.network.wait-online.timeout = 0;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    tmp.cleanOnBoot = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  networking = {
    enableIPv6 = false;
    networkmanager.enable = true;
  };

  systemd = {
    services.customKeyd = {
      description = "custom keyd";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      serviceConfig = {
        ExecStart = "/home/nils/Documents/keyd/bin/keyd";
        Restart = "always";
        User = "root";
      };
    };
    network.wait-online.enable = false;
    network.wait-online.timeout = 0;
    services.NetworkManager-wait-online.enable = false;
  };

  services = {
    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
    gnome.gnome-keyring.enable = true;

    passSecretService.enable = true;
    resolved.enable = false;
    udisks2.enable = true;
    xserver = {
      xkb = {
        layout = "de";
        variant = "nodeadkeys";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnsupportedSystem = true;
    };
  };

  users = {
    mutableUsers = true;
    users = {
      nils = {
        shell = pkgs.zsh;
        isNormalUser = true;
        description = "nils";
        group = "users";
        extraGroups = [
          "keyd"
          "networkmanager"
          "wheel"
          "docker"
          "dialout"
          "libvirtd"
          "wireshark"
          "adbusers"
          "input"
          "plugdev"
        ];
        home = "/home/nils/";
      };
    };
  };

  programs = {
    gnupg = {
      agent.enable = true;
      agent.pinentryPackage = pkgs.pinentry-gnome3;
    };

    dconf.enable = true;

    zsh = {
      enable = true;
      shellAliases = {
        cd = "z";
        ip = "ip --color=always";
        # ssh = "TERM=xterm ssh";
        k = "kubectl";
        update = "sudo nixos-rebuild switch --upgrade";
        lg = "lazygit";
        # upload = "~/dotfiles/scripts/upload.sh";
        vi = "nvim";
        blue = "bluetuith";
      };
      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "kubectx"
          "fzf"
          "thefuck"
          "zoxide"
          "safe-paste"
          # "zsh-syntax-highlighting"
          # "zsh-you-should-use"
          # "zsh-autosuggestions"
          # "zsh-syntax-highlighting"
          # "zsh-powerlevel10k"
          # "zsh-abr"

          # "zsh-abr"
          # "zsh-fzf-tab"
          # "zsh-autosuggestions"
          # "zsh-syntax-highlighting"
          # zsh-autosuggestions
          # zsh-syntax-highlighting
          # "zsh-autopair"
          # "zsh-completions"
          # "zsh-history-substring-search"
          # "zsh-navigation-tools"
          # "zsh-nvm"
          # "zsh-dircolors-solarized"
          # "zsh-you-should-use"
        ];
      };

      interactiveShellInit = ''
        # source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
        # eval "$(direnv hook zsh)"

        export EDITOR=nvim;
        export NODE_PATH=~/.npm-packages/lib/node_modules
        export PATH=~/.npm-packages/bin:$PATH
      '';

      promptInit = ''
        PROMPT="%(?:%{$fg_bold[white]%}%1{λ%} :%{$fg_bold[red]%}%1{λ%} )%{$fg[white]%}%c%{$reset_color%}"
        PROMPT+=' $(git_prompt_info)'

        PROMPT+='%{$fg[blue]%}($(kubectx_prompt_info))%{$reset_color%} '

        ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg[blue]%}"
        ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[red]%}%1{*%}%{$fg[blue]%})"
        ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
      '';

      # shellInit = ''
      #   eval "$(zoxide init zsh)"
      #   eval "$(direnv hook zsh)"
      #   export EDITOR=nvim;
      #   export NODE_PATH=~/.npm-packages/lib/node_modules
      #   export PATH=~/.npm-packages/bin:$PATH
      # '';
    };
  };

}
