#!/bin/bash


source "/input/desafio_curso/scripts/config.sh"

hdfs dfs -copyFromLocal /input/desafio_curso/raw/${TARGET_TABLE_3^^}.csv /desafio_curso/datalake/raw/${TARGET_TABLE_3}/