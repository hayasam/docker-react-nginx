FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# beanstalk look at dockerfile and llok to expose and map container port directly
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
