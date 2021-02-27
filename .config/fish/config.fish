set fish_greeting                                 # Supresses fish's intro message
set EDITOR "nvim ''"                 		      # $EDITOR use Emacs in terminal
set VISUAL "codium "              		          # $VISUAL use Emacs in GUI mode


#
# RANDOM COLORSCHEME ==> https://gitlab.com/dwt1/shell-color-scripts
#
colorscript random 

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

alias e='codium '       # VSCodium name in Ubuntu
alias l='exa -la '      # shortcut with exa 
alias c='batcat '       # shortcut for bat 
alias cat='c '          # replace cat by bat