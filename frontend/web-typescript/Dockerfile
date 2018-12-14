FROM nginx:1.14-alpine

# substitution: configure API host/port from env-vars
COPY conf/001_influss-web-typescript.conf.template /etc/nginx/conf.d/001_influss-web-typescript.conf.template
CMD envsubst '${INFLUSS_SERVER_EXTERNAL_API_HOST} ${INFLUSS_SERVER_EXTERNAL_API_PORT}' < /etc/nginx/conf.d/001_influss-web-typescript.conf.template > /etc/nginx/conf.d/001_influss-web-typescript.conf && exec nginx -g 'daemon off;'

WORKDIR /app

# apk add --update nodejs
RUN apk update && apk add npm

# copy other config & sources
COPY *.json ./
RUN npm install

# build
COPY src ./src
RUN npm run build-ci
RUN cp dist/* /usr/share/nginx/html/
