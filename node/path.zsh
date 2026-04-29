export NVM_DIR="$HOME/.nvm"

if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  load_nvm() {
    unset -f nvm node npm npx corepack
    . "$NVM_DIR/nvm.sh"
    [[ -s "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"
  }

  nvm() { load_nvm; nvm "$@"; }
  node() { load_nvm; node "$@"; }
  npm() { load_nvm; npm "$@"; }
  npx() { load_nvm; npx "$@"; }
  corepack() { load_nvm; corepack "$@"; }
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
path_prepend "$PNPM_HOME"
# pnpm end
