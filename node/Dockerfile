FROM nuagestudio/amazonlinuxbrew

LABEL maintainer="Louis Amon <louis@nuage.studio>"

RUN brew install nodenv yarn \
    && brew cleanup \
    && rm -rf .cache

CMD bash