Documentação:

1) Foram definidos como dados a serem estudados os campos:
Dimensão Cliente:
- customer
- customerkey

Dimensão Localidade:
- city
- country
- region_name

Dimensão Tempo:
- Ano
- Dia
- Mês

Fato Vendas:
- sales_amount


2) Para os campos com espaços, como por exemplo o "Sales Amount", foi trocado o espaço por _
Ex: Sales Amount --> Sales_Amount

3) Para a ingestão dos dados .csv para o hive, foi utilizado a seguinte forma:
- Dividido em 2 bancos, sendo um Stage e um Gerenciavel
- Tabelas Stages( ou externas) ficam no banco Stage
- Tabelas Gerenciaveis (ou fato) ficam no banco Gerenciavel

4) Deve-se primeiro execular o script install.sh que encontra-se na pasta "scripts/pre_process"
Esse script irá criar as tabelas fato e externa

5) Após, deve-se executar os scripts que encontram-se na pasta "scripts/pre_process/malha"
Esses scripts irão fazer a transferência do arquivo .csv do ambiente Unix para o HDFS e em seguida realizar o tombamento (transferencia dos dados da tabela externa para gerenciavel)

6) As variáveis utilizadas nos scripts encontram-se no arquivo "config.sh"

7) a pasta "hql" encontram-se os hqls que serão invocados pelos scripts de criação das tabelas externas (pasta "create_stage"), tabelas gerenciaveis (pasta "create_managed") e o insert (pasta "insert_table")

8) a pasta "unix_to_hdfs" possui os scripts que fazem a transferência dos arquivos do ambiente Unix para o HDFS. Esses scripts são chamados automaticamente quando rodada os cripts da MALHA.

9) Após os dados estarem no HIVE, é possível então rodar o arquivo Python que fará o carregamento dos dados bem como o tratamento do mesmo, conforme regra, onde campos de números inteiros caso não possuam dado ou estejam como NULL será colocado o 0, e campos strings caso não possuam dados ou esteja como NULL será colocado "NAO ENCONTRADO".
Tal regra foi aplicado a TODOS os campos das tabelas.

10) Após, é realizad a criação do DataFrame Stage, o qual conterá os joins das tabelas e todos os campos presentes nelas.

11) É realizado também inserção de campos de data (Dia, mes, Ano) no DataFrame para que se possa criar a dimensão Tempo.

12) Após todo o tratamento, os dados são exportas, em arquivos .csv para a pasta "gold".

13) Os arquivos são lidos pelo PowerBI para criação de gráficos.

Obs1: Infelizmente não foram feitos testes para verificar se as somas apresentadas na agregação realmente batem.
Obs2: Como o objetivo não é a parte visual, coloquei só 2 gráficos no PowerBI só para mostrar as vendas x ano e vendas x cidade.
Obs3: Mesmo aplicando a transformação para ler o . no campo de valor como na forma Americana, não consegui acertar no gráfico (não entendi porque não atualizou)
























DESAFIO BIG DATA/MODELAGEM

📌 ESCOPO DO DESAFIO
Neste desafio serão feitas as ingestões dos dados que estão na pasta /raw onde vamos ter alguns arquivos .csv de um banco relacional de vendas.

 - VENDAS.CSV
 - CLIENTES.CSV
 - ENDERECO.CSV
 - REGIAO.CSV
 - DIVISAO.CSV

Seu trabalho como engenheiro de dados/arquiteto de BI é prover dados em uma pasta desafio_curso/gold em .csv para ser consumido por um relatório em PowerBI que deverá ser construído dentro da pasta 'app' (já tem o template).

📑 ETAPAS
Etapa 1 - Enviar os arquivos para o HDFS
    - nesta etapa lembre de criar um shell script para fazer o trabalho repetitivo (não é obrigatório)

Etapa 2 - Criar o banco DEASFIO_CURSO e dentro tabelas no Hive usando o HQL e executando um script shell dentro do hive server na pasta scripts/pre_process.

    - DESAFIO_CURSO (nome do banco)
        - TBL_VENDAS
        - TBL_CLIENTES
        - TBL_ENDERECO
        - TBL_REGIAO
        - TBL_DIVISAO

Etapa 3 - Processar os dados no Spark Efetuando suas devidas transformações criando os arquivos com a modelagem de BI.
OBS. o desenvolvimento pode ser feito no jupyter porem no final o codigo deve estar no arquivo desafio_curso/scripts/process/process.py

Etapa 4 - Gravar as informações em tabelas dimensionais em formato cvs delimitado por ';'.

        - FT_VENDAS
        - DIM_CLIENTES
        - DIM_TEMPO
        - DIM_LOCALIDADE

Etapa 5 - Exportar os dados para a pasta desafio_curso/gold

Etapa 6 - Criar e editar o PowerBI com os dados que você trabalhou.

No PowerBI criar gráficos de vendas.
Etapa 7 - Criar uma documentação com os testes e etapas do projeto.

REGRAS
Campos strings vazios deverão ser preenchidos com 'Não informado'.
Campos decimais ou inteiros nulos ou vazios, deversão ser preenchidos por 0.
Atentem-se a modelagem de dados da tabela FATO e Dimensão.
Na tabela FATO, pelo menos a métrica <b>valor de venda</b> é um requisito obrigatório.
Nas dimensões deverá conter valores únicos, não deverá conter valores repetidos.
para a dimensão tempo considerar o campo da TBL_VENDAS <b>Invoice Date</b>

INSTRUÇÕES
vocês deveram me entregar o projeto no github e por email (zip)
meu email: cgomesf@minsait.com
nome do email: DESAFIO MINSAIT BI/BIGDATA (Aluno)
dentro deste email o zip e o link para o github onde estará o projeto.
prazo limite: até <b>24/06/2023<b>
Apos esta data não poderei considerar para a nota.
