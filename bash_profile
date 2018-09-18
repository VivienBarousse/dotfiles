
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.bash_login" ]] && source "$HOME/.bash_login"
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"

