FROM node:current AS build
WORKDIR /app
COPY . .
RUN cp retype.yml bantu-developers/ && npm install npm --global && npm install retypeapp --global && cd bantu-developers/ && retype build

FROM nginx:latest AS final
COPY --from=build /app/bantu-developers/docs /usr/share/nginx/html
EXPOSE 80