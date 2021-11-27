#!/usr/bin/env bash

# Local end setup..

mkdir /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db
mkdir /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db/sshkeys
mkdir /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db/data

mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman/
mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman/sshkeys
mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman/log
mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman/backupcfg
mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman/backups

ssh-keygen -b 4096 -t rsa -N '' -f /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/id_rsa
ssh-keygen -f /home/ubuntu/.ssh/id_rsa -y >> /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/authorized_keys

ssh-keygen -b 4096 -t rsa -N '' -f /home/ubuntu/incremental_backup_restore_demo/pgbarman/sshkeys/id_rsa
ssh-keygen -f /home/ubuntu/.ssh/id_rsa -y >> /home/ubuntu/incremental_backup_restore_demo/pgbarman/sshkeys/authorized_keys

ssh-keygen -f /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/id_rsa -y >> /home/ubuntu/incremental_backup_restore_demo/pgbarman/sshkeys/authorized_keys
ssh-keygen -f /home/ubuntu/incremental_backup_restore_demo/pgbarman/sshkeys/id_rsa -y >> /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/authorized_keys

chmod -R 777 /home/ubuntu/incremental_backup_restore_demo/pgbarman/sshkeys/*
chmod -R 777 /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/*

cp postgres-source-db.conf /home/ubuntu/incremental_backup_restore_demo/pgbarman/backupcfg/.


# Remote end setup..

mkdir /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db_remote
mkdir /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db_remote/sshkeys
mkdir /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db_remote/data

mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/
mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/sshkeys
mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/log
mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/backupcfg
mkdir /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/backups

ssh-keygen -b 4096 -t rsa -N '' -f /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db_remote/sshkeys/id_rsa
ssh-keygen -f /home/ubuntu/.ssh/id_rsa -y >> /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/db_remote/sshkeys/authorized_keys

ssh-keygen -b 4096 -t rsa -N '' -f /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/sshkeys/id_rsa
ssh-keygen -f /home/ubuntu/.ssh/id_rsa -y >> /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/sshkeys/authorized_keys

ssh-keygen -f /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/dcm_db_remote/sshkeys/id_rsa -y >> /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/sshkeys/authorized_keys
ssh-keygen -f /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/sshkeys/id_rsa -y >> /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/dcm_db_remote/sshkeys/authorized_keys

chmod -R 777 /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/sshkeys/*
chmod -R 777 /home/ubuntu/incremental_backup_restore_demo/postgresdatabase/dcm_db_remote/sshkeys/*

cp /home/ubuntu/incremental_backup_restore_demo/pgbarman/backupcfg/postgres-source-db.conf /home/ubuntu/incremental_backup_restore_demo/pgbarman_remote/backupcfg/.


