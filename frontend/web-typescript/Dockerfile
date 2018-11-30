FROM nginx:1.14-alpine
COPY dist /usr/share/nginx/html

# substitution: configure API host/port from env-vars
COPY conf/001_influss-web-typescript.conf.template /etc/nginx/conf.d/001_influss-web-typescript.conf.template
CMD envsubst '${INFLUSS_SERVER_EXTERNAL_API_HOST} ${INFLUSS_SERVER_EXTERNAL_API_PORT}' < /etc/nginx/conf.d/001_influss-web-typescript.conf.template > /etc/nginx/conf.d/001_influss-web-typescript.conf && exec nginx -g 'daemon off;'
