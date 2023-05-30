MARKDOWN=$(wildcard slides/*.md)
HTML=$(MARKDOWN:.md=.html)

all: $(HTML)

%.html: %.md
	cat layout/header.html $^ layout/footer.html > $(notdir $@)
