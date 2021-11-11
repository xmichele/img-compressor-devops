FROM node:13.3.0 AS builder
#RUN npm install -g yarn

WORKDIR /opt
COPY package.json ./
RUN npm install
COPY ./ /opt/
RUN npm run build
RUN ls -la /opt/build

#FROM nginx:stable
#COPY --from=builder /opt/build/ /usr/share/nginx/html/
#COPY nginx.conf /etc/nginx/conf.d/default.conf

#COPY docker_run.sh /docker_run.sh
ENTRYPOINT ["npm", "start"]
