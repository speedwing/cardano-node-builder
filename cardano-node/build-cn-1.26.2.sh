#!/usr/bin/env bash

set -x

OS_ARCH=$(uname -m)

MEMORY=${MEMORY:-7}

CARDANO_NODE_VERSION=1.26.2
CARDANO_NODE_IMAGE_TAG="${CARDANO_NODE_VERSION}-${OS_ARCH}"

docker build -m "${MEMORY}Gi" --memory-swap -1 -t cardano-node:"${CARDANO_NODE_IMAGE_TAG}" \
  --build-arg GHC_VERSION=8.10.2 \
  --build-arg OS_ARCH="${OS_ARCH}" \
  --build-arg CARDANO_VERSION=${CARDANO_NODE_VERSION} \
  -f "${CARDANO_NODE_VERSION}-${OS_ARCH}.dockerfile" . \
  2>&1 \
  | tee /tmp/cardano-node-build.logs
