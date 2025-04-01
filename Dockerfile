FROM node:22.4.1 AS build
WORKDIR /opt/mining_rig_monitor_api_document_src
COPY . /opt/mining_rig_monitor_api_document_src
RUN npm install
RUN npm run build-html

FROM scratch AS release
COPY --from=build /opt/mining_rig_monitor_api_document_src/dist /
