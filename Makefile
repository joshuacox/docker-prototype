all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""  This is merely a base image for usage read the README file
	@echo ""   1. make run       - build and run docker container

build: builddocker

run: NAME TAG builddocker rundocker

## useful hints
## specifiy ports
	#-p 44180:80 \
	#-p 27005:27005/udp \
## link another container
	#--link some-mysql:mysql \
## assign environmant variables
	#--env STEAM_USERNAME=`cat steam_username` \
	#--env STEAM_PASSWORD=`cat steam_password` \

rundocker:
	@docker run --name=`cat NAME` \
	--cidfile="cid" \
	-v /tmp:/tmp \
	-d \
	-P \
	-v /var/run/docker.sock:/run/docker.sock \
	-v $(shell which docker):/bin/docker \
	-t `cat TAG`

builddocker:
	/usr/bin/time -v docker build -t `cat TAG` .

kill:
	@docker kill `cat cid`

rm-image:
	@docker rm `cat cid`
	@rm cid

rm: kill rm-image

clean: cleanfiles rm

enter:
	docker exec -i -t `cat cid` /bin/bash

logs:
	docker logs -f `cat cid`

NAME:
	@while [ -z "$$NAME" ]; do \
		read -r -p "Enter the name you wish to associate with this container [NAME]: " NAME; echo "$$NAME">>NAME; cat NAME; \
	done ;

TAG:
	@while [ -z "$$TAG" ]; do \
		read -r -p "Enter the name you wish to associate with this container [TAG]: " TAG; echo "$$TAG">>TAG; cat TAG; \
	done ;
