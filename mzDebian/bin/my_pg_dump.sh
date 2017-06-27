# pg_dump -h localhost -p 5433 -U postgres
mkdir -p /var/lib/pghoard/mzDebian/pgdump/

pg_dumpall -h localhost -p 5433 -g > /var/lib/pghoard/mzDebian/pgdump/globals.sql
pg_dump -h localhost -p 5433 -C -F c -b -v -f /var/lib/pghoard/mzDebian/pgdump/krepo krepo
pg_dump -h localhost -p 5433 -C -F c -b -v -f /var/lib/pghoard/mzDebian/pgdump/sluzbicka sluzbicka

/usr/local/bin/gsutil -m rsync -d /var/lib/pghoard/mzDebian/pgdump gs://bk-pghoard/mzDebian/pgdump

# drop database krepo ; pg_restore -i -d databaze -v /var/lib/pghoard/mzDebian/pgdump/krepo
