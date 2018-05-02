# docker build -t alvisisme/cpp-dev .
FROM alvisisme/docker-ubuntu-non-root-with-utils

LABEL maintainer="Alvis<alvisisme@gmail.com>"

ENV LANG C.UTF-8

RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y cmake g++

# zsh and on-my-zsh
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y zsh && \
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc && \
    sudo chsh -s /bin/zsh

# tmux
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y tmux && \
    echo 'set-option -g default-shell /bin/zsh' > ~/.tmux.conf

# vim C/C++ development environment
RUN git clone https://github.com/alvisisme/vimrc-cpp.git ~/.vim_runtime && \
    sh ~/.vim_runtime/install_vimrc.sh && \
    vim -N -u ~/.vimrc -c "PlugInstall" -c "qall" -U NONE -i NONE -e -s

# python related
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python python3 python-pip && \
    pip install --upgrade pip && \
    pip install cheat

CMD [ "/usr/bin/tmux" ]
