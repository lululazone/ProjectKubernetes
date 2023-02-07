# Use an official image as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json into the container
COPY package.json ./


# Install the dependencies
RUN npm install --ignore-scripts

# Copy the rest of the files into the container
COPY . .


