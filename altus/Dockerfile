FROM nuagestudio/amazonlinuxbrew

LABEL maintainer="Louis Amon <louis@nuage.studio>"

# Node
RUN brew install nodenv yarn \
    && brew cleanup \
    && rm -rf .cache

# Python
RUN brew install pyenv poetry \
    && brew cleanup \
    && rm -rf .cache

# Taskfile
RUN brew install go-task/tap/go-task \
    && brew cleanup \
    && rm -rf .cache

# PostgreSQL + PostGIS
RUN brew install postgis \
    && brew cleanup \
    && rm -rf .cache

CMD bash