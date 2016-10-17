default: build

build:
	docker build -t mapitman/password-store .

run:
	docker run -it --rm \
	-v $(HOME)/.password-store:/root/.password-store \
	-v $(HOME)/.gnupg:/root/.gnupg \
	 mapitman/password-store /bin/bash
run-test:
	docker run -it mapitman/password-store /bin/bash

push:
	docker push mapitman/password-store
