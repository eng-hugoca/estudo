
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;


INSERT INTO 
   ${DATABASE_TARGET}.${TARGET_TABLE_3}

PARTITION(DATA_FOTO) 
SELECT

        Address Number,
        City,
        Country,
        Customer Address 1,
        Customer Address 2,
        Customer Address 3,
        Customer Address 4,
        State,
        Zip Code,
        ${DATE_REFERENCE} AS ${PARTITION_NAME}
FROM ${DATABASE_STAGE}.${STAGE_TABLE_3}
;