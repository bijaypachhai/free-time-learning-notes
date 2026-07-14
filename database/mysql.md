# Useful Utilities Related to MySQL Database

```bash
## DUMP A SPECIFIC DATABASE
mysqldump -u [uname] -p db_name > db_backup.sql

## DUMP ALL DATABASES
mysqldump -u [uname] -p --all-databases > all_db_backup.sql

## SPECIFIC TABLE
mysqldump -u [uname] -p db_name table1 table2 > table_backup.sql

## AUTO COMPRESSING THE OUTPUT USING GZIP
mysqldump -u [uname] -p db_name | gzip > db_backup.sql.gz

## DATABASE SERVER IS REMOTE
mysqldump -P 3306 -h [ip_address] -u [uname] -p db_name > db_backup.sql
```
