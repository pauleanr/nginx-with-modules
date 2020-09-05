#!/bin/sh
# vim:sw=4:ts=4:et

set -e

if [ -z "${NGINX_ENTRYPOINT_QUIET_LOGS:-}" ]; then
    exec 3>&1
else
    exec 3>/dev/null
fi

if [ "$1" = "nginx" -o "$1" = "nginx-debug" ]; then
	/docker-entrypoint.d/20-envsubst-on-templates.sh
fi

exec "$@"
