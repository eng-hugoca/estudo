#!/bin/bash

source "/input/desafio_curso/scripts/config.sh"

HIVEVAR="--hivevar DATABASE_STAGE=${DATABASE_STAGE} --hivevar STAGE_TABLE=${STAGE_TABLE_1} --hivevar DATABASE_TARGET=${DATABASE_TARGET} --hivevar TARGET_TABLE=${TARGET_TABLE_1} --hivevar PARTITION_NAME=${PARTITION_NAME} --hivevar DATE_REFERENCE=${DATE_REFERENCE} --hivevar HDFS_LOCATION=${HDFS_LOCATION_1} --hivevar DELIMITED=${DELIMITED}"

beeline -u jdbc:hive2://localhost:10000 ${HIVEVAR} -f /input/desafio_curso/scripts/hql/external_table/create_external_table_clientes.hql


