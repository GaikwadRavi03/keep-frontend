# pull official base image
FROM node

# set working directory
WORKDIR /app-f

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app-f/node_modules/.bin:$PATH

ENTRYPOINT ["/bin/bash", "-c", "npm install; npm run build; exec \"${@:0}\";"]
