# restore from pg_dump
# run as: root

pg_ctlcluster 9.6 main stop 2>/dev/null
pg_dropcluster 9.6 main 2>/dev/null
pg_createcluster 9.6 main -p 5433
cp /var/lib/pghoard/mzDebian/conf/*.conf /etc/postgresql/9.6/main/
pg_ctlcluster 9.6 main start
su -c "psql -p 5433 -f /var/lib/pghoard/mzDebian/pgdump/globals.sql" postgres
su -c "pg_restore -C -d template1 /var/lib/pghoard/mzDebian/pgdump/codex2020" postgres
su -c "pg_restore -C -d template1 /var/lib/pghoard/mzDebian/pgdump/codex2020_test" postgres
su -c "pg_restore -C -d template1 /var/lib/pghoard/mzDebian/pgdump/krepo" postgres
su -c "pg_restore -C -d template1 /var/lib/pghoard/mzDebian/pgdump/sluzbicka" postgres
su -c "pg_restore -C -d template1 /var/lib/pghoard/mzDebian/pgdump/zitranavylet" postgres
su -c "pg_restore -C -d template1 /var/lib/pghoard/mzDebian/pgdump/zv" postgres

echo
echo Please create new basebackup, i.e. delete old basebackups in cloud and run: ./pgh_restore_after.sh
echo
