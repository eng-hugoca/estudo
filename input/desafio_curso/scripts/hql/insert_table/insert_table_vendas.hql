
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;


INSERT INTO 
   ${DATABASE_TARGET}.${TARGET_TABLE_5}

PARTITION(DATA_FOTO) 
SELECT

        Address Number,
        Business Family,
        Business Unit,
        Customer,
        CustomerKey,
        Customer Type,
        Division,
        Line of Business,
        Phone,
        Region Code,
        Regional Sales Mgr,
        Search Type,
        ${DATE_REFERENCE} AS ${PARTITION_NAME}
FROM ${DATABASE_STAGE}.${STAGE_TABLE_5}
;