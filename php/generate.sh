#!/bin/bash
set -e
for v in */; do
  v="${v%/}"
  if echo "8.0 8.2" | grep -w $v &>/dev/null; then
    sed "s/%VERSION%/$v/g" docker.template > "$v/Dockerfile"
    sed "s/%VERSION%/$v/g" supervisord.template > "$v/etc/supervisord.conf"
  else
    sed "s/%VERSION%/$v/g" ioncube_loader.template > "$v/Dockerfile"
    sed "s/%VERSION%/$v/g" supervisord.template > "$v/etc/supervisord.conf"
  fi
done
