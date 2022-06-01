#!/usr/bin/env bash

PRJ_DIR="$(pwd)"
SCRIPTS_DIR="$(dirname ${0})"
SCRIPT_NAME=$1

shift

LANGUAGE=$(dirname $SCRIPT_NAME)

case $LANGUAGE in
    go)
        docker run --rm -v "$PRJ_DIR":/srv -v "$SCRIPTS_DIR:/tmp" prontopro/golang:1.18.2-1-dev /tmp/$SCRIPT_NAME "$@"
        ;;
    
    php)
        docker run --rm -v "$PRJ_DIR":/srv -v "$SCRIPTS_DIR:/tmp" prontopro/php:7.4.29-1-dev /tmp/$SCRIPT_NAME "$@"
        ;;

    *)
        echo 'not valid language provided'
        exit 1
        ;;
esac

exit $?
