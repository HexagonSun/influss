FROM node:8.12.0-alpine
WORKDIR /app

# dependencies
# COPY ../common/credentials/db.sh ./db.env

# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# build
RUN npm install --only=production

# Bundle js source/dist folder
COPY dist ./

EXPOSE 5005
CMD [ "node", "server.js" ]
