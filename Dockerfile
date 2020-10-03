ARG BUILD_FROM
FROM $BUILD_FROM

# set version label
ARG BUILD_DATE
ARG VERSION
ARG BUILD_VERSION
ARG BUILD_ARCH
# Add env
ENV LANG C.UTF-8
ENV TZ=Europe/Rome

# Setup base
# install minidlna
RUN apk add --no-cache minidlna

# Copy data

COPY run.sh /
RUN chmod a+x /run.sh

COPY minidlna.conf /etc/minidlna.conf

CMD [ "/run.sh" ]