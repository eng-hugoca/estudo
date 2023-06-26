CREATE DATABASE IF NOT EXISTS ${DATABASE_TARGET};

DROP TABLE IF EXISTS ${DATABASE_TARGET}.${TARGET_TABLE};

CREATE TABLE ${DATABASE_TARGET}.${TARGET_TABLE} (

        Address_Number string,
        City string,
        Country string,
        Customer_Address_1 string,
        Customer_Address_2 string,
        Customer_Address_3 string,
        Customer_Address_4 string,
        State string,
        Zip_Code string
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