FROM node:12.16.1

WORKDIR /usr/src/app

COPY package*.json ./

COPY .npmrc ./

RUN npm install --no-optional && npm cache clean  --force

COPY . .

RUN npm run build

ENTRYPOINT [ "/usr/src/app/microservice-entrypoint.sh" ]

EXPOSE 3022

CMD [ "npm", "start" ]
