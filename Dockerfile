FROM node:23

LABEL maintainer="marcus leong"
LABEL version = "1"

# Create a work directory
WORKDIR /app

# Copy files over to destination (image)
# Files can just put a dot but diretories need to give a directory name
COPY main.js .
COPY metrics.js .
COPY package.json .
COPY package-lock.json .
COPY public public
COPY views views

# Build the applicaiton/ Install the pacakages
RUN npm ci --omit-dev

# Run the application
ENV PORT=3000 

EXPOSE ${PORT}

# Remove warning error
SHELL ["/bin/sh","-c"]

ENTRYPOINT node main.js

