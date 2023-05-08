# Presentations

Slides use [remark](https://remarkjs.com/#1). 

## Setup

```bash
$ sudo apt-get install make
```

## Build and run

```
$ make
```

HTML for each slide file will be built.

```
docker run -v $(pwd):/usr/share/nginx/html:ro -p 8080:80 nginx
```

https://localhost:8080/<presentation>.html

## Making changes

Update the `.md` file in `slides` and run `make`.
The format of the md file should be obvious. Make simply concatenates header.html, slides/%.md, and footer.html.
See the Makefile for details.

## License

MIT
