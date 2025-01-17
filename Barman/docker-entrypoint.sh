#!/bin/bash
set -e

BARMAN_CONF="/etc/barman.conf"
TEMP_CONF="/tmp/barman.conf"

function customize {
	if [ "$1" = 'barman' ]; then
		rm -rf /tmp/*
	fi

	id
	cp -R /tmp/.ssh/* /home/ubuntu/.ssh/
#	ls -ltr /tmp/.ssh
#	ls -ltr /home/ubuntu/.ssh
	chmod 700 /home/ubuntu/.ssh
	chmod 644 /home/ubuntu/.ssh/id_rsa.pub
	chmod 600 /home/ubuntu/.ssh/id_rsa
	chmod 600 /home/ubuntu/.ssh/authorized_keys

	su barman -c "cp -R /tmp/.ssh/* /var/lib/barman/.ssh/ && chmod 700 /var/lib/barman/.ssh && chmod 644 /var/lib/barman/.ssh/id_rsa.pub && chmod 600 /var/lib/barman/.ssh/id_rsa && chmod 600 /var/lib/barman/.ssh/authorized_keys"

	mkdir -p /var/log/barman && chown -R barman: /var/log/barman

	mkdir -p /backup/barman && chown -R barman: /backup/barman

	mkdir -p /etc/barman.d && chown -R barman: /etc/barman.d

	/etc/init.d/cron start

	/usr/sbin/sshd -D 2>&1
}


customize

exec "$@"
