# !/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG="${BASEDIR}/../../config/config.sh"
source "${CONFIG}"

echo "Iniciando a criacao em ${DATE}"

for table in "${TABLES[@]}"
do
    echo "Tabela $table"
    cd ../../raw/
    mkdir $table
    chmod 777 $table
    cd $table
    curl -O https://raw.githubusercontent.com/caiuafranca/dados_curso/main/$table.csv


    hdfs dfs -mkdir -p /datalake/raw/$table 
    hdfs dfs -chmod 777 /datalake/raw/$table
    hdfs dfs -copyFromLocal $table.csv /datalake/raw/$table

done

echo "Finalizado"











#CATEGORIA="categoria cidade cliente"

    
#for NOME in $CATEGORIA
#do
#    cd /workspace/estudo/input/curso_minsait/raw/
#    mkdir $NOME
#    cd $NOME
#    curl -O https://raw.githubusercontent.com/caiuafranca/dados_curso/main/$NOME.csv
#done

#teste="uni duni"
#for i in $teste
#do
#    echo $i
#done
