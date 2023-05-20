# !/bin/bash

CATEGORIA="categoria"

cd ../../raw
mkdir $CATEGORIA
cd $CATEGORIA
curl -O https://raw.githubusercontent.com/caiuafranca/dados_curso/main/categoria.csv