#!/bin/ash
# entrypoint for the container
set -e

# verify these exist before running any commands
mkdir -p /data/logs
touch /data/query_ip_blacklist.txt
touch /data/query_ip_whitelist.txt
touch /data/ts3server.sqlitedb
touch /data/ts3accserveremu.log

# boot up server in the foreground
./opt/teamspeak/ts3server_minimal_runscript.sh $@ &
pid=$!

sig_int () {
	echo "SIGINT received"
  kill -2 ${pid}
}

sig_term () {
	echo "SIGTERM received"
	kill -15 ${pid}
}

trap sig_int  INT
trap sig_term TERM

wait $pid