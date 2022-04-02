FROM node:12.16.3-alpine As builder
WORKDIR /usr/src/app

ARG runner

COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.19.10-alpine

COPY configs /etc/nginx
COPY --from=builder /usr/src/app/dist /app
