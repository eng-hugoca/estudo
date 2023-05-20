# !/bin/bash

CATEGORIA="categoria cidade cliente"


for NOME in $CATEGORIA
do
    cd /workspace/estudo/input/curso_minsait/raw/
    mkdir $NOME
    cd $NOME
    curl -O https://raw.githubusercontent.com/caiuafranca/dados_curso/main/$NOME.csv
done

#teste="uni duni"
#for i in $teste
#do
#    echo $i
#done
