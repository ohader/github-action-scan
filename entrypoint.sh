#!/bin/sh -l

APPLICATION_ID=$1
shift

if [ "$RIPS_VERSION_NAME" == "" ]
then
	RIPS_VERSION_NAME=$(date -Is)
fi

ARGS_TAG=""
if [ "$RIPS_TAG_NAME" != "" ]
then
	ARGS_TAG="-T $RIPS_TAG_NAME"
fi

ARGS_PROGRESS="-G"
if [ "$RIPS_SCAN_PROGRESS" == "0" ]
then
	ARGS_PROGRESS=""
fi

/usr/bin/rips-cli rips:scan:start \
  -a "${APPLICATION_ID}" \
  -N "${RIPS_VERSION_NAME}" \
  -p "${GITHUB_WORKSPACE}" \
  ${ARGS_TAG} \
  -S "ci-github-action" \
  ${ARGS_PROGRESS} \
  $@
