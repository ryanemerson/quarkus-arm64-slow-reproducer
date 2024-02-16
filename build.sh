#!/bin/bash

docker run --rm --privileged quay.io/infinispan-test/binfmt:qemu-v8.0.4-33  --install arm64
docker buildx rm multiarch || true
docker buildx create --name multiarch --use
PROGRESS_NO_TRUNC=1 docker buildx build --progress plain --platform linux/arm64 -f src/main/docker/Dockerfile.$1 .
