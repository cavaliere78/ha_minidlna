FROM arm32v7/ubuntu:eoan

# set version label
ARG BUILD_DATE
ARG VERSION
ARG BUILD_VERSION
ARG BUILD_ARCH
# Add env
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Europe/Rome

# Setup base

RUN apt-get update && apt-get install -y git
RUN apt-get install -y jq
RUN apt-get install -y python
RUN apt-get install -y python-dev
RUN apt-get install -y curl
RUN mkdir /pip
RUN cd /pip && curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python get-pip.py 
RUN mkdir /cw
RUN cd /cw && git clone --branch 0.6.6 https://github.com/janeczku/calibre-web.git . && pip install -r requirements.txt --target vendor

# ADD Calibre for ebook conversion
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get install -y --no-install-recommends calibre


#NGINX
RUN apt-get install -y nginx

#BASHIO
RUN apt-get install -y bash
RUN apt-get install -y ca-certificates 
RUN mkdir -p /tmp/bashio && curl -L -s https://github.com/hassio-addons/bashio/archive/v0.9.0.tar.gz | tar -xzf - --strip 1 -C /tmp/bashio
RUN mv /tmp/bashio/lib /usr/lib/bashio && ln -s /usr/lib/bashio/bashio /usr/bin/bashio
RUN rm -rf /tmp/bashio


#Clean up
RUN apt-get -y purge git
RUN apt-get -y purge python-pip
RUN apt-get -y purge python-dev
RUN apt-get -y autoremove
RUN rm -rf /tmp/* 
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/tmp/*


## Copy data
COPY nginx.conf /etc/
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]