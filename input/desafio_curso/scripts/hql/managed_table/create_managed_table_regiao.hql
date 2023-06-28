CREATE DATABASE IF NOT EXISTS ${DATABASE_TARGET};

DROP TABLE IF EXISTS ${DATABASE_TARGET}.${TARGET_TABLE};

CREATE TABLE ${DATABASE_TARGET}.${TARGET_TABLE} (
        Region_Code string,
        Region_Name string
)

PARTITIONED BY (DATA_FOTO STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat' 
TBLPROPERTIES ( 'orc.compress'='SNAPPY',
  'store.charset'='UTF-8', 'retrieve.charset'='UTF-8'
);