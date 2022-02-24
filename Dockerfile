FROM node:current AS build
WORKDIR /app
COPY bantu-developers/* .
COPY retype.yml .
RUN npm install retypeapp --global
RUN retype build

FROM nginx:latest AS final
COPY --from=build /app/docs /usr/share/nginx/html
EXPOSE 80
