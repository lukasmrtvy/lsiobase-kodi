FROM lsiobase/ubuntu:bionic

ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="<your github username here>"

ARG KODI_VERSION
ENV KODI_VERSION=${KODI_VERSION:-2:17.6+git20180430.1623-final-0bionic}

ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME="/config"

RUN \
     apt-get update && apt install -y software-properties-common && \
     add-apt-repository -y ppa:team-xbmc/ppa && \
     apt-get install -y --no-install-recommends kodi=${KODI_VERSION} kodi-pvr-iptvsimple i965-va-driver

COPY root/ /

EXPOSE 8080 9090 9777/udp

VOLUME ["/config/.kodi"]
