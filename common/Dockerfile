FROM amazonlinux

LABEL maintainer="Louis Amon <louis@nuage.studio>"

RUN yum update -y
RUN yum install deltarpm -y

# Homebrew requirements
RUN yum groupinstall 'Development Tools' -y
RUN yum install curl file git sudo which -y

# Create linuxbrew user
# https://hub.docker.com/r/linuxbrew/linuxbrew/dockerfile
RUN useradd -m -s /bin/bash linuxbrew && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
    SHELL=/bin/bash \
    USER=linuxbrew

# Install Homebrew
# https://brew.sh/
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Tap additionnal modules
RUN brew tap homebrew/bundle

# Update Homebrew
RUN brew update

CMD bash
