CREATE TABLE ${DATABASE_TARGET}.${TARGET_TABLE_3} (

        Address Number string,
        City string,
        Country string,
        Customer Address 1 string,
        Customer Address 2 string,
        Customer Address 3 string,
        Customer Address 4 string,
        State string,
        Zip Code string
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