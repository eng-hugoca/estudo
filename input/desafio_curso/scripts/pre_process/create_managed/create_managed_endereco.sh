#!/bin/bash

source "/input/desafio_curso/scripts/config.sh"

HIVEVAR="--hivevar DATABASE_STAGE=${DATABASE_STAGE} --hivevar STAGE_TABLE=${STAGE_TABLE_3} --hivevar DATABASE_TARGET=${DATABASE_TARGET} --hivevar TARGET_TABLE=${TARGET_TABLE_3} --hivevar PARTITION_NAME=${PARTITION_NAME} --hivevar DATE_REFERENCE=${DATE_REFERENCE} --hivevar HDFS_LOCATION=${HDFS_LOCATION_3} --hivevar DELIMITED=${DELIMITED}"

beeline -u jdbc:hive2://localhost:10000 ${HIVEVAR} -f /input/desafio_curso/scripts/hql/managed_table/create_managed_table_endereco.hql


