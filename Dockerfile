#Building phase

FROM node:16-alpine as builder
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

#Running phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#docker build -t prod . | docker run -p 8080:80 prod 