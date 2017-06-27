# move localcopy of .partial wal/xlog into pghoard/metadata/.../xlog_incoming/
# run as: root

echo
echo move localcopy of .partial wal/xlog into pghoard/metadata/.../xlog_incoming/
rm /var/lib/pghoard/metadata/mzDebian/xlog_incoming/* 2>/dev/null
cp /var/lib/pghoard/mzDebian/partial/* /var/lib/pghoard/metadata/mzDebian/xlog_incoming/

echo
echo Continue with ./pgh_restore_2.sh - re-run changes made after the basebackup
echo
