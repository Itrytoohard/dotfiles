alias tmuxconfigreload="tmux source-file -v ~/.tmux.conf"

alias bashreload="source ~/.bash_aliases"

alias bashaliases="vim ~/.bash_aliases"

alias lsfiles="ls -ap | grep -v /"

alias mv="mv --backup=numbered --debug"

# Lists all files in directory. Excludes subdirectories.
# args accepted: 'a'
files() {
	ls -p$1 | grep -v /
}

# Open config file for specified program
# args accepted: 1 - name of program
# ARGUMENTS:
#   $1 (program name):  Name of the program to edit the config file of (required).
conf() {
	
	case $1 in
	"tmux")
		vim .tmux.conf 
        ;;
    "bash")
        vim .bash_aliases
        ;;
	"vim" | "vi")
		vim .vimrc
	;;
	*)
		echo "config for $1 not found" 
        ;;
	esac
}

# Reload the bash in every pane
#######################################
# Processes a specific input string.
# GLOBALS:
#   None
# ARGUMENTS:
#   $1 (string_to_process): The string that needs processing.
# OUTPUTS:
#   Writes the processed string to stdout.
# RETURN:
#   0 for success, 1 if input is empty.
#######################################

# Source the script containing the function
# Use the full path if the script is not in the same directory
testfunc() {
    set -x
    source ./scripts/shell-idle-check.sh

    # Call the function
    echo "Main script running..."

    # Test bashreload
#   tmux send-keys -t "%2" "bashreload" Enter

    for pane in $(tmux list-panes -aF "#{pane_id}"); do
    #    tmux send-keys -t "$pane" "exec bash" C-m
        tty=$(tmux display-message -t ${pane} -p '#{pane_tty}')
        echo "testing $pane"
        test-pane-with-tty $tty
        echo $pane
        
        $check=$(test-pane-with-tty $tty)

        if (($check==0)); then
            # Needs to only run if it returned the right thing.
            tmux send-keys -t $pane "bashreload" Enter
            echo "$pane reloaded"
        else
            echo "$pane is busy; skipping..."
        fi 
        
         
    done
    bashreload
}

# Example of a Bash Function & Doc
#######################################
# Processes a specific input string.
# GLOBALS:
#   None
# ARGUMENTS:
#   $1 (string_to_process): The string that needs processing.
# OUTPUTS:
#   Writes the processed string to stdout.
# RETURN:
#   0 for success, 1 if input is empty.
#######################################
process_string() {
  local input_str="${1}" # Assign a meaningful name to the positional parameter
  if [ -z "$input_str" ]; then
    echo "Error: Empty input string." >&2
    return 1
  fi
  # ... processing logic ...
  echo "$input_str processed"
  return 0
}

