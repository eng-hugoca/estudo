
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;


INSERT INTO 
   ${DATABASE_TARGET}.${TARGET_TABLE}

PARTITION(DATA_FOTO) 
SELECT

        Address_Number,
        Business_Family,
        Business_Unit,
        Customer,
        CustomerKey,
        Customer_Type,
        Division,
        Line_of_Business,
        Phone,
        Region_Code,
        Regional_Sales_Mgr,
        Search_Type,
        ${DATE_REFERENCE} AS ${PARTITION_NAME}
FROM ${DATABASE_STAGE}.${STAGE_TABLE}
;