CREATE DATABASE IF NOT EXISTS ${DATABASE_TARGET};

DROP TABLE IF EXISTS ${DATABASE_TARGET}.${TARGET_TABLE};

CREATE TABLE ${DATABASE_TARGET}.${TARGET_TABLE} (

        Actual_Delivery_Date string,
        CustomerKey string,
        DateKey string,
        Discount_Amount string,
        Invoice_Date string,
        Invoice_Number string,
        Item_Class string,
        Item_Number string,
        Item string,
        Line_Number string,
        List_Price string,
        Order_Number string,
        Promised_Delivery_Date string,
        Sales_Amount string,
        Sales_Amount_Based_on_List_Price string,
        Sales_Cost_Amount string,
        Sales_Margin_Amount string,
        Sales_Price string,
        Sales_Quantity string,
        Sales_Rep string,
        `U_M` string
)

PARTITIONED BY (DATA_FOTO STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat' 
TBLPROPERTIES ( 'orc.compress'='SNAPPY',
  'store.charset'='UTF-8', 'retrieve.charset'='UTF-8'
);