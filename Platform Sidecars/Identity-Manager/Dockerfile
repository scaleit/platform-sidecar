FROM node

RUN npm install -g coffee-script

WORKDIR /app

COPY package.json package.json
RUN npm install

COPY identity-manager-server.coffee identity-manager-server.coffee
#RUN coffee -c identity-manager-server.coffee

CMD ["coffee", "identity-manager-server.coffee"]
