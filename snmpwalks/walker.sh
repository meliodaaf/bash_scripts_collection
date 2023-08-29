#!/bin/bash

HOST=$1

function spawn_keys {
    # Manage SNMP credentials using GPG keys
    if [ -f /tmp/.$UID ]; then
        rm /tmp/.$UID
    fi
    gpg -o /tmp/.$UID -d -r ramentosubia11@gmail.com safe_file.gpg &>/dev/null
    source /tmp/.$UID
    sleep 1
    rm /tmp/.$UID
}


function walker {
    # SNMPWALK Command
    snmp_walk_command="snmpwalk -v 3 -l authPriv -u AUTHPRIV -a md5 \
    -A $AUTHENKEY -x des \
    -X $PRIVKEY \
    $HOST \
    iso.3.6.1.2.1.1.1.0"

    # Execute the SNMP walk command
    eval "$snmp_walk_command"
}

spawn_keys
walker