# make sure CMake has been installed properly!

# update .vimrc
cp vimrc ~/.vimrc

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install Python-mode
git clone https://github.com/klen/python-mode.git ~/.vim/bundle/python-mode

# install YouCompleteMe
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe/
(cd ~/.vim/bundle/YouCompleteMe/ && git submodule update --init --recursive && python install.py)
