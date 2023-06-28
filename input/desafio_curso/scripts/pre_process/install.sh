#!/bin/bash

#CRIAÇÃO DO DIRETORIO NO HDFS
echo "Criando OS CAMINHOS NO HDFS"

hdfs dfs -mkdir -p /desafio_curso/datalake/raw/clientes/
hdfs dfs -mkdir -p /desafio_curso/datalake/raw/divisao/
hdfs dfs -mkdir -p /desafio_curso/datalake/raw/endereco/
hdfs dfs -mkdir -p /desafio_curso/datalake/raw/regiao/
hdfs dfs -mkdir -p /desafio_curso/datalake/raw/vendas/

echo "TÉRMINO DA CRIAÇÃO DOS CAMINHOS NO HDFS"

echo ; echo ; echo ; 

#Criação das Tabelas Externas

echo "Criando as Tabelas Stages"

cd /input/desafio_curso/scripts/pre_process/create_stage

./create_stage_clientes.sh
./create_stage_divisao.sh
./create_stage_endereco.sh
./create_stage_regiao.sh
./create_stage_vendas.sh

echo "TÉRMINO DA CRIAÇÃO DAS TABELAS STAGES"
echo ; echo ; echo ; 

#Criação das Tabelas Gerenciaveis

echo "Inicio da criação das tabelas Gerenciáveis"

cd /input/desafio_curso/scripts/pre_process/create_managed

./create_managed_clientes.sh
./create_managed_divisao.sh
./create_managed_endereco.sh
./create_managed_regiao.sh
./create_managed_vendas.sh

echo "TÉRMINO DA CRIAÇÃO DAS TABELAS GERENCIAVEIS"