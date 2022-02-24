FROM node:current AS build
WORKDIR /app
COPY bantu-developers /app/
COPY retype.yml /app/
RUN npm install npm --global
RUN npm install retypeapp --global
RUN retype build

FROM nginx:latest AS final
COPY --from=build /app/docs /usr/share/nginx/html
EXPOSE 80
