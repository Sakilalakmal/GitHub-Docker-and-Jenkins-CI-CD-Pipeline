# Use the latest version of the Node.js image as the base image
FROM node:22-alpine

# Set the working directory inside the container to /usr/src/app
WORKDIR /usr/src/app  

# Copy package.json first for better Docker layer caching
COPY nodeapp/package.json ./

# Run the npm install command to install the dependencies specified in package.json
RUN npm install

# Copy the rest of the application code
COPY nodeapp/ ./  

# Expose port 3000 to allow incoming connections to the container
EXPOSE 3000  

# Start the application by running the "npm start" command
CMD [ "npm", "start" ]  
