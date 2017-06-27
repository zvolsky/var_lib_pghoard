# re-run changes made later as basecopy
# run as: root

su -c "rename 's/.partial$//' /var/lib/pghoard/metadata/mzDebian/xlog_incoming/*.partial" postgres
systemctl start pghoard
pg_ctlcluster 9.6 main start
pghoard_archive_sync  --config /var/lib/pghoard/pghoard.json --site mzDebian

echo
echo Check database and..
echo
echo Please create new valid basebackup: ./pgh_restore_after.sh
echo
