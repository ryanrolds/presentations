# Presentations

Slides use [remark](https://remarkjs.com/#1). 


## Requirements

* Make
* Docker - https://docs.docker.com/get-docker/
* Helm - https://helm.sh/docs/intro/install/

## Setup

```bash
$ sudo apt-get install make
```

## Build and run

```
make all
```

HTML for each slide file will be built.

```
docker-compose up
```

https://localhost:8080/presentation.html

## Making changes

Update the `.md` file in `slides` and run `make`.
The format of the md file should be obvious. Make simply concatenates header.html, slides/%.md, and footer.html.
See the Makefile for details.

Update HTML as changes are made (requires `inotify-tools`):
```
while inotifywait -e close_write slides/*; do make all; done
```

> TODO put the above in it's own container

## License

MIT
