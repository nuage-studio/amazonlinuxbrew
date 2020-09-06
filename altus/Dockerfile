FROM nuagestudio/amazonlinuxbrew:cirrus

LABEL maintainer="Louis Amon <louis@nuage.studio>"

# PostgreSQL + PostGIS
RUN brew install postgis \
    && brew cleanup \
    && rm -rf .cache

# RUN brew install --only-dependencies qt \
#     && brew cleanup \
#     && rm -rf .cache

# RUN brew update && brew install qt

# FIXME: PostGIS disabled due to a bug in `qt`
# Try: `brew update && brew install qt` from `amazonlinuxbrew`
# to check if the problem is fixed

CMD bash