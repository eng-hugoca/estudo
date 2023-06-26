CREATE TABLE ${DATABASE_TARGET}.${TARGET_TABLE_2} (

        Division string,
        Division Name string
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