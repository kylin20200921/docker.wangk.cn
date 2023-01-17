#!/bin/bash
set -e
for v in */; do
  v="${v%/}"
  mkdir -p $v/{etc,root,usr/local/bin}/
  sed "s/%VERSION%/$v/g" Dockerfile.template > "$v/Dockerfile"
  sed "s/%VERSION%/$v/g" supervisord.template > "$v/etc/supervisord.conf"
done