# vim 7.4.143+ and CMake required
# run with sudo

set -x

# update .vimrc
cp vimrc ~/.vimrc

# upgrade vim8.0
git clone https://github.com/vim/vim.git ~/vim
# python-dev required
(cd ~/vim && ./configure --with-features=huge --enable-pythoninterp=yes --enable-cscope --enable-fontset --enable-perlinterp --enable-rubyinterp --with-python-config-dir=/usr/lib/python2.7/config --prefix=/usr/local && make && make install)


# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install Python-mode
git clone https://github.com/klen/python-mode.git ~/.vim/bundle/python-mode

# install YouCompleteMe
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe/
# python-dev required
(cd ~/.vim/bundle/YouCompleteMe/ && git submodule update --init --recursive && sh install.sh)
