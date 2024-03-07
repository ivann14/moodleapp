## BUILD STAGE
FROM node:18.18.2

# Update platform dependencies
RUN apt-get update && apt-get install libsecret-1-0 -y && apt-get install dos2unix -y

WORKDIR /app
COPY ./ /app

# Set permissions for /app
RUN chmod 777 /app

RUN npm install

# NPM Install does not work with only LF endings, it works with CRLF endings
# However, npm start works only with LF endings
# RUN find /app -type f -exec dos2unix {} \;

EXPOSE 8100
CMD [ "npm", "start" ]
