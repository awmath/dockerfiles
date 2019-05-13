#!/bin/sh
set -e

for file in /config/*; do
    basename=$(basename $file)
    if [ ! -f /app/data/config/$basename ]; then
        cp $file /app/data/config/
    fi

done
chown -R filestash:filestash /app/data/config

echo "Starting filestash"


exec "$@"
