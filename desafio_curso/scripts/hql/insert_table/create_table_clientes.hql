CREATE TABLE ${DATABASE_TARGET}.${TARGET_TABLE_1} (

        Address Number string,
        Business Family string,
        Business Unit string,
        Customer string,
        CustomerKey string,
        Customer Type string,
        Division string,
        Line of Business string,
        Phone string,
        Region Code string,
        Regional Sales Mgr string,
        Search Type string
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