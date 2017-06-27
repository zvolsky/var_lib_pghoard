/usr/bin/rsync /var/lib/pghoard/metadata/mzDebian/xlog_incoming/ /var/lib/pghoard/mzDebian/partial/ --delete -r
/usr/local/bin/gsutil -m rsync -d /var/lib/pghoard/mzDebian/partial gs://bk-pghoard/mzDebian/partial
