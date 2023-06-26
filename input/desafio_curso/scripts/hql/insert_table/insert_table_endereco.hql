
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;


INSERT INTO 
   ${DATABASE_TARGET}.${TARGET_TABLE}

PARTITION(DATA_FOTO) 
SELECT

        Address_Number,
        City,
        Country,
        Customer_Address_1,
        Customer_Address_2,
        Customer_Address_3,
        Customer_Address_4,
        State,
        Zip_Code,
        ${DATE_REFERENCE} AS ${PARTITION_NAME}
FROM ${DATABASE_STAGE}.${STAGE_TABLE}
;