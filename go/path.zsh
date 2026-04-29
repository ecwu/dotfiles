export GOPATH="${HOME}/.go"

if [[ -d /opt/homebrew/opt/go/libexec ]]; then
  export GOROOT="/opt/homebrew/opt/go/libexec"
elif [[ -d /opt/homebrew/opt/golang/libexec ]]; then
  export GOROOT="/opt/homebrew/opt/golang/libexec"
fi

path_append "${GOPATH}/bin"
[[ -n "$GOROOT" ]] && path_append "${GOROOT}/bin"
