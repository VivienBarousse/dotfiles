files="bashrc bash_profile bash_login bash_logout gitconfig vimrc vim rbenv nodenv pyenv"
source_dir=`pwd`

git submodule init
git submodule update

for file in $files; do
  if [ -e "$source_dir/$file" ]; then
    if [ -e "$HOME/.$file" ]; then
      mv "$HOME/.$file" "$HOME/.$file.bck"
      echo "Moving $HOME/.$file to $HOME/.$file.bck"
    fi
    ln -s "$source_dir/$file" "$HOME/.$file"
    echo "Linking $source_dir/$file to $HOME/.$file"
  fi
done

mkdir -p "$source_dir/rbenv/plugins/"
ln -s "$source_dir/rbenv-ruby-build" "$source_dir/rbenv/plugins/ruby-build"

mkdir -p "$source_dir/nodenv/plugins/"
ln -s "$source_dir/nodenv-node-build" "$source_dir/nodenv/plugins/node-build"

echo "Linking $source_dir/rbenv-ruby-build to $source_dir/rbenv/plugins/ruby-build"

