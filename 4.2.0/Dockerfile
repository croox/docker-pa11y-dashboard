FROM ubuntu:18.04
LABEL maintainer="Croox <https://github.com/croox>"

ENV PA11Y_VERSION="4.2.0"
ENV NODE_VERSION="14.17.3"
ENV PHANTOM_JS_VERSION="1.9.8"
ENV ARCH="x86_64"

ENV PHANTOM_JS="phantomjs-$PHANTOM_JS_VERSION-linux-$ARCH"

WORKDIR /opt

RUN apt-get update && apt-get install -y \
    build-essential \
    chrpath \
    curl \
    git \
    libfontconfig1 \
    libfontconfig1-dev \
    libfreetype6 \
    libfreetype6-dev \
    libglu1 \
    libssl-dev \
    libxft-dev \
    libxshmfence1

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt-get update && \
    apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Install Volta and Node.js
RUN curl https://get.volta.sh | bash && \
    echo "export PATH=$PATH:/root/.volta/bin" >> /root/.bashrc && \
    /root/.volta/bin/volta install node@$NODE_VERSION

ENV PATH /root/.volta/bin:$PATH

# Install PhantomJS
RUN curl -OL https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
    tar xvjf $PHANTOM_JS.tar.bz2 && \
    mv $PHANTOM_JS /usr/local/share && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin && \
    rm $PHANTOM_JS.tar.bz2

# Install pa11y
RUN git clone https://github.com/pa11y/dashboard.git pa11y-dashboard && \
    cd pa11y-dashboard && \
    git checkout tags/$PA11Y_VERSION && \
    /root/.volta/bin/npm install && \
    rm -f config/*

WORKDIR /opt/pa11y-dashboard

COPY production.json config/

EXPOSE 4000
EXPOSE 3000

CMD [ "/root/.volta/bin/node", "index.js" ]
