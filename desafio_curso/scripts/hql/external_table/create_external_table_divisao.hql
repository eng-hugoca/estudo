CREATE EXTERNAL TABLE IF NOT EXISTS ${DATABASE_STAGE}.${STAGE_TABLE_2} ( 
        Division string,
        Division Name string
    )
COMMENT 'Tabela de Divisao'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '${DELIMITED}'
STORED AS TEXTFILE
location '${HDFS_LOCATION_2}'
TBLPROPERTIES ("skip.header.line.count"="1");