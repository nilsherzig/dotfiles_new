#!/usr/bin/env bash

handle_interrupt() {
    # echo -e "\nNo cheating"
    sleep 0.1
}

# Function to display a loading bar
show_loading_bar() {
    local duration=$1
    local bar_length=60
    local sleep_interval 

    sleep_interval=$(echo "scale=3; $duration / $bar_length" | bc)

    trap handle_interrupt SIGINT

    echo -ne "Loading: "
    for ((i=0; i<bar_length; i++)); do
        echo -ne "░"
    done
    echo -ne "\r"

    barString=""
    for ((i=0; i<bar_length; i++)); do
        sleep "$sleep_interval"
        barString="Loading: "
        for ((j=0; j<=i; j++)); do
            barString="${barString}█"
        done
        for ((j=i+1; j<bar_length; j++)); do
            barString="${barString}░"
        done
        echo -ne "${barString}\r"
    done

    
    # Remove the trap after the loading is complete
    trap - SIGINT
    
    echo -ne "\n"
    return 0
}

# Function to check if current directory is a subdirectory of "projects"
is_projects_subdir() {
    local current_path

    current_path=$(pwd)
    case $current_path in
        *"/projects"*) return 0 ;;
        *) return 1 ;;
    esac
}

# Function to check if current time is between 6 AM and 6 PM
is_daytime() {
    local current_hour

    current_hour=$(date +%H)
    if [ "$current_hour" -ge 6 ] && [ "$current_hour" -lt 18 ]; then
        return 0
    else
        return 1
    fi
}

# Main function to be called when entering a directory
digital_wellbeing_check() {
    # Default duration is 20 seconds
    local duration=${DIGITAL_WELLBEING_DURATION:-20}

    if is_projects_subdir && is_daytime; then
        clear
        echo "Denk bitte kurz darüber nach, ob alles andere schon fertig ist. 🦀"
        echo "Du weißt ja selbst, wie schnell die Zeit dabei vergeht."
        echo ""
        echo "Denk daran, wie gut es sich anfühlt erstmal alles fertig zu haben und wie scheiße es ist, wenn man andere Leute hängen lässt."
        show_loading_bar "$duration" 
        echo "Viel erfolg!"
    fi
}

# Add the following lines to your .zshrc or .bashrc file to hook the function
#
# source /path/to/wellbeing.sh
# chpwd_functions=(${chpwd_functions[@]} "digital_wellbeing_check") # triggers on directory change
# digital_wellbeing_check # Call the function once to check when the shell is loaded (optional)
