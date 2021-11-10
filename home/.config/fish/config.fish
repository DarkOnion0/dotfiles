set fish_greeting                         		# Supresses fish's intro message
set EDITOR "nvim ''"                 	    		# $EDITOR use Nvim in terminal
set VISUAL "codium "              		    	# $VISUAL use VSCodium in GUI mode


#welcome.py
neofetch

#
# RANDOM COLORSCHEME ==> https://gitlab.com/dwt1/shell-color-scripts
#
#colorscript random 

# set the default nodejs version to the latest one available
#echo
#nvm install latest

#
# CUSTOM MANPAGER
#
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

#set -x SPICETIFY_INSTALL "/home/dark/spicetify-cli"
#set -x PATH "$SPICETIFY_INSTALL:$PATH"

#
# STARSHIP PROMPT
#

starship init fish | source

#
# ALIAS
#


# alias e='vscodium ' 	                      # VSCodium name in ArchLinux
alias e='codium ' 	                          # VSCodium name in Ubuntu
alias l='exa -la '	                          # set an alias for the l key
alias c='bat '

#alias cat='bat '

alias vim='nvim '	                            # Replace vim by neovim
alias vi='nvim '	                            # Replace vi by neovim
alias ls='exa '		                            # Replace ls by exa
alias python='python3 '

alias k="kubectl "                            # Alias for kuebctl
alias kscan="kubescape scan framework nsa "   # Alias for the scanning k8s clusters

alias tn="tmux new "                          # Create a new tmux session easly
alias ta="tmux attach "                       # Attach a tmux session easly
alias tk="tmux kill-session -t "              # Shortenf to dete tmux session

alias nixos-edit="sudo nvim /etc/nixos/configuration.nix"
alias nixos-switch="sudo nixos-rebuild switch"
alias nixos-clear="sudo nix-collect-garbage"
alias nixos-delroot="sudo nix-collect-garbage -d"
alias nixos-update="sudo nixos-rebuild switch --upgrade"
