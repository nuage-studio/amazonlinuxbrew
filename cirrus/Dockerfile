FROM nuagestudio/amazonlinuxbrew:node
FROM nuagestudio/amazonlinuxbrew:python

LABEL maintainer="Louis Amon <louis@nuage.studio>"

# Taskfile
RUN brew install go-task/tap/go-task \
    && brew cleanup \
    && rm -rf .cache

CMD bash