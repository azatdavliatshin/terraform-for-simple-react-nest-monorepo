# Use an official node runtime as a parent image
FROM node:20

# Set the working directory
WORKDIR /usr/src/app

# Copy the rest of the application code
COPY . .

# Install dependencies
RUN npm install -g pnpm
RUN pnpm install

# Expose the port the app runs on
EXPOSE 3000

# Run the app
CMD [ "pnpm", "start" ]
