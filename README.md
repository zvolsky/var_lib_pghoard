# var_lib_pghoard
debian pghoard working folder incl. cron, pgdump backup to Google cloud storage and restore hints

## Postgres backup solution
nothing completly production ready, but backup of my current setting.

### Minimal infrastructure
we need Forpsi virtual server 20G for 1.20 EUR/month + 5G Google cloud storage for free + Dropbox.

###
Cron forces once in the night pg_dump(all).
Partial wal/xlog is backuped via Dropbox.
So in good case we will lose nothing or something about last 1 min.
In worsest case we could restore from the nightly made logical backup.

###
In bin/restore some (very stupid) restore tasks, which can be run or you can make them step-by-step in case of problem.

###
And now .... read mzDebian/README.