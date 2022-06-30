FROM ubuntu:20.04

ENV TZ=Asia/Jerusalem
ARG DEBIAN_FRONTEND=noninteractive
ENV SSH_PASSWORD ${SSH_PASSWORD:-123456}
# SSH, GIT, Curl
RUN apt-get update -y && apt-get install -y openssh-server git curl
# SSH run dir
RUN mkdir /var/run/sshd
# Setup SSH Password
RUN echo "root:$SSH_PASSWORD" | chpasswd
RUN sed -i 's/\#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

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
