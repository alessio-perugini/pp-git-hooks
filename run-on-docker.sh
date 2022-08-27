#!/usr/bin/env bash

PRJ_DIR="$(pwd)"
SCRIPTS_DIR="$(dirname ${0})"
SCRIPT_NAME=$1

shift

case $1 in
--docker-image)
    shift
    DOCKER_IMAGE=$1
    shift
    ;;
esac

if [[ -z "$DOCKER_IMAGE" ]]; then
    exec $SCRIPTS_DIR/$SCRIPT_NAME "$@"
else
    docker run --rm -v "$PRJ_DIR":/srv -v "$SCRIPTS_DIR:/tmp" $DOCKER_IMAGE /tmp/$SCRIPT_NAME "$@"
fi

exit $?
