# make new valid basebackup
# run as: root
# warning: will delete previous basebackups and temporarily run without them; consider to backup them earlier

systemctl stop pghoard.service
su -c "gsutil rm gs://bk-pghoard/mzDebian/basebackup/*" postgres
rm -R /var/lib/pghoard/metadata/mzDebian/ 2>/dev/null
systemctl start pghoard.service

/var/lib/postgresql/Dropbox/dropbox.py stop
mkdir -p /var/lib/postgresql/Dropbox/mzDebian/
ln -s /var/lib/pghoard/metadata/mzDebian/xlog_incoming/ /var/lib/postgresql/Dropbox/mzDebian/
/var/lib/postgresql/Dropbox/dropbox.py start -i

echo
echo Finished.
echo
