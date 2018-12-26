#!/bin/bash

server_id="$1"
filename="$2"

if [[ -z "${server_id}" || -z "${filename}" ]]; then
  echo "ERROR: Usage: $0 <speedtest-server-id> <output-filename>"
  exit 1
fi

time=$(date +"%x %X")

speedtest=$(speedtest-cli --simple --server ${server_id})

set -- $speedtest
ping="$2"
download="$5"
upload="$8"

NMEA_string=$(cat /dev/serial0 | grep -m1 "GGA")
decimal_coordinates=$( echo ${NMEA_string} | ./nmea.py)
gps_latitude=$(echo ${decimal_coordinates} | cut -d " " -f 1)
gps_longitude=$(echo ${decimal_coordinates} | cut -d " " -f 2)

printf "%s," ${server_id} >> ${filename}
printf "%s," ${time} >> ${filename}
printf "%s," ${ping} >> ${filename}
printf "%s," ${download} >> ${filename}
printf "%s," ${upload} >> ${filename}
printf "%s," ${gps_latitude} >> ${filename}
printf "%s\n" ${gps_longitude} >> ${filename}