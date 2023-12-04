# based on https://github.com/puppeteer/puppeteer/blob/master/docs/troubleshooting.md#running-puppeteer-in-docker

FROM node:20-slim
RUN apt-get -q update \
    && apt-get install -y -qq wget gnupg make \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get -q update \
    && apt-get install -y -qq google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN npm i puppeteer \
    # Add user so we don't need --no-sandbox.
    # same layer as npm install to keep re-chowned files from using up several hundred MBs more space
    && groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /node_modules

RUN     PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1 npm install -g pageres-cli
COPY    . .
ENV     PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-unstable
WORKDIR /workdir
USER    pptruser
