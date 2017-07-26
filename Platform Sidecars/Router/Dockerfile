FROM node

RUN npm install -g coffee-script

WORKDIR /app

COPY package.json package.json
RUN npm install

COPY router.coffee router.coffee

CMD ["coffee", "router.coffee"]
