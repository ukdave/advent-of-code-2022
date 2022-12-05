.PHONY: all deps lint test build clean

all: deps lint test build

deps:
	shards install

lint:
	crystal bin/ameba.cr

test:
	crystal spec

build:
	shards build

clean:
	rm -f bin/day* bin/day*.dwarf
