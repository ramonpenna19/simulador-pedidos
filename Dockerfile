FROM iojs:slim

COPY package*.json ./

RUN apt-get update && \
    apt-get install -y git

RUN npm install -g sails grunt-cli bower nodejs pm2 npm-check-updates

COPY . .

VOLUME [ "/server" ]

WORKDIR /server

EXPOSE 1337

CMD ["sails", "lift"]
