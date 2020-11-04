NAME	:= traxconsole
TAG	:= $(shell cat /proc/sys/kernel/random/uuid)
IMG	:= ${NAME}:${TAG}
LATEST	:= ${NAME}:latest

build:
	@docker build -t ${IMG} .
	@docker image tag ${IMG} ${LATEST}

push:
	@docker push ${NAME}

login:
	@docker log -u ${DOCKER_USER} ${DOCKER_PASS}

bash:
	@docker run -it --privileged --net host -v /home/trax/console:/trax --rm --entrypoint bash ${LATEST}


test:
	@docker build -t ${IMG} -f Dockerfile.test
	@docker image tag ${IMG} ${LATEST}
