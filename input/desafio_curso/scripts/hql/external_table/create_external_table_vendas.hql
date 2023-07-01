CREATE DATABASE IF NOT EXISTS ${DATABASE_STAGE};

DROP TABLE IF EXISTS ${DATABASE_STAGE}.${STAGE_TABLE};

CREATE EXTERNAL TABLE IF NOT EXISTS ${DATABASE_STAGE}.${STAGE_TABLE} ( 
        `Actual_Delivery_Date` string,
        `CustomerKey` string,
        DateKey string,
        Discount_Amount string,
        Invoice_Date string,
        Invoice_Number string,
        Item_Class string,
        Item_Number string,
        Item string,
        Line_Number string,
        List_Price string,
        Order_Number string,
        Promised_Delivery_Date string,
        Sales_Amount string,
        Sales_Amount_Based_on_List_Price string,
        Sales_Cost_Amount string,
        Sales_Margin_Amount string,
        Sales_Price string,
        Sales_Quantity string,
        Sales_Rep string,
        `U_M` string
    )
COMMENT 'Tabela de Vendas'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '${DELIMITED}'
STORED AS TEXTFILE
location '${HDFS_LOCATION}'
TBLPROPERTIES ("skip.header.line.count"="1");