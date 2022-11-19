#!/bin/bash
conf="/etc/secureboot.conf"
if [ -f $conf ]; then 
	source $conf
else
	echo "conf not found at $conf"
	exit 1
fi

for kernel in $(ls /boot | grep "vmlinuz"); do
    if ! /usr/bin/sbverify --list $kernel 2>/dev/null | /usr/bin/grep -q "signature certificates"; then
        /usr/bin/sbsign --key /home/sadguitarius/.local/keys/MOK.key --cert /home/sadguitarius/.local/keys/MOK.crt --output $kernel $kernel
    fi
done
