# The following tells the system where to find the 'brew' command.
# The location of the brew command is different on Intel and Silicon Macs, so the 'uname' command is used to check.

if [[ $(uname -m) == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else 
  eval "$(/usr/local/bin/brew shellenv)"
fi
