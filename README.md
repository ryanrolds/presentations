# Docker

Slides use [remark](https://remarkjs.com/#1). 

## Setup

    $ sudo apt-get install make

## Build and run

    $ make

HTML for each slide file will be built.

## Making changes

Update the `.md` file in `slides` and run `make`. The format of the md file should be obvious. Make simply concatinates header.html, slides/%.md, and footer.html. See the Makefile for details.

## License

MIT
