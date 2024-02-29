# Step 1: Use an official Node.js runtime as a parent image
FROM node:14

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the current directory contents into the container at /app
COPY . .

# Step 4: Install any needed packages specified in package.json
RUN npm install

# Step 5: Make port 3000 available to the world outside this container
EXPOSE 5173

# Step 6: Run npm start to start the app
CMD [ "npm", "run", "preview" ]