#!/bin/sh
version=$(wget -q -O - https://minecraft.net/de-de/download/server/bedrock/ | sed -n -r 's;^.*linux.*-([0-9.]+)\.zip.*$;\1;p')

printf "$version"
while [ -n "$version" ]; do
    version=$(echo $version | sed -n -r 's/([0-9.]*)\..*/\1/p')
    printf ",$version"
done
echo "latest"

