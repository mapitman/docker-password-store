default: build

build:
	docker build --build-arg VCS_REF=`git rev-parse --short HEAD` --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` -t mapitman/password-store .

run:
	docker run -it --rm \
	-v $(HOME)/.password-store:/root/.password-store \
	-v $(HOME)/.gnupg:/root/gnupg:ro \
	 mapitman/password-store /bin/bash
run-test:
	docker run -it mapitman/password-store /bin/bash

push:
	docker push mapitman/password-store
