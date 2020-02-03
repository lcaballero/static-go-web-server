#!/bin/bash

start() {
    docker run -d \
	   -p 3000:3000 \
	   --name web \
	   -v $(pwd)/static:/static \
	   web:wip
}

build() {
    docker build -t web:wip .
}

stop() {
    docker container stop web
    docker container rm web
}

reset() {
    docker rmi web:wip
}

"$@"
