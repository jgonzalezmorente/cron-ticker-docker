# /app /usr /lib ...
# FROM --platform=linux/amd64 node:19.2-alpine3.16
FROM node:19.2-alpine3.16
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16

# cd app
WORKDIR /app

# dest /app
COPY package.json ./

# Instalar dependencias
RUN npm install

# dest /app
COPY . .

# Realizar testing
RUN npm run test

# Eliminar archivos y directorios no necesarios
RUN rm -rf tests && rm -rf node_modules

# Unicamente las de producción
RUN npm install --prod

# Comando run de la imagen
CMD [ "node", "app.js" ]
