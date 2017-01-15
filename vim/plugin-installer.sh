# run with sudo

set -x

# update .vimrc
cp vimrc ~/.vimrc

# upgrade vim8.0 if necessary (>7.4.143)
VIM_VERSION_BIG=$(vim --version | sed -n '1p' | grep '\d+\.\d' -Po)
VIM_VERSION_SMALL=$(vim --version | sed -n '2p' | grep '\d+-\d+' -Po)
if ! ([ ${VIM_VERSION_BIG%.*} -gt 7 ] || [ ${VIM_VERSION_BIG#*.} -gt 4 ] || [ ${VIM_VERSION_SMALL#*-} -gt 143 ]); then
    git clone https://github.com/vim/vim.git ~/vim
    # python-dev required
    (cd ~/vim && ./configure --with-features=huge --enable-pythoninterp=yes --enable-cscope --enable-fontset --enable-perlinterp --enable-rubyinterp --with-python-config-dir=/usr/lib/python2.7/config --prefix=/usr/local && make && make install)
fi

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install Python-mode
git clone https://github.com/klen/python-mode.git ~/.vim/bundle/python-mode

# install YouCompleteMe
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe/
# python-devel & cmake required
(cd ~/.vim/bundle/YouCompleteMe/ && git submodule update --init --recursive && python install.py)
