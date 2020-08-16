#base directory
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# verify the existence of specific dotfiles
for file in ./.{bash_profile,bashrc,tmux.conf,vimrc,zshrc,alias}; do
	if [ -r "$file" ] && [ -f "$file" ]; then
		# trim the dot and fslash for the $file variable
        # result will be .<file> instead of ./.<file>
		file=`echo $file | sed 's:^\./*::g'`

		# create symlink in users home directory
		ln -s ${BASEDIR}/${file} ~/${file}
		echo "[*] symlink for ${file} has been placed in home directory"
	fi;
done;

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins
echo '[*] tmux plugin manager installed'

# update tmux plugins
~/.tmux/plugins/tpm/bin/update_plugins all
echo '[*] tmux plugins updated'
