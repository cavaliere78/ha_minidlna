FROM arm32v7/debian:testing-slim

# set version label
ARG BUILD_DATE
ARG VERSION
# Add env
ENV LANG C.UTF-8
# Setup base

RUN apt-get update && apt-get install -y git
RUN apt-get install -y jq
#RUN apt-get install -y python-pip
RUN apt-get install -y python
RUN apt-get install -y python-dev
RUN apt-get install -y curl
RUN mkdir /pip
RUN cd /pip && curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python get-pip.py 
RUN mkdir /cw
RUN cd /cw && git clone https://github.com/janeczku/calibre-web.git . && pip install -r requirements.txt --target vendor	

# ADD Calibre for ebook conversion
RUN apt-get install -y calibre
##RUN apt-get install -y unrar

##Clean up
##RUN apt-get -y purge git
##RUN apt-get -y purge python-pip
##RUN apt-get -y purge python-dev
##RUN apt-get -y purge jq
##RUN apt-get -y autoremove

##RUN rm -rf /tmp/* 
##RUN rm -rf /var/lib/apt/lists/*
##RUN rm -rf /var/tmp/*


## Copy data
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]