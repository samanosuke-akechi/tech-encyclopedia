#!/bin/bash
set -e

rm -f /tech-encyclopedia/tmp/pids/server.pid

exec "$@"
