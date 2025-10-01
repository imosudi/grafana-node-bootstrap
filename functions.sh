#!/bin/bash
# Common helper functions

set -euo pipefail

log() { echo -e "\n[INFO] $1\n"; }
error_exit() { echo "[ERROR] $1" >&2; exit 1; }
