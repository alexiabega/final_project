FROM node:14-alpine

WORKDIR /web_client

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
