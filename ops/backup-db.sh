#!/bin/sh -eu
exec >>/var/log/db-backup.log 2>&1
date

filename="/home/admin/backups/db-$(date +"%Y%m%d-%H%M").gz"

(doas -u postgres pg_dumpall) | gzip > $filename
./azcopy/azcopy copy $filename "https://<account>.blob.core.windows.net/backups?<sas token>"

curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/<healthchecks>