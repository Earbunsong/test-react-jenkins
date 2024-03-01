# # Step 1: Use an official Node.js runtime as a parent image
# FROM node:18-alpine
# # Step 2: Set the working directory in the container
# WORKDIR /app

# # Step 3: Copy the current directory contents into the container at /app
# COPY . .

# # Step 4: Install any needed packages specified in package.json
# RUN npm install


# # Step 6: Run npm start to start the app
# CMD [ "npm", "run", "dev" ]


# # Use an official Node.js runtime as a parent image
# FROM node:14-alpine

# # Set the working directory in the container
# WORKDIR /usr/src/app

# # Copy package.json and package-lock.json to the working directory
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of the application code to the working directory
# COPY . .

# # Build the Next.js application
# RUN npm run build

# # Expose port 3000 to the outside world
# EXPOSE 3000

# # Run the Next.js application
# CMD ["npm", "start"]


FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 8081

CMD [ "npm", "run", "dev" ]

# Build the React component
RUN npm run build

# Stage 2: Serve the React component with a lightweight HTTP server
FROM nginx:alpine

# Copy the build output from the previous stage to the NGINX directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 5173

# Command to run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]

