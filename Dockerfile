# ============ Multiple step builds =======
# this multi step build is required here for production release becoz after
# running the build command will create just a build folder that contains all our
# file including html,css, javascript etc
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

