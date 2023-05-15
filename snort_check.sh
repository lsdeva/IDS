#!/bin/bash

# Ensure a filename was provided as an argument
if [[ -z "$1" ]]; then
  echo "Usage: $0 filename"
  exit 1
fi

# Ensure the provided filename is a file that exists
if [[ ! -f "$1" ]]; then
  echo "Error: $1 is not a file"
  exit 1
fi

for ip in $(cat $1); do 
  echo "IP: $ip"
  echo -n "Organization: "
  whois $ip | grep -i 'OrgName\|Organization\:|owner:\|netname\|descr' | head -1
  echo ""
done







