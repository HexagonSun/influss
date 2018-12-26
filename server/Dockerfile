FROM node:8.12.0-alpine
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# npm dependencies
RUN npm install 

# copy other config & sources
COPY tsconfig.json ./
COPY src ./src

# build
RUN npm run build-ci
RUN cp dist/* .

EXPOSE ${INFLUSS_SERVER_API_NODE_PORT}
CMD [ "node", "server.js" ]${}
