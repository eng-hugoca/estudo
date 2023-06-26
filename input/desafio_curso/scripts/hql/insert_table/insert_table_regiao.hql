
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;


INSERT INTO 
   ${DATABASE_TARGET}.${TARGET_TABLE_4}

PARTITION(DATA_FOTO) 
SELECT

        Region Code,
        Region Name,
        ${DATE_REFERENCE} AS ${PARTITION_NAME}
FROM ${DATABASE_STAGE}.${STAGE_TABLE_4}
;