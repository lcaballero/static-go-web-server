#!/bin/bash

run() {
    docker run --rm -d \
	   -p 3000:3000 \
	   --name web \
	   -v $(pwd)/static:/static \
	   web:wip
}

build() {
    docker build -t web:wip .
}

"$@"
