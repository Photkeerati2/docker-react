FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM  nginx
#copy from previous phase
COPY --from=builder /app/build /usr/share/nginx/html 

# no need to run any command because enginx auto start 
