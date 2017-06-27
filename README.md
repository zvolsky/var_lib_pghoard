# var_lib_pghoard
debian pghoard working folder incl. cron, pgdump backup to Google cloud storage and restore hints

## Postgres backup solution
nothing completly production ready, but backup of my current setting.

###
Cron forces once in the night pg_dump(all) and every 2 minutes "gsutil rsync" of the partial wal/xlog.
So in good case we will lose nothing more then last 2 minutes.
In worsest case we could restore from the nightly made logical backup.

###
In bin/restore some (very stupid) restore tasks, which can be run or you can make them step-by-step in case of problem.
