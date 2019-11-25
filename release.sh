#!/bin/sh

VERSION=$(git describe --tags $(git rev-list --tags --max-count=1))
COMMIT_HASH=`git rev-parse --short=8 HEAD 2>/dev/null`

echo "Version is: ${VERSION}"
echo "Commit hash is: ${COMMIT_HASH}"

gox -ldflags "-X main.VersionTag=$VERSION -X main.CommitHash=$COMMIT_HASH" \
    -os="linux darwin windows" -arch="amd64" -output="target/terraform-provider-infoblox_{{.OS}}_{{.Arch}}" github.com/egbertp/terraform-provider-infoblox