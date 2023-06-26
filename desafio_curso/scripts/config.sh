!/bin/bash


DATABASE_STAGE="stg_desafio_curso"
DATABASE_TARGET="desafio_curso"


STAGE_TABLE_1="stg_clientes"
STAGE_TABLE_2="stg_divisao"
STAGE_TABLE_3="stg_endereco"
STAGE_TABLE_4="stg_regiao"
STAGE_TABLE_5="stg_vendas"

TARGET_TABLE_1="clientes"
TARGET_TABLE_2="divisao"
TARGET_TABLE_3="endereco"
TARGET_TABLE_4="regiao"
TARGET_TABLE_5="vendas"

HDFS_LOCATION_1="/desafio_curso/datalake/raw/clientes/"
HDFS_LOCATION_2="/desafio_curso/datalake/raw/divisao/"
HDFS_LOCATION_3="/desafio_curso/datalake/raw/endereco/"
HDFS_LOCATION_4="/desafio_curso/datalake/raw/regiao/"
HDFS_LOCATION_5="/desafio_curso/datalake/raw/vendas/"

DELIMITED=";"