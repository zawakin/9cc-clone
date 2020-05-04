IMAGE_NAME = 9cc-linux:latest
build:
	docker build . -t ${IMAGE_NAME}

run:
	docker run --rm -it -v ${PWD}:/9cc ${IMAGE_NAME} /bin/zsh

CFLAGS=-std=c11 -g -static

9cc: 9cc.c

test: 9cc
	./test.sh

clean:
	rm -f 9cc *.o *~ tmp*

.PHONY: test clean build run
