
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;


INSERT INTO 
   ${DATABASE_TARGET}.${TARGET_TABLE}

PARTITION(DATA_FOTO) 
SELECT
        Actual_Delivery_Date,
        CustomerKey,
        DateKey,
        Discount_Amount,
        Invoice_Date,
        Invoice_Number,
        Item_Class,
        Item_Number,
        Item,
        Line_Number,
        List_Price,
        Order_Number,
        Promised_Delivery_Date,
        Sales_Amount,
        Sales_Amount_Based_on_List_Price,
        Sales_Cost_Amount,
        Sales_Margin_Amount,
        Sales_Price,
        Sales_Quantity,
        Sales_Rep,
        U_M,
        
        ${DATE_REFERENCE} AS ${PARTITION_NAME}
FROM ${DATABASE_STAGE}.${STAGE_TABLE}
;