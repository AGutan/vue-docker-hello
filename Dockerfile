FROM node:15

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY ./ ./

# install project dependencies
RUN yarn install

# build app for production with minification
RUN yarn run build

# install simple http server for serving static content
RUN yarn global add http-server

EXPOSE 8080
CMD [ "http-server", "dist" ]