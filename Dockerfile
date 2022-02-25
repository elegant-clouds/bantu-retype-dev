FROM node:current AS build
WORKDIR /app
COPY . .
RUN cp retype.yml bantu-developers/
RUN npm install npm --global
RUN npm install retypeapp --global
RUN cd bantu-developers/
RUN retype build

FROM nginx:latest AS final
COPY --from=build /app/bantu-developers/docs /usr/share/nginx/html
EXPOSE 80