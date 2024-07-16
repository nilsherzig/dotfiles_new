{ pkgs, ... }:
# let
# token =
#   lib.strings.removeSuffix "\n" (builtins.readFile /home/nils/factorio-token);
# factorio = pkgs.factorio.override {
#   username = "nilsdev";
#   token = token;
# };
# in {
{
  fonts.packages = with pkgs; [
    inter
    cantarell-fonts
    geist-font
    iosevka
    vollkorn
    fira-code
    jetbrains-mono
    comic-mono
    nerdfonts
    fantasque-sans-mono
  ];

  # nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  users.users.nils.packages = with pkgs; [
    # android-studio
    # ansible
    # bottles
    # brave
    # bun
    # choose
    # codespell
    # eza
    # factorio
    # gnome-extension-manager
    # gnome.dconf-editor
    gnome-tweaks
    # gnome.polari
    # gnomeExtensions.auto-move-windows
    # gnomeExtensions.impatience
    # gnomeExtensions.just-perfection
    # helix
    # helix
    # helix-gpt
    # httpie
    # lorri
    # mako
    # newsflash
    # niv
    # nixos-generators
    # nodePackages_latest.pyright
    # ollama
    # rustup
    # sshpass
    # stremio
    # tangram
    # terraform
    # terraform-ls
    # trivy
    # tuxedo-rs
    # unison-ucm
    # vscode-fhs
    # vscode-fhs
    # wezterm
    # xdg-desktop-portal-gtk
    zed-editor
    air
    anki-bin
    argocd
    # asciinema
    atuin
    bluetuith
    brightnessctl
    brotab
    cfssl
    cilium-cli
    clang
    delve
    dig
    direnv
    discord
    docker-compose
    du-dust
    dunst
    dwl
    etcd
    feh
    ffmpeg
    ffmpeg
    file
    firefox
    foot
    fzf
    gammastep
    gcc
    ginkgo
    git
    glibc
    gnumake
    go
    go-callvis
    go-mockery
    gofumpt
    golangci-lint
    golangci-lint-langserver
    google-chrome
    gopls
    goreleaser
    gotools
    gradience
    grim
    # grml-zsh-config
    htop
    imagemagick
    jc
    jdk21
    jq
    k6
    k9s
    keyd
    kind
    kitty
    krew
    kubebuilder
    kubectl
    kubectx
    kubernetes
    kubernetes-helm
    kubeseal
    kubeshark
    kubetail
    kustomize
    lazydocker
    lazygit
    libcxxStdenv # needed to compile tressitter
    libnotify
    libqalculate
    localsend
    ltex-ls
    lua-language-server
    marksman
    mpv
    neovim
    nfs-utils
    nil
    nixfmt-classic
    nixpkgs-fmt
    nodePackages.js-beautify
    nodePackages_latest.bash-language-server
    nodePackages_latest.prettier
    nodePackages_latest.stylelint
    nodePackages_latest.svelte-language-server
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodejs
    oapi-codegen
    obs-studio
    obsidian
    openssl
    openvpn
    pandoc
    pavucontrol
    popeye
    poppler_utils
    powertop
    pyright
    python3
    qalculate-gtk
    ranger
    rclone
    ripgrep
    ruff-lsp
    shellcheck
    signal-desktop
    slurp
    starship
    stylua
    swappy
    swaybg
    tailwindcss
    tailwindcss-language-server
    talosctl
    tcpdump
    templ
    traceroute
    tree
    unrar-wrapper
    unzip
    vial
    waybar
    wireguard-tools
    wl-clipboard
    wmctrl
    wtype
    xdg-desktop-portal-hyprland
    xdg-utils
    yt-dlp
    zathura
    zellij
    zoxide
    # thefuck
    gci
    ledger-live-desktop
    zsh-syntax-highlighting
    zsh-you-should-use
    zsh-autosuggestions
    zsh-syntax-highlighting
    openapi-generator-cli
    zsh-powerlevel10k
    sqlitebrowser
    postman
    helix-gpt
    helix
    teams
    foliate
    sysprof
    nmap
    jellyfin-media-player
    bc
  ];
}
