CREATE EXTERNAL TABLE IF NOT EXISTS ${DATABASE_STAGE}.${STAGE_TABLE} ( 
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
COMMENT 'Tabela de Clientes'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '${DELIMITED}'
STORED AS TEXTFILE
location '${HDFS_LOCATION}'
TBLPROPERTIES ("skip.header.line.count"="1");