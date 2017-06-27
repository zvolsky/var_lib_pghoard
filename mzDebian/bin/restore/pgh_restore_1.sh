# restore the basebackup + make backup of all avalilable .partial wal/xlog + leads to choice of them
# run as: root

echo restoring basebackup ..
su -c "pghoard_restore get-basebackup --config /var/lib/pghoard/pghoard.json --site mzDebian --target-dir /var/lib/postgresql/9.6/main --restore-to-master" postgres 2>&1

echo
echo backuping .partial wal/xlog from metadata/.../xlog_incoming into partial/backup_incoming/
mkdir -p /var/lib/pghoard/metadata/mzDebian/xlog_incoming/
chown postgres:postgres /var/lib/pghoard/metadata/mzDebian/xlog_incoming/
mkdir -p /var/lib/pghoard/mzDebian/partial/
chown postgres:postgres /var/lib/pghoard/mzDebian/partial/
mkdir -p /var/lib/pghoard/mzDebian/partial_backup/incoming/
chown postgres:postgres /var/lib/pghoard/mzDebian/partial_backup/incoming/
cp /var/lib/pghoard/metadata/mzDebian/xlog_incoming/* /var/lib/pghoard/mzDebian/partial_backup/incoming/

echo
echo backuping .partial wal/xlog from partial/ into partial_backup/localcopy/
mkdir -p /var/lib/pghoard/mzDebian/partial_backup/localcopy/
chown postgres:postgres /var/lib/pghoard/mzDebian/partial_backup/localcopy/
cp /var/lib/pghoard/mzDebian/partial/* /var/lib/pghoard/mzDebian/partial_backup/localcopy/

echo
echo compare versions of partial file
echo if xlog_incoming looks well, continue with ./pgh_restore_2.sh
ls -al /var/lib/pghoard/metadata/mzDebian/xlog_incoming/

echo 
echo if local copy partial looks well, continue with ./pgh_restore_1c.sh - restore from localcopy partial/
ls -al /var/lib/pghoard/mzDebian/partial/

echo
echo if you have no good file on server, retrieve it from the cloud: ./pgh_restore_1b.sh - restore from cloud copy
echo
