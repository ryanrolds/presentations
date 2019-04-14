MARKDOWN=$(wildcard slides/*.md)
HTML=$(MARKDOWN:.md=.html)

all: $(HTML)

%.html: %.md
	cat header.html $^ footer.html > $(notdir $@)
