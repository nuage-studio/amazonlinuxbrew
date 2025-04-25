FROM amazonlinux:2.0.20250414.0

LABEL maintainer="Louis Amon <louis@nuage.studio>"

# Update AmazonLinux
RUN yum update -y

# Homebrew requirements
RUN yum groupinstall 'Development Tools' -y \
    && yum install procps-ng curl file git sudo which -y

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
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && brew tap homebrew/core \
    && brew cleanup \
    && rm -rf .cache

# Install brew bundle (optional)
RUN brew tap homebrew/bundle \
    && brew cleanup \
    && rm -rf .cache

# NB: the trick below allows us to rebuild only that layer of the image whenever we run
# a `docker build` : this way we keep an up-to-date Homebrew without having to rebuild everything
ARG TIMESTAMP=unknown
RUN TIMESTAMP=${TIMESTAMP} brew update \
    && brew upgrade \
    && brew cleanup \
    && rm -rf .cache

CMD bash
