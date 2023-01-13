FROM gitpod/workspace-base:latest
SHELL ["/usr/bin/zsh", "-c"]

USER root
RUN <<EOF
    apt-get update 
    apt-get install -yq build-essential software-properties-common curl \
        binutils make perl libx11-6 libx11-dev zlib1g zlib1g-dev tcsh procps 
EOF

USER gitpod
ENV SHELL=/usr/bin/zsh
### C/C++ ###
RUN <<EOF
    curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add - 
    sudo apt-add-repository -yu "deb http://apt.llvm.org/cosmic/ llvm-toolchain-cosmic-6.0 main" 
    sudo apt-get install -yq \
        clang-format-6.0 \
        clang-tools-6.0 \
        cmake 
    sudo ln -s /usr/bin/clangd-6.0 /usr/bin/clangd
EOF
### Python ###
ENV PATH=$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH
RUN <<EOF
    curl -fsSL https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | zsh 
    echo 'eval "$(pyenv init -)"' >> .zshrc 
    echo 'eval "$(pyenv virtualenv-init -)"' >> .zshrc 
    pyenv install 3.11.1
    pyenv global 3.11.1
    pip install virtualenv pipenv
EOF
RUN <<EOF
    yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    wget https://gist.githubusercontent.com/renbaoshuo/93f75878fe29cf9ad48a675abd69ef97/raw/3b4ddd4f190af6c6466e07da0850618a9c208353/codespaces.zsh-theme \
    -O ~/.oh-my-zsh/custom/themes/codespaces.zsh-theme
    zsh -lic "omz theme set codespaces"
EOF
    
USER root
