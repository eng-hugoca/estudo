CREATE EXTERNAL TABLE IF NOT EXISTS ${DATABASE_STAGE}.${STAGE_TABLE} ( 
        Region Code string,
        Region Name string
    )
COMMENT 'Tabela de Regiao'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '${DELIMITED}'
STORED AS TEXTFILE
location '${HDFS_LOCATION}'
TBLPROPERTIES ("skip.header.line.count"="1");