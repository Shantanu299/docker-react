FROM node:alpine as builder
WORKDIR /reactapp
COPY package.json .
RUN npm config set registry http://registry.npmjs.org/ ; npm install
COPY . .
RUN ["npm","run","build"]

FROM nginx 
COPY --from=builder /reactapp/build /usr/share/nginx/html
