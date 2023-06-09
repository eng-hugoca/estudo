CREATE DATABASE IF NOT EXISTS ${DATABASE_TARGET};

DROP TABLE IF EXISTS ${DATABASE_TARGET}.${TARGET_TABLE};

CREATE TABLE ${DATABASE_TARGET}.${TARGET_TABLE} (

        Address_Number string,
        Business_Family string,
        Business_Unit string,
        Customer string,
        CustomerKey string,
        Customer_Type string,
        Division string,
        Line_of_Business string,
        Phone string,
        Region_Code string,
        Regional_Sales_Mgr string,
        Search_Type string
)

PARTITIONED BY (DATA_FOTO STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat' 
TBLPROPERTIES ( 'orc.compress'='SNAPPY',
  'store.charset'='UTF-8', 'retrieve.charset'='UTF-8'
);