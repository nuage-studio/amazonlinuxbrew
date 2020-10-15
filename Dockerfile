FROM amazonlinux AS amazonlinuxbrew

LABEL maintainer="Louis Amon <louis@nuage.studio>"

# Homebrew requirements
RUN yum groupinstall 'Development Tools' -y \
    && yum install curl file git sudo which -y

# Create linuxbrew user
# https://hub.docker.com/r/linuxbrew/linuxbrew/dockerfile
RUN useradd -m -s /bin/bash linuxbrew && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
    SHELL=/bin/bash \
    USER=linuxbrew \
    HOMEBREW_NO_ANALYTICS=1 \
    HOMEBREW_NO_AUTO_UPDATE=1

# Install Homebrew
# https://brew.sh/
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
    && brew tap homebrew/core \
    && brew cleanup \
    && rm -rf .cache

# Install brew bundle (optional)
RUN brew tap homebrew/bundle \
    && brew cleanup \
    && rm -rf .cache

CMD bash