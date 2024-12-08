FROM node:20

USER node
WORKDIR /home/node/app

ENV NODE_ENV=production
COPY --chown=node:node package.json package-lock.json ./
RUN npm ci --production

COPY --chown=node:node . .
RUN npm run build

EXPOSE 1337
CMD ["npm", "run", "start"]