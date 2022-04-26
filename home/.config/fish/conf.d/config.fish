#####################
## STARSHIP PROMPT ##
#####################

starship init fish | source

######################
## AUTOTSTART STUFF ##
######################

direnv hook fish | source

echo External IP: (curl -s https://cloudflare.com/cdn-cgi/trace | grep ip | sed -s 's|ip=||g')

#welcome.py

#neofetch

#colorscript random # RANDOM COLORSCHEME ==> https://gitlab.com/dwt1/shell-color-scripts

# set the default nodejs version to the latest one available
#echo
#nvm install latest

###################
## ENV Variables ##
###################

set fish_greeting											# Supresses fish's intro message
set EDITOR "nvim ''"										# $EDITOR use Nvim in terminal
set VISUAL "codium "										# $VISUAL use VSCodium in GUI mode

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"			# Custom manpager

###########
## ALIAS ##
###########

#alias e='vscodium '										# VSCodium name in ArchLinux
#alias e='codium '											# VSCodium name in Ubuntu
alias e='nvim '											    # Replace e by neovim to bind it like the vim command to open files
alias vi='nvim '											# Replace vi by neovim
alias j='just '											    # Replace the long just command by a shorther one
alias python='python3 '                                     # Alias python for some distro

alias c='bat '
alias ls='exa '												# Replace ls by exa
alias l='exa -al '											# set an alias for the l key

alias k="kubectl "											# Alias for kuebctl
alias h="helm "												# Alias for helm
alias kscan="kubescape scan framework nsa "					# Alias for the scanning k8s clusters

alias tn="tmux new "										# Create a new tmux session easly
alias ta="tmux attach "										# Attach a tmux session easly
alias tk="tmux kill-session -t	"							# Shortend to delete tmux session

alias nixos-edit="sudo nvim /etc/nixos/configuration.nix"	# Shortcut to edit my main nixos config gile
alias nixos-switch="sudo nixos-rebuild switch"				# Shortcut to nixos command
alias nixos-clear="sudo nix-collect-garbage"
alias nixos-delroot="sudo nix-collect-garbage -d"
alias nixos-update="sudo nixos-rebuild switch --upgrade"

alias tmuxLaunch="tmux attach -t default-session || tmux new -s default-session"

#alias dd="dd status=progress"								# Add the status progress by defauflt on the dd command

alias lutris-wine="sudo sh -c 'sysctl -w abi.vsyscall32=0' && lutris" # Add the specific runtime option to lutris to run League Of Legends under linux

alias g="git "												# Add an alias for git
alias gs="git status "
alias gl="git log "
alias gc="git commit "
alias gp="git push "
alias gpl="git pull "

alias f="fzf "
alias ff="fzf --preview 'bat --color "always" {}' "
