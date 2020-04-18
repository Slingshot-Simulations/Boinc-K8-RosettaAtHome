## File to build docker image for Boinc
#
# Originally derived from work done by Chris Klebna <ckleban@gmail.com> and Ozzy Johnson <docker@ozzy.io>. See the repository ozzyjohnson/boinc.

FROM debian:buster

MAINTAINER Richard Kavanagh

ENV DEBIAN_FRONTEND noninteractive

# Update and install minimal.
RUN \
  apt-get update \
    --quiet \
  && apt-get install \
         --yes \
         --no-install-recommends \
         --no-install-suggests \
       boinc-client \

# Clean up packages.
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Data volume.
ONBUILD VOLUME /data

# Getting ready.
WORKDIR /data

# Default command.
ENTRYPOINT ["/usr/bin/boinc"]