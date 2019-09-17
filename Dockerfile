# Build phase
FROM node:12.10.0-alpine AS builder
WORKDIR /usr/src/service
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/service/build /usr/share/nginx/html
