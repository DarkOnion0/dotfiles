set fish_greeting                                 # Supresses fish's intro message
set EDITOR "nvim ''"                 		  # $EDITOR use Nvim in terminal
set VISUAL "codium "              		  # $VISUAL use VSCodium in GUI mode

welcome.py

#
# RANDOM COLORSCHEME ==> https://gitlab.com/dwt1/shell-color-scripts
#
#colorscript random 

#
# CUSTOM MANPAGER
#
set -x MANPAGER "sh -c 'col -bx | batcat -l man -p'" 

#
# STARSHIP PROMPT
#

starship init fish | source

#
# ALIAS
#


# alias e='vscodium ' # VSCodium name in ArchLinux
alias e='codium ' # VSCodium name in Ubuntu
alias l='exa -la '
alias c='batcat '
alias cat='c '
