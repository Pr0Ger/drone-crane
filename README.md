# drone-crane

[![Build Status](https://drone.pr0ger.dev/api/badges/Pr0Ger/drone-crane/status.svg)](https://drone.pr0ger.dev/Pr0Ger/drone-crane)
![Docker Image Size](https://img.shields.io/docker/image-size/pr0ger/drone-crane/latest)
![Docker Pulls](https://img.shields.io/docker/pulls/pr0ger/drone-crane)

This is a simple Drone plugin to upload Docker image builded with nix-build to Docker Hub.

### Usage

```yaml
steps:
...
- name: publish
  image: pr0ger/drone-crane
  settings:
    username: pr0ger
    password:
      from_secret: docker_password
    repo: pr0ger/drone-convert-dhall
    tag: latest
  volumes:
  - name: nix
    path: /nix
```

```console
docker run --rm \
  -e PLUGIN_USERNAME=pr0ger \
  -e PLUGIN_PASSWORD="I'm not gonna tell you my password" \
  -e PLUGIN_REPO="pr0ger/drone-crane" \
  -e PLUGIN_TAG=latest \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  pr0ger/drone-crane
```
