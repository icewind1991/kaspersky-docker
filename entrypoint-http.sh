#!/bin/sh

SDKPATH=/opt/kaspersky/ScanEngine
CONFILE=/etc/kavhttpd.xml
PIDFILE=/var/run/kavhttpd.pid

USE_WATCHDOG=0

DAEMON_DIR="${SDKPATH}/bin"
DAEMON="${DAEMON_DIR}/kavhttpd"

KL_PLUGINS_PATH="${SDKPATH}/ppl"
LD_LIBRARY_PATH="${SDKPATH}/lib:${KL_PLUGINS_PATH}:${LD_LIBRARY_PATH}"

PROGNAME=kavhttpd

LD_LIBRARY_PATH="/opt/kaspersky/ScanEngine/lib:/opt/kaspersky/ScanEngine/ppl:${LD_LIBRARY_PATH}"

export KL_PLUGINS_PATH
export LD_LIBRARY_PATH

touch /var/log/httpd_kav_7.log
tail -f /var/log/httpd_kav_7.log &

cd "${DAEMON_DIR}"
exec "${DAEMON}" -c "${CONFILE}" -n -p "${PIDFILE}" ${ADDITIONAL_ARGS}
