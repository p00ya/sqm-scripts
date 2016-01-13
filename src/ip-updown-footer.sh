
[ -n "$IFACE" ] || exit 1

# in case of spurious hotplug events, try double check whether the interface is really up
if [ ! -d /sys/class/net/${IFACE} ] ; then
    sqm_error "${IFACE} does currently not exist, not even trying to start SQM on nothing."
    exit 1
fi

if [ "$(basename $0)" = "sqm-stop" ] ; then
  sqm_trace; sqm_trace "$(date): Stopping SQM."
  sqm_stop
  exit 0
fi

sqm_trace; sqm_trace "$(date): Starting." # Add some space and a date stamp to verbose log output and log files to separate runs
sqm_log "Starting SQM on ${IFACE}, in: ${DOWNLINK} Kbps, out: ${UPLINK} Kbps"
sqm_start && sqm_log "SQM was started on ${IFACE} successfully"

exit 0
