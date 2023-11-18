# Image URL to use all building/pushing image targets
REGISTRY ?= quay.io
REPOSITORY ?= $(REGISTRY)/eformat/nginx-stream

IMG := $(REPOSITORY):latest

# podman Login
podman-login:
	@podman login -u $(PODMAN_USER) -p $(PODMAN_PASSWORD) $(REGISTRY)

# Build the podman image
podman-build:
	podman build . -t ${IMG} -f Dockerfile

# Push the podman image
podman-push: podman-build
	podman push ${IMG}
