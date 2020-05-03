FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# EXPOSE is needed when deploy on AWS elasticbeanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# default command is start nginx. no need to specify here
