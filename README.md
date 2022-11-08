# JSONCrack Docker Extension

JSON Crack extension for Docker Desktop, an integration of [jsoncrack.com](https://jsoncrack.com) tool.

## Manual Installation

Until this extension is ready at Docker Extension Hub you can install just by executing:

```bash
$ docker extension install mochoa/jsoncrack-docker-extension:2.0.2
Extensions can install binaries, invoke commands and access files on your machine. 
Are you sure you want to continue? [y/N] y
Installing new extension "mochoa/jsoncrack-docker-extension:2.0.2"
Installing service in Desktop VM...
Setting additional compose attributes
VM service started
Installing Desktop extension UI for tab "JSON Crack"...
Extension UI tab "JSON Crack" added.
Extension "JSON Crack" installed successfully
```

**Note**: Docker Extension CLI is required to execute above command, follow the instructions at [Extension SDK (Beta) -> Prerequisites](https://docs.docker.com/desktop/extensions-sdk/#prerequisites) page for instructions on how to add it.

## Using JSONCrack Docker Extension

Once the extension is installed a new extension is listed at the pane Extension (Beta) of Docker Desktop.

By clicking at JSON Crack icon the extension main window will display a JSON Document.

![Sample Document](docs/images/screenshot2.png?raw=true)

Here an example of rotating a diagram.

![Rotated Diagram](docs/images/screenshot3.png?raw=true)

## Import new Document

By clicking on Import Icon (left side menu) you can upload a new JSON Document

![Upload Document](docs/images/screenshot4.png?raw=true)

## JSONCrack README

Please read JsonCrack [README.md](https://github.com/AykutSarac/jsoncrack.com/blob/main/README.md) file

## JSONCrack LICENSE

Please read JsonCrack [LICENSE](https://github.com/AykutSarac/jsoncrack.com/blob/main/LICENSE) file

## Build from sources

To install the extension from source:

```bash
git clone --recurse-submodules https://github.com/marcelo-ochoa/jsoncrack-docker-extension
cd jsoncrack-docker-extension/client
git apply  ../jsoncrack.patch
cd ..
make install
```

## Uninstall

To uninstall the extension just execute:

```bash
$ docker extension uninstall mochoa/jsoncrack-docker-extension:2.0.2
Extension "JSON Crack" uninstalled successfully
```

## Source Code

As usual the code of this extension is at [GitHub](https://github.com/marcelo-ochoa/jsoncrack-docker-extension), feel free to suggest changes and make contributions, note that I am a beginner developer of React and TypeScript so contributions to make this UI better are welcome.
