#!/usr/bin/env sh

# Password file
if [ ! -z "$PASSWORD_FILE" ]; then
    export DATABASES_PASSWORD=`cat $PASSWORD_FILE`
fi

# Entrypoint
exec ./entrypoint.sh
