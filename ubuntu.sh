##script to install package for Ubuntu 16.04

#setup for later install#{{{
sudo apt-get -y update
sudo apt-get -y install git
#}}}
#install font#{{{
mkdir -p ~/.local/share/fonts
cp ./Fonts/* ~/.local/share/fonts -f
fc-cache -f -v
#}}}
#install zsh#{{{
sudo apt-get -y install zsh
sudo sed -i 's/bin\/bash/usr\/bin\/zsh/g' /etc/passwd
#}}}
#compile vim from source#{{{
sudo apt install -y libncurses5-dev libgnome2-dev libgnomeui-dev
sudo apt install -y libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev
sudo apt install -y libx11-dev libxpm-dev libxt-dev python-dev
sudo apt install -y python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git
sudo apt remove -y vim vim-runtime gvim
sudo apt remove -y vim-tiny vim-common vim-gui-common vim-nox
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
	--enable-multibyte \
	--enable-rubyinterp=yes \
	--enable-pythoninterp=yes \
	--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
	--enable-python3interp=yes \
	--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
	--enable-perlinterp=yes \
	--enable-luainterp=yes \
	--enable-gui=gtk2 \
	--enable-cscope \
	--prefix=/usr/local
sudo make install
cd ..
sudo rm -rf vim
#}}}
#setup for YouCompleteMe#{{{
sudo apt-get -y install build-essential cmake
#}}}
#setup dotfiles#{{{
cd ~
git clone https://github.com/fengmzhu/dotfiles_alpine.git
cd dotfiles_alpine
./setup
#}}}
#ssh-keygen#{{{
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
#}}}
#useful tools#{{{
sudo apt-get -y install ranger tmux
#}}}
