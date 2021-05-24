ARG GO_VERSION="1.16"

FROM golang:$GO_VERSION-alpine as builder

RUN \
    set -o errexit -o nounset -o xtrace; \
    go install github.com/google/go-containerregistry/cmd/crane@latest

FROM alpine:3.13.5

RUN \
    set -o errexit -o nounset -o xtrace; \
    apk add --no-cache --update \
        ca-certificates \
        dumb-init \
        gzip \
        tzdata \
        su-exec\
    ;

ADD docker-entrypoint.sh /bin/
COPY --from=builder /go/bin/crane /bin/

ENTRYPOINT docker-entrypoint.sh
