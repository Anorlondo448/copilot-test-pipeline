FROM node:14 AS build
WORKDIR /srv
RUN npm install raw-body

FROM node:14-slim
WORKDIR /srv
COPY --from=build /srv .
COPY ./src .
EXPOSE 3000
CMD ["node", "index.js"]
