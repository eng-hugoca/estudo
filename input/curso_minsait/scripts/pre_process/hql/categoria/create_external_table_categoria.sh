-- Formato do arquivo: CSV
-- Query para criar uma tabela temporária para acessar os dados a partir de um diretório

-- Comando para criar um banco de dados, caso não exista 
-- Parâmetro TARGET_DATABASE que consta no sh de configuração sendo utilizado para definir o nome do banco.
CREATE DATABASE IF NOT EXISTS aula_minsait_raw;

-- Comando para dropar uma tabela, caso ela já exista
DROP TABLE IF EXISTS aula_minsait_raw.categoria_stg;

-- Comando para criar uma tabela, caso ela não exista
CREATE EXTERNAL TABLE aula_minsait_raw.categoria_stg(
-- Denifinindo os campos e os tipos de campo das variáveis.

    `id_categoria` STRING,
    `ds_categoria` STRING,
    `perc_parceiro` STRING
    
)
-- Tipo de separador que o meu texto se encontra
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'

-- Tipo de armazenamento
STORED AS TEXTFILE
-- Local de armazenamento dos arquivos
-- Parâmetro HDFS_DIR que consta no sh de configuração sendo utilizado para definir o nome do banco.
LOCATION '/datalake/raw/categoria'
--skip.header=> Opção para pular a primeira linha, se meu arquivo tem um header
--charset=>Especificar o charset de entrada e saída
tblproperties ('skip.header.line.count'='1', 'store.charset'='UTF-8', 'retrieve.charset'='UTF-8');