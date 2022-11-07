FROM node:14-buster as client-builder
WORKDIR /src
# cache packages in layer
COPY client/package.json /src/package.json
COPY client/yarn.lock /src/yarn.lock
RUN --mount=type=cache,target=/root/.yarn YARN_CACHE_FOLDER=/root/.yarn \
    yarn install --legacy-peer-deps
# install
COPY client /src
RUN yarn run build

FROM alpine:3.15

LABEL org.opencontainers.image.title="JSON Crack"
LABEL org.opencontainers.image.description="Docker Extension for using an embedded version of JSON Crack tool."
LABEL org.opencontainers.image.vendor="Marcelo Ochoa"
LABEL com.docker.desktop.extension.api.version=">= 0.2.3"
LABEL com.docker.extension.categories="develop,utility-tools"
LABEL com.docker.extension.screenshots="[{\"alt\":\"Sample usage\", \"url\":\"https://raw.githubusercontent.com/marcelo-ochoa/jsoncrack-docker-extension/main/docs/images/screenshot2.png\"},\
    {\"alt\":\"Rotate Layout\", \"url\":\"https://raw.githubusercontent.com/marcelo-ochoa/jsoncrack-docker-extension/main/docs/images/screenshot3.png\"},\
    {\"alt\":\"Import JSON\", \"url\":\"https://raw.githubusercontent.com/marcelo-ochoa/jsoncrack-docker-extension/main/docs/images/screenshot4.png\"}]"
LABEL com.docker.extension.publisher-url="https://github.com/marcelo-ochoa/jsoncrack-docker-extension"
LABEL com.docker.extension.additional-urls="[{\"title\":\"Documentation\",\"url\":\"https://github.com/marcelo-ochoa/jsoncrack-docker-extension/blob/main/README.md\"},\
    {\"title\":\"License\",\"url\":\"https://github.com/marcelo-ochoa/jsoncrack-docker-extension/blob/main/LICENSE\"}]"
LABEL com.docker.extension.detailed-description="Docker Extension for using JSON Crack tool"
LABEL com.docker.extension.changelog="See full <a href=\"https://github.com/marcelo-ochoa/jsoncrack-docker-extension/blob/main/CHANGELOG.md\">change log</a>"
LABEL com.docker.desktop.extension.icon="https://raw.githubusercontent.com/marcelo-ochoa/jsoncrack-docker-extension/main/client/public/favicon.ico"
LABEL com.docker.extension.detailed-description="JSON Crack is a tool that generates graph diagrams from JSON objects. These diagrams are much easier to navigate than the textual format and to make it even more convenient, the tool also allows you to search the nodes. Additionally, the generated diagrams can also be downloaded or clipboard as image."
COPY docker-compose.yml jsoncrack.svg metadata.json ./

COPY --from=client-builder /src/out /ui
