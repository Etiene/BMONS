#!/bin/sh

DATE=$(date +"%Y%m%d")
DATETIME=$(date +"%Y%m%d_%H-%M-%S")
DIR="/home/bmons/Backups/$DATE"

#makes dir if it doesnt exist
mkdir -p $DIR

pg_dump bmons > $DIR/bmons_$DATETIME.sql
pg_dump bmons_test > $DIR/bmons_test_$DATETIME.sql
pg_dump bmons_development > $DIR/bmons_development_$DATETIME.sql
pg_dump bmons_production > $DIR/bmons_production_$DATETIME.sql