# pull official base image
FROM node

# set working directory
WORKDIR /app-f

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app-f/node_modules/.bin:$PATH

# install app dependencies
COPY package.json package-lock.json ./

RUN CI=true

RUN npm install -s && npm install serve

# add app
COPY . ./

RUN npm run build

EXPOSE 3000
