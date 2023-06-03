CREATE DATABASE IF NOT EXISTS aula_minsait;

-- Comando para dropar uma tabela, caso ela já exista
DROP TABLE IF EXISTS aula_minsait.filial;

-- Comando para criar uma tabela, caso ela não exista
CREATE TABLE aula_minsait.filial (
-- Denifinindo os campos e os tipos de campo das variáveis.
    `id_filial` STRING,
    `ds_filial` STRING,
    `id_cidade` STRING
    
)
-- Aqui eu estou especificando qual vai/vão ser minhas partições. 
-- Um campo particionado não faz parte dos campos descritos acima
PARTITIONED BY (DATA_FOTO STRING)
-- Especificações do formato da minha tabela. Nesse caso é o formato Orc
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat' 
TBLPROPERTIES ( 'orc.compress'='SNAPPY',
                'store.charset'='UTF-8', 'retrieve.charset'='UTF-8'
)
;