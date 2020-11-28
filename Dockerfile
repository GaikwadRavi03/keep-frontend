# pull official base image
FROM node

# set working directory
WORKDIR /app-f

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app-f/node_modules/.bin:$PATH

# install app dependencies
COPY package.json package-lock.json ./
RUN npm install
RUN npm run build

# add app
COPY . ./

EXPOSE 3000
# start app
CMD ["npm", "start"]
