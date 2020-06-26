FROM nuagestudio/amazonlinuxbrew

LABEL maintainer="Louis Amon <louis@nuage.studio>"

RUN brew install pyenv poetry \
    && brew cleanup \
    && rm -rf .cache

CMD bash