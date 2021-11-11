FROM node:13.3.0 AS builder

WORKDIR /opt
COPY package.json ./
RUN npm install

COPY ./ /opt/
RUN npm run build
RUN ls -la /opt/build

ENTRYPOINT ["npm", "start"]
