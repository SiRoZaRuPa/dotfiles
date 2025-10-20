#!/bin/bash

files_and_paths=(
  ".config/nvim/lua/plugins:$HOME/.config/nvim/lua/plugins"
  ".config/nvim/lua/config:$HOME/.config/nvim/lua/config"
)

# シンボリックリンクを作成する
create_symlink() {
  local src_file=$(realpath $1)
  local dst_path=$2

  backup_file="${dst_path}.bak"
  if [ -e "$dst_path" ]; then
    mv "$dst_path" "$backup_file"
  fi

  ln -s "$src_file" "$dst_path"
}

for entry in "${files_and_paths[@]}"; do
  IFS=":" read -r src_file dst_path <<<"$entry"
  create_symlink "$src_file" "$dst_path"
done
