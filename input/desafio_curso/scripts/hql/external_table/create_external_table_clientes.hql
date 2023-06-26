CREATE DATABASE IF NOT EXISTS ${DATABASE_STAGE};

DROP TABLE IF EXISTS ${DATABASE_STAGE}.${STAGE_TABLE};

CREATE EXTERNAL TABLE IF NOT EXISTS ${DATABASE_STAGE}.${STAGE_TABLE} ( 
        `Address_Number` string,
        `Business_Family` string,
        `Business_Unit` string,
        `Customer` string,
        `CustomerKey` string,
        `Customer_Type` string,
        `Division` string,
        `Line_of_Business` string,
        `Phone` string,
        `Region_Code` string,
        `Regional_Sales_Mgr` string,
        `Search_Type` string
    )
COMMENT 'Tabela de Clientes'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '${DELIMITED}'
STORED AS TEXTFILE
location '${HDFS_LOCATION}'
TBLPROPERTIES ("skip.header.line.count"="1");