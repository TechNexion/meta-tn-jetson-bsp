#!/bin/bash

#
# Jetson Yocto Project Build Environment Setup Script
#
# Copyright 2026 TechNexion Ltd.

# Automatically appends a meta-layer to bblayers.conf if it exists and isn't already present.
# Arguments: $1 (dir) - Build directory, $2 (id) - Release ID, $3 (name) - Layer folder name
tn_auto_append_layer() {
  local dir=$1 id=$2 name=$3

  [[ -d $dir/../layers/$name ]] || return
  grep -qF "$name" "$dir/conf/bblayers.conf" && return

  printf "\n# setup nVidia $id release layer in bblayers.conf\n" >> "$dir/conf/bblayers.conf"
  printf "BBLAYERS += \"$OEROOT/$name \"\n" >> "$dir/conf/bblayers.conf"
}
