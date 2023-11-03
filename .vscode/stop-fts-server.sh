#!/usr/bin/env bash

# Stop the running FTS server
/usr/sbin/fts_server               # main FTS server daemonizes
/usr/sbin/fts_msg_bulk             # daemon to send messages to activemq
/usr/sbin/fts_bringonline          # daemon to handle staging requests
apachectl -k stop                  # FTS REST frontend & FTSMON