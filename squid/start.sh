#!/usr/bin/env bash
#!/bin/bash
set -e
set -o pipefail

handle_signal() {
  PID=$!
  echo "Received signal. PID is ${PID}"
  ${SQUID} -k shutdown 
}

trap "handle_signal" SIGINT SIGTERM SIGHUP
SQUID=/usr/bin/squid

test -f /etc/squid/squid.conf || exit 1

if [ -n "$*" ]; then
  echo "Passed in $@"
  exec /usr/bin/bash -c "$@"
else
  echo "Starting squid..."
  exec ${SQUID} --foreground
  echo "Stopping squid..."
fi
