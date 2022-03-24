#!/bin/sh

SDKPATH=/opt/kaspersky/ScanEngine
PIDFILE=/var/run/kavicapd.pid
CONFILE=/etc/kavicapd.xml

USE_WATCHDOG=0

DAEMON_DIR="${SDKPATH}/bin"
DAEMON="${DAEMON_DIR}/kavicapd"

KL_PLUGINS_PATH="${SDKPATH}/ppl"
LD_LIBRARY_PATH="${SDKPATH}/lib:${KL_PLUGINS_PATH}:${LD_LIBRARY_PATH}"

PROGNAME=kavicapd

LD_LIBRARY_PATH="/opt/kaspersky/ScanEngine/lib:/opt/kaspersky/ScanEngine/ppl:${LD_LIBRARY_PATH}"

export KL_PLUGINS_PATH
export LD_LIBRARY_PATH

cd "${DAEMON_DIR}"
${DAEMON} -c "${CONFILE}" -p "${PIDFILE}" ${ADDITIONAL_ARGS}

sleep 2

tail -f /var/log/icapdkav_*.log
