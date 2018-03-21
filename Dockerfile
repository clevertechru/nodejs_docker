FROM node:9-alpine

LABEL vendor="clevertechru"
RUN apk update && \
    apk upgrade && \
    apk add git

ENV APP_PATH=/usr/src/app
WORKDIR $APP_PATH
COPY . .
RUN npm cache verify && \
    npm install --silent --progress=false --production
RUN touch .env
RUN chown -R node:node $APP_PATH/*
USER node
EXPOSE 3000
CMD ["npm", "start"]
