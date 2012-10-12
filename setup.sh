files="bashrc bash_login bash_logout vimrc"
source_dir=`pwd`

for file in $files; do
  if [ -f "$source_dir/$file" ]; then
    if [ -e "$HOME/.$file" ]; then
      mv "$HOME/.$file" "$HOME/.$file.bck"
    fi
    ln -s "$source_dir/$file" "$HOME/.$file"
  fi
done
