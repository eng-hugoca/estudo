CREATE TABLE ${DATABASE_TARGET}.${TARGET_TABLE_5} (

        Actual Delivery Date string,
        CustomerKey string,
        DateKey string,
        Discount Amount string,
        Invoice Date string,
        Invoice Number string,
        Item Class string,
        Item Number string,
        Item string,
        Line Number string,
        List Price string,
        Order Number string,
        Promised Delivery Date string,
        Sales Amount string,
        Sales Amount Based on List Price string,
        Sales Cost Amount string,
        Sales Margin Amount string,
        Sales Price string,
        Sales Quantity string,
        Sales Rep string,
        U/M string
)

PARTITIONED BY (DATA_FOTO STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat' 
TBLPROPERTIES ( 'orc.compress'='SNAPPY',
                'transactional'='true',
                'transactional_properties'='insert_only',
                'store.charset'='UTF-8', 'retrieve.charset'='UTF-8'
);