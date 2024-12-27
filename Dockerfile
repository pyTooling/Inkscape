ARG IMAGE
ARG OS_VERSION
ARG PY_VERSION

FROM ${IMAGE}
ARG OS_VERSION
ARG PY_VERSION

# Meta information
LABEL maintainer="Patrick Lehmann <Paebbels@gmail.com>"
LABEL version="0.2"
LABEL description="Inkscape based on Debian ${OS_VERSION} (slim) with Python ${PY_VERSION}."
LABEL org.opencontainers.image.vendor="pyTooling"
LABEL org.opencontainers.image.source="https://github.com/pyTooling/Inkscape.git"

# Install Debian packages
RUN --mount=type=bind,target=/context \
    apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive xargs --no-run-if-empty -a /context/debian.list -- apt-get install -y --no-install-recommends \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean

# Install Python packages
RUN --mount=type=bind,target=/context \
    xargs --no-run-if-empty -a /context/python.list -- pip3 install -U --disable-pip-version-check --break-system-packages

# Install NPM packages
RUN --mount=type=bind,target=/context \
    xargs --no-run-if-empty -a /context/npm.list -- npm -g install

# Install Google Fonts
RUN --mount=type=bind,target=/context \
    cp /context/teko/*.ttf /usr/local/share/fonts \
 && fc-cache -fv \
 && fc-match Teko
