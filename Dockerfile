FROM ubuntu:20.04

RUN apt update -y && apt install -y gcc make git binutils libc6-dev zsh wget
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

RUN mkdir /9cc

WORKDIR /9cc

COPY . /9cc
ADD ./.zshrc /root/.zshrc
