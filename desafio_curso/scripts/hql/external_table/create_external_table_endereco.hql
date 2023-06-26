CREATE EXTERNAL TABLE IF NOT EXISTS ${DATABASE_STAGE}.${STAGE_TABLE_3} ( 
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
COMMENT 'Tabela de Endereco'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '${DELIMITED}'
STORED AS TEXTFILE
location '${HDFS_LOCATION_3}'
TBLPROPERTIES ("skip.header.line.count"="1");