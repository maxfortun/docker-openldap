#!/bin/bash -ex
rootdn="$1"
if [ -z "$rootdn" ]; then
	echo "Usage: $0 <rootdn> [ldapsearch flags]"
	echo "e.g. $0 admin@example.com -d -1"
	exit 1
fi
shift

cn=${rootdn%%@*}
dcs=${rootdn##*@}
dcs="dc=${dcs//./,dc=}"

. $(dirname $0)/setenv.sh

LDAPTLS_REQCERT=never ldapsearch -x -b "$dcs" -H ldaps://localhost:${DOCKER_PORT_PREFIX}636 -D "cn=$cn,$dcs" -W "$@"
