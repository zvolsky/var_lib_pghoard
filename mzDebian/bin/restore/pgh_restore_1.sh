# restore the basebackup + make backup of all avalilable .partial wal/xlog + leads to choice of them
# run as: root

echo restoring basebackup ..
su -c "pghoard_restore get-basebackup --config /var/lib/pghoard/pghoard.json --site mzDebian --target-dir /var/lib/postgresql/9.6/main --restore-to-master" postgres 2>&1

echo
echo sure have xlog_incoming/
mkdir -p /var/lib/pghoard/metadata/mzDebian/xlog_incoming/
chown postgres:postgres /var/lib/pghoard/metadata/mzDebian/xlog_incoming/

ls -al /var/lib/pghoard/metadata/mzDebian/xlog_incoming/
echo
echo See if you have in /var/lib/pghoard/metadata/mzDebian/xlog_incoming/ the .partial wal/xlog file.
echo If you dont have it, download it from Dropbox.
echo Continue with ./pgh_restore_2.sh - re-run changes made after the basebackup
echo
