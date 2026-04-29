if [[ -x "$HOME/miniconda3/bin/conda" ]]; then
  attach_conda() {
    eval "$("$HOME/miniconda3/bin/conda" shell.zsh hook)"
  }

  conda() {
    attach_conda
    conda "$@"
  }
fi
