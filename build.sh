#!/bin/sh

VERSION="DEVELOPMENT"
COMMIT_HASH=`git rev-parse --short=8 HEAD 2>/dev/null`

echo "VERSION is ${VERSION}"
echo "COMMIT_HASH is ${COMMIT_HASH}\n"

previous_build_artifact="terraform-provider-infoblox"

if [ -f $previous_build_artifact ] ; then
    rm $previous_build_artifact
fi

go build -o ${previous_build_artifact} \
    -ldflags "-X main.VersionTag=$VERSION -X main.CommitHash=$COMMIT_HASH" *.go