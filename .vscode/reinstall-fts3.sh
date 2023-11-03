#!/usr/bin/env bash

# Prepare local FTS3 repo
yum-builddep -y rpm/fts.spec
make rpm
createrepo out
envsubst < /fts3-local.repo.template > /etc/yum.repos.d/fts3-local.repo

# Stop the running FTS server
/usr/sbin/fts_server               # main FTS server daemonizes
/usr/sbin/fts_msg_bulk             # daemon to send messages to activemq
/usr/sbin/fts_bringonline          # daemon to handle staging requests
apachectl -k stop                  # FTS REST frontend & FTSMON

# Remove the old fts server and install the local one
yum erase -y fts-libs fts-server
yum install -y fts-server fts-mysql fts-msg

# Override the required configurations
/bin/cp ${WORKSPACE}/.devcontainer/fts-msg-monitoring.conf /etc/fts3/fts-msg-monitoring.conf
/bin/cp ${WORKSPACE}/.devcontainer/fts3config /etc/fts3/fts3config
chmod +x /usr/share/fts/fts-database-upgrade.py