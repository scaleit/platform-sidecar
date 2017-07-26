FROM node

RUN npm install -g coffee-script

WORKDIR /app

COPY package.json package.json
RUN npm install

COPY test-app.coffee test-app.coffee

CMD ["coffee", "test-app.coffee"]
