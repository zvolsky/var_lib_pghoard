# run as: root

echo
echo backuping .partial wal/xlog from cloud into partial_backup/cloud/
mkdir -p /var/lib/pghoard/mzDebian/partial_backup/cloud/
chown postgres:postgres /var/lib/pghoard/mzDebian/partial_backup/cloud/
su -c "/usr/local/bin/gsutil -m rsync -d gs://bk-pghoard/mzDebian/partial /var/lib/pghoard/mzDebian/partial_backup/cloud/" postgres
su -c "/usr/local/bin/gsutil -m rsync -d gs://bk-pghoard/mzDebian/partial /var/lib/pghoard/mzDebian/partial" postgres

echo
echo partial ..
ls -al /var/lib/pghoard/mzDebian/partial/

echo
echo partial from server ..
ls -al /var/lib/pghoard/mzDebian/partial_backup/localcopy/

echo
echo partial from cloud ..
ls -al /var/lib/pghoard/mzDebian/partial_backup/cloud/

echo
echo Continue with ./pgh_restore_1c.sh - copy .partial back into xlog_incoming/
echo
