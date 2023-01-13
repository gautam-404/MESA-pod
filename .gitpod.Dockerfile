# syntax=docker/dockerfile:labs
FROM gitpod/workspace-base
SHELL ["/usr/bin/zsh", "-c"]

USER root
RUN <<EOF
    apt-get update 
    yes | apt-get install build-essential software-properties-common curl \
        binutils make perl libx11-6 libx11-dev zlib1g zlib1g-dev tcsh procps \
        xorg openbox
    apt-get clean
    rm -rf /var/lib/apt/lists/* /tmp/*
EOF

USER gitpod
ENV SHELL=/usr/bin/zsh
### C/C++ ###
RUN <<EOF
    curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - 
    apt-add-repository -yu "deb http://apt.llvm.org/cosmic/ llvm-toolchain-cosmic-6.0 main" 
    apt-get install -yq \
        clang-format-6.0 \
        clang-tools-6.0 \
        cmake 
    ln -s /usr/bin/clangd-6.0 /usr/bin/clangd 
    apt-get clean 
    rm -rf /var/lib/apt/lists/* /tmp/*
EOF
### Python ###
ENV PATH=$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH
RUN <<EOF
    curl -fsSL https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | zsh 
    echo 'eval "$(pyenv init -)"' >> .zshrc 
    echo 'eval "$(pyenv virtualenv-init -)"' >> .zshrc 
    pyenv install 3.11.1
    pyenv global 3.11.1
    pip install virtualenv pipenv pylance
    rm -rf /tmp/*
EOF
RUN <<EOF
    yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    wget https://gist.githubusercontent.com/renbaoshuo/93f75878fe29cf9ad48a675abd69ef97/raw/3b4ddd4f190af6c6466e07da0850618a9c208353/codespaces.zsh-theme \
    -O ~/.oh-my-zsh/custom/themes/codespaces.zsh-theme
    zsh -lic "omz theme set codespaces"
EOF
    
USER root
