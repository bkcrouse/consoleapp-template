NAME	:= traxconsole
TAG	:= $(shell cat /proc/sys/kernel/random/uuid)
VERSION := $(shell grep -m 1 TRAX.Console/ /home/trax/console/TRAX.Console.deps.json  | sed -e 's/.*\/ *\([0-9].*\)\".*/\1/')
IMG	:= ${NAME}:${TAG}
LATEST	:= ${NAME}:latest
TEST    := ${NAME}:test
CONSOLEVERSION := ${NAME}:${VERSION}

build:
	@docker build -t ${IMG} .
	@docker image tag ${IMG} ${CONSOLEVERSION} ${LATEST}

push:
	@docker push ${NAME}

login:
	@docker log -u ${DOCKER_USER} ${DOCKER_PASS}

bash:
	@docker run -it --privileged --net host -v /home/trax/console:/trax --rm --entrypoint bash ${LATEST}


test:
	@docker build -t ${IMG} -f Dockerfile.test
	@docker image tag ${IMG} ${LATEST} ${TEST}
