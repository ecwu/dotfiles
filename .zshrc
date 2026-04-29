export ZSH="$HOME/.oh-my-zsh"

typeset -U path PATH
path_prepend() {
  [[ -d "$1" ]] && path=("$1" $path)
}
path_append() {
  [[ -d "$1" ]] && path+=("$1")
}

autoload -U promptinit; promptinit
prompt pure

#ZSH_THEME="agnoster"
#ZSH_THEME="pure"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git
  zsh-autosuggestions
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

export CUSTOMZSH=$HOME/.dotfiles

if [[ -r ~/.localrc ]]
then
  source ~/.localrc
fi

# all of our zsh files
typeset -U config_files
config_files=($CUSTOMZSH/**/*.zsh(N))

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source "$file"
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source "$file"
done


[[ -r "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

path_prepend "$HOME/.pixi/bin"

# bun completions
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
path_prepend "$BUN_INSTALL/bin"

# Added by Antigravity
path_prepend "$HOME/.antigravity/antigravity/bin"

export PYTHONNOUSERSITE=1

# Added by LM Studio CLI (lms)
path_append "$HOME/.lmstudio/bin"
# End of LM Studio CLI section

export GPG_TTY="$(tty)"
if command -v gpg-connect-agent >/dev/null 2>&1 && [[ -w "$HOME/.gnupg" ]]; then
  gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
fi
