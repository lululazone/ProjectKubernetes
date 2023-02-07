# Use an official image as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json into the container
COPY package.json ./


# Install the dependencies
RUN npm install

# Copy the rest of the files into the container
COPY . .

# Specify the command to run when the container starts
CMD ["npm", "start"]
