FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Basic SSHable container (no DE/VNC installed here per request)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       openssh-server sudo\
    && rm -rf /var/lib/apt/lists/*

# Create a user 'user' with a password (change it after first login)
RUN useradd -ms /bin/bash user \
    && echo "user:password" | chpasswd \
    && usermod -aG sudo user

# Prepare sshd
RUN mkdir /var/run/sshd
EXPOSE 22 5901

CMD ["/usr/sbin/sshd","-D"]