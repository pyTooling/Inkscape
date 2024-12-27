# Docker Image for Inkscape to generate and convert SVG logos

This repository is based on [debian:bookworm-slim](https://hub.docker.com/_/debian).

Docker Hub: https://hub.docker.com/r/pytooling/inkscape

## Usage


## Installed Tools

Installed additional tools are:

* Inkscape
* [Debian](debian.packages)
  * curl
  * xauth
  * xvfb
* [NPM](npm.packages)
  * [svgo](https://github.com/svg/svgo) - SVG Optimizer
* [Python](python.packages)
  * [svgwrite](https://github.com/mozman/svgwrite) (Jan. 2012: maintenance mode, March 2022: inactive, Aug. 2024: archived)

## Installed Fonts

* [Google Fonts](https://github.com/google/fonts)
  * [Teko](https://github.com/google/fonts/tree/main/ofl/teko) ([OFL 1.1](https://github.com/google/fonts/blob/main/ofl/teko/OFL.txt))
