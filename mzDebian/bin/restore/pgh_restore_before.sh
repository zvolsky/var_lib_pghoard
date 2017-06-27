# sure stop postgres and pghoard + list available basebackups
# run as: root

echo stopping pghoard service ..
systemctl stop pghoard 2>&1

echo
echo stopping postgres cluster ..
pg_ctlcluster 9.6 main stop 2>&1

echo
echo postgres cluster status ..
pg_lsclusters

echo
echo available basebackups ..
echo if fails, make sure you have /var/lib/pghoard/pghoard.json and if missing, restore it from backup
mkdir -p /var/lib/pghoard/
chown postgres:postgres /var/lib/pghoard/
pghoard_restore list-basebackups --config /var/lib/pghoard/pghoard.json

echo
echo Please backup the current state of postgres database
echo then remove the current cluster:
echo
echo rm -R /var/lib/postgresql/9.6/main
echo
echo and continue with ./pgh_restore_1.sh
echo
