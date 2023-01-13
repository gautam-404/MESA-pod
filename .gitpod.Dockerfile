FROM gitpod/workspace-base
SHELL ["/usr/bin/zsh", "-c"]

USER root
ENV SHELL=/usr/bin/zsh
RUN apt-get update && yes | apt-get install build-essential curl binutils make perl libx11-6 libx11-dev zlib1g zlib1g-dev libssl-dev tcsh procps
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.zprofile \
    && echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile \
    && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
    && brew install gcc 
RUN brew install pyenv \
    && echo "alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'" >> ~/.zprofile \
    && pyenv install 3.11.1 \
    && pyenv global 3.11.1

USER gitpod
ENV SHELL=/usr/bin/zsh
RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && wget https://gist.githubusercontent.com/renbaoshuo/93f75878fe29cf9ad48a675abd69ef97/raw/3b4ddd4f190af6c6466e07da0850618a9c208353/codespaces.zsh-theme -O ~/.oh-my-zsh/custom/themes/codespaces.zsh-theme \
    && zsh -lic "omz theme set codespaces"
RUN mkdir ~/software \
    && wget https://gist.githubusercontent.com/gautam-404/b1a29e83b27c487ee3220bb6a9f9aa9c/raw/2f1b9b60e24923687427c63b14bc8829cc3e28da/gitpod-install-mesa.sh -O ~/software \
    && yes n| zsh ~/software/gitpod-install-mesa.sh

USER root
