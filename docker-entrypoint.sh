#!/usr/bin/dumb-init /bin/sh
# shellcheck shell=sh

set -o errexit -o nounset

crane auth login -u "$PLUGIN_USERNAME" -p "$PLUGIN_PASSWORD" index.docker.io

set -o xtrace

gunzip < result > image.tar

crane push image.tar "$PLUGIN_REPO:$PLUGIN_TAG"
