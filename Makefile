VERSION=$(shell cd axilon_mirror_automation && git describe --always)

all: image

image:
	docker build -t pcdshub/axilon-mirror-automation:$(VERSION) .

push:
	docker push pcdshub/axilon-mirror-automation:$(VERSION)

latest:
	docker build -t pcdshub/axilon-mirror-automation:latest .
	docker push pcdshub/axilon-mirror-automation:latest


.PHONY: all image push latest
