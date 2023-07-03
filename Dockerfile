# Use a base Node.js image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Expose a port (optional, if your application listens on a specific port)
EXPOSE 3000

# Define the command to run your application
CMD [ "node", "app.js" ]
