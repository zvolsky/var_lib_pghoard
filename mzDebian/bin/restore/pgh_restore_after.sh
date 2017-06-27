# make new valid basebackup
# run as: root
# warning: will delete previous basebackups and temporarily run without them; consider to backup them earlier

systemctl stop pghoard.service
rm /var/lib/pghoard/mzDebian/partial/* 2>/dev/null
su -c "gsutil rm gs://bk-pghoard/mzDebian/basebackup/*" postgres
rm -R /var/lib/pghoard/metadata/mzDebian/ 2>/dev/null
systemctl start pghoard.service

echo
echo Finished.
echo
