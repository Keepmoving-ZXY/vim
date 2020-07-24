cd ~ 

# install vim dependency
sudo yum install -y ruby ruby-devel lua lua-devel luajit \
  luajit-devel ctags git python python-devel \
  python3 python3-devel tcl-devel \
  perl perl-devel perl-ExtUtils-ParseXS \
  perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
  perl-ExtUtils-Embed

git clone https://github.com/vim/vim.git
cd vim

VIMDIR='/home/zxy/.local/'
./configure --with-features=huge \
	--enable-multibyte \
	--enable-rubyinterp=yes \
	--enable-python3interp=yes \
	--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
	--enable-perlinterp=yes \
	--enable-luainterp=yes \
	--enable-gui=gtk2 \
	--enable-cscope \
	--prefix=${VIMDIR}

make -j 40
make install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim colortheme
mkdir ~/.vim
git clone https://github.com/NLKNguyen/papercolor-theme.git
cp papercolor-theme/colors ~/.vim/ -r

git clone https://github.com/NLKNguyen/c-syntax.vim
cp c-syntax.vim/after ~/.vim -r

# install ctags
cd ~
git clone https://github.com/universal-ctags/ctags.git
cd ctags
sh autogen.sh
./configure
make 
sudo make install

# get newest vimrc
cd /tmp
git clone https://github.com/Keepmoving-ZXY/vim.git
cd vim
cp .vimrc ~
cp .ycm_extra_conf.py ~
cd ~

# install plugin
alias vim='~/.local/bin/vim'
vim -c PlugInstall -c q -c q

# compile ycm.core
cd ~/.vim/autoload/YouCompleteMe
python3 install.py --clang-completer
cd ~

rm -rf vim 
rm -rf ctags
echo "Finish"
