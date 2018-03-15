# docker build -t alvisisme/cpp-dev .
FROM alvisisme/docker-ubuntu-non-root-with-utils

LABEL maintainer="Alvis<alvisisme@gmail.com>"

ENV LANG C.UTF-8

# install on-my-zsh
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y zsh && \
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/dev/.oh-my-zsh && \
    cp /home/dev/.oh-my-zsh/templates/zshrc.zsh-template /home/dev/.zshrc

# install vim C/C++ development environment
RUN git clone https://github.com/alvisisme/vimrc-cpp.git /home/dev/.vim_runtime && \
    sh /home/dev/.vim_runtime/install_vimrc.sh

CMD [ "/bin/zsh" ]