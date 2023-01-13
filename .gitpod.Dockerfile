FROM gitpod/workspace-full
SHELL ["/usr/bin/zsh", "-c"]

USER root
ENV SHELL=/usr/bin/zsh
RUN apt-get update && yes | apt-get install build-essential software-properties-common curl binutils make perl libx11-6 libx11-dev zlib1g zlib1g-dev tcsh procps \
    && pyenv install 3.11.1 \
    && pyenv global 3.11.1
RUN mkdir ~/software \
    && yes n | zsh -c "$(curl -fsSL https://gist.githubusercontent.com/gautam-404/b1a29e83b27c487ee3220bb6a9f9aa9c/raw/2f1b9b60e24923687427c63b14bc8829cc3e28da/gitpod-install-mesa.sh)"

USER gitpod
ENV SHELL=/usr/bin/zsh
RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && wget https://gist.githubusercontent.com/renbaoshuo/93f75878fe29cf9ad48a675abd69ef97/raw/3b4ddd4f190af6c6466e07da0850618a9c208353/codespaces.zsh-theme -O ~/.oh-my-zsh/custom/themes/codespaces.zsh-theme \
    && zsh -lic "omz theme set codespaces"
    
USER root
