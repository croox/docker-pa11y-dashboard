FROM node:23-bookworm

ENV PA11Y_VERSION="4.2.0"
ENV PHANTOM_JS_VERSION="1.9.8"
ENV ARCH="x86_64"

WORKDIR /root

RUN apt-get update && apt-get install -y \
    build-essential \
    chromium \
    chrpath \
    libfontconfig1 \
    libfontconfig1-dev \
    libfreetype6 \
    libfreetype6-dev \
    libssl-dev \
    libxft-dev \
    wget

# Install PhantomJS
ENV PHANTOM_JS="phantomjs-$PHANTOM_JS_VERSION-linux-$ARCH"
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
    tar xvjf $PHANTOM_JS.tar.bz2 && \
    mv $PHANTOM_JS /usr/local/share && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin && \
    rm $PHANTOM_JS.tar.bz2

# Install pa11y
RUN git clone https://github.com/pa11y/dashboard.git pa11y-dashboard && \
    cd pa11y-dashboard && \
    git checkout tags/$PA11Y_VERSION && \
    npm install && \
    rm -f config/*

WORKDIR /opt/pa11y-dashboard

COPY production.json config/

EXPOSE 4000
EXPOSE 3000

CMD [ "node", "index.js" ]
