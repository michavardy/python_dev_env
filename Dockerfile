FROM ubuntu:20.04

ENV TZ=Asia/Jerusalem
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y git curl
# Vim stuff
RUN apt-get install -y vim
## Vundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
# tmux - terminal session multiplexer 
RUN apt-get install -y tmux
# python
RUN apt install -y python3.9
# Other Linux Tools
RUN apt install -y net-tools netcat tree fzf bat unzip
EXPOSE 3000
CMD ["/bin/bash"]
