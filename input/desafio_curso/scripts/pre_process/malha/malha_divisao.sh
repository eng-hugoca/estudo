#!/bin/bash

# Unix to HDFS

cd /input/desafio_curso/scripts/pre_process/unix_to_hdfs

./unix_to_hdfs_divisao.sh


#INSERINDO DADOS DA TABELA STAGE PARA A GERENCIAVEL

cd /input/desafio_curso/scripts/pre_process/insert_table

./insert_table_divisao.sh



