FROM node

RUN npm install -g coffee-script

WORKDIR /app

COPY package.json package.json
RUN npm install

COPY license-manager.coffee license-manager.coffee

CMD ["coffee", "license-manager.coffee"]
