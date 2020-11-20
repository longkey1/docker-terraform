#!/bin/sh

USER_ID=${LOCAL_UID:-9001}
GROUP_ID=${LOCAL_GID:-9001}

echo "Starting with UID : ${USER_ID}, GID: ${GROUP_ID}"
adduser -u ${USER_ID} -h ${WORK_DIR} --disabled-password worker
groupmod -g ${GROUP_ID} worker
export HOME=/work

chown worker:worker ${WORK_DIR}

exec /sbin/su-exec worker "$@"
