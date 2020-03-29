# Use the base image
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .

# dependencies
RUN npm install
COPY . .

#commands
RUN npm run build

# second block of Run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
