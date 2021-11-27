#!/bin/bash
set -e

function customize {
#	id
	cp -R /tmp/.ssh/* /home/ubuntu/.ssh/
#	ls -ltr /tmp/.ssh
#	ls -ltr /home/ubuntu/.ssh
	chmod 700 /home/ubuntu/.ssh
	chmod 644 /home/ubuntu/.ssh/id_rsa.pub
	chmod 600 /home/ubuntu/.ssh/id_rsa
	chmod 600 /home/ubuntu/.ssh/authorized_keys

	su - postgres -c "cp -R /tmp/.ssh/* ~postgres/.ssh/ && chmod 700 ~postgres/.ssh && chmod 644 ~postgres/.ssh/id_rsa.pub && chmod 600 ~postgres/.ssh/id_rsa && chmod 600 ~postgres/.ssh/authorized_keys"

	/usr/sbin/sshd 2>&1
}

customize & /usr/local/bin/docker-entrypoint.sh "$@"

