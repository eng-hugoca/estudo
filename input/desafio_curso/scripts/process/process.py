from pyspark.sql import SparkSession, dataframe
from pyspark.sql.types import StructType, StructField
from pyspark.sql.types import DoubleType, IntegerType, StringType
from pyspark.sql import HiveContext
import pyspark.sql.functions as F
from pyspark.sql import functions as f
import os
import re

#Realizando a leitura das tabelas no HIVE para o DataFrame
# dim_clientes / dim_divisao / dim_endereco / dim_regiao
df_clientes = spark.sql("select * from desafio_curso.clientes")
df_divisao = spark.sql("select * from desafio_curso.divisao")
df_endereco = spark.sql("select * from desafio_curso.endereco")
df_regiao = spark.sql("select * from desafio_curso.regiao")


# fato_vendas
df_vendas = spark.sql("select * from desafio_curso.vendas")


#Aplicando as regras de tratamento de dados para os DataFrames

#TRATAMENTO DE DADOS DAS TABELAS

#Tratamento df_clientes

df_clientes_distinct = df_clientes.distinct()


df_clientes_distinct = df_clientes_distinct.select(
    F.when( F.col("address_number").isNull() | ( F.trim(F.col("address_number") ) == "") , "0").otherwise(F.col("address_number")).alias("address_number"),
    F.when( F.col("business_family").isNull() | ( F.trim(F.col("business_family") ) == "") , "NAO ENCONTRADO").otherwise(F.col("business_family")).alias("business_family"),
    F.when( F.col("business_unit").isNull() | ( F.trim(F.col("business_unit") ) == "") , "0").otherwise(F.col("business_unit")).alias("business_unit"),
    F.when( F.col("customer").isNull() | ( F.trim(F.col("customer") ) == "") , "NAO ENCONTRADO").otherwise(F.col("customer")).alias("customer"),
    F.when( F.col("customerkey").isNull() | ( F.trim(F.col("customerkey") ) == "") , "0").otherwise(F.col("customerkey")).alias("customerkey"),
    F.when( F.col("customer_type").isNull() | ( F.trim(F.col("customer_type") ) == "") , "NAO ENCONTRADO").otherwise(F.col("customer_type")).alias("customer_type"),
    F.when( F.col("division").isNull() | ( F.trim(F.col("division") ) == "") , "0").otherwise(F.col("division")).alias("division"),
    F.when( F.col("line_of_business").isNull() | ( F.trim(F.col("line_of_business") ) == "") , "NAO ENCONTRADO").otherwise(F.col("line_of_business")).alias("line_of_business"),
    F.when( F.col("phone").isNull() | ( F.trim(F.col("phone") ) == "") , "NAO ENCONTRADO").otherwise(F.col("phone")).alias("phone"),
    F.when( F.col("region_code").isNull() | ( F.trim(F.col("region_code") ) == "") , "NAO ENCONTRADO").otherwise(F.col("region_code")).alias("region_code"),
    F.when( F.col("regional_sales_mgr").isNull() | ( F.trim(F.col("regional_sales_mgr") ) == "") , "NAO ENCONTRADO").otherwise(F.col("regional_sales_mgr")).alias("regional_sales_mgr"),
    F.when( F.col("search_type").isNull() | ( F.trim(F.col("search_type") ) == "") , "NAO ENCONTRADO").otherwise(F.col("search_type")).alias("search_type"),
    F.col("data_foto")
    
)

#Tratamento df_endereco

df_endereco_distinct = df_endereco.distinct()

df_endereco_distinct = df_endereco_distinct.select(
    F.when( F.col("address_number").isNull() | ( F.trim(F.col("address_number") ) == "") , "0").otherwise(F.col("address_number")).alias("address_number"),
    F.when( F.col("city").isNull() | ( F.trim(F.col("city") ) == "") , "NAO ENCONTRADO").otherwise(F.col("city")).alias("city"),
    F.when( F.col("country").isNull() | ( F.trim(F.col("country") ) == "") , "NAO ENCONTRADO").otherwise(F.col("country")).alias("country"),
    F.when( F.col("customer_address_1").isNull() | ( F.trim(F.col("customer_address_1") ) == "") , "NAO ENCONTRADO").otherwise(F.col("customer_address_1")).alias("customer_address_1"),
    F.when( F.col("customer_address_2").isNull() | ( F.trim(F.col("customer_address_2") ) == "") , "NAO ENCONTRADO").otherwise(F.col("customer_address_2")).alias("customer_address_2"),
    F.when( F.col("customer_address_3").isNull() | ( F.trim(F.col("customer_address_3") ) == "") , "NAO ENCONTRADO").otherwise(F.col("customer_address_3")).alias("customer_address_3"),
    F.when( F.col("customer_address_4").isNull() | ( F.trim(F.col("customer_address_4") ) == "") , "NAO ENCONTRADO").otherwise(F.col("customer_address_4")).alias("customer_address_4"),
    F.when( F.col("state").isNull() | ( F.trim(F.col("state") ) == "") , "NAO ENCONTRADO").otherwise(F.col("state")).alias("state"),
    F.when( F.col("zip_code").isNull() | ( F.trim(F.col("zip_code") ) == "") , "NAO ENCONTRADO").otherwise(F.col("zip_code")).alias("zip_code"),
    F.col("data_foto")
    
)


#Tratamento df_vendas

df_vendas_distinct = df_vendas.distinct()

df_vendas_distinct = df_vendas_distinct.select(
    F.when( F.col("actual_delivery_date").isNull() | ( F.trim(F.col("actual_delivery_date") ) == "") , "NAO ENCONTRADO").otherwise(F.col("actual_delivery_date")).alias("actual_delivery_date"),
    F.when( F.col("customerkey").isNull() | ( F.trim(F.col("customerkey") ) == "") , "0").otherwise(F.col("customerkey")).alias("customerkey"),
    F.when( F.col("datekey").isNull() | ( F.trim(F.col("datekey") ) == "") , "NAO ENCONTRADO").otherwise(F.col("datekey")).alias("datekey"),
    F.when( F.col("discount_amount").isNull() | ( F.trim(F.col("discount_amount") ) == "") , "0").otherwise(F.col("discount_amount")).alias("discount_amount"),
    F.when( F.col("invoice_date").isNull() | ( F.trim(F.col("invoice_date") ) == "") , "NAO ENCONTRADO").otherwise(F.col("invoice_date")).alias("invoice_date"),
    F.when( F.col("invoice_number").isNull() | ( F.trim(F.col("invoice_number") ) == "") , "NAO ENCONTRADO").otherwise(F.col("invoice_number")).alias("invoice_number"),
    F.when( F.col("item_class").isNull() | ( F.trim(F.col("item_class") ) == "") , "0").otherwise(F.col("item_class")).alias("item_class"),
    F.when( F.col("item_number").isNull() | ( F.trim(F.col("item_number") ) == "") , "NAO ENCONTRADO").otherwise(F.col("item_number")).alias("item_number"),
    F.when( F.col("item").isNull() | ( F.trim(F.col("item") ) == "") , "NAO ENCONTRADO").otherwise(F.col("item")).alias("item"),
    F.when( F.col("line_number").isNull() | ( F.trim(F.col("line_number") ) == "") , "0").otherwise(F.col("line_number")).alias("line_number"),
    F.when( F.col("list_price").isNull() | ( F.trim(F.col("list_price") ) == "") , "0").otherwise(F.col("list_price")).alias("list_price"),
    F.when( F.col("order_number").isNull() | ( F.trim(F.col("order_number") ) == "") , "NAO ENCONTRADO").otherwise(F.col("order_number")).alias("order_number"),
    F.when( F.col("promised_delivery_date").isNull() | ( F.trim(F.col("promised_delivery_date") ) == "") , "0").otherwise(F.col("promised_delivery_date")).alias("promised_delivery_date"),
    F.when( F.col("sales_amount").isNull() | ( F.trim(F.col("sales_amount") ) == "") , "0").otherwise(F.col("sales_amount")).alias("sales_amount"),
    F.when( F.col("sales_amount_based_on_list_price").isNull() | ( F.trim(F.col("sales_amount_based_on_list_price") ) == "") , "0").otherwise(F.col("sales_amount_based_on_list_price")).alias("sales_amount_based_on_list_price"),
    F.when( F.col("sales_cost_amount").isNull() | ( F.trim(F.col("sales_cost_amount") ) == "") , "0").otherwise(F.col("sales_cost_amount")).alias("sales_cost_amount"),
    F.when( F.col("sales_margin_amount").isNull() | ( F.trim(F.col("sales_margin_amount") ) == "") , "0").otherwise(F.col("sales_margin_amount")).alias("sales_margin_amount"),
    F.when( F.col("sales_price").isNull() | ( F.trim(F.col("sales_price") ) == "") , "0").otherwise(F.col("sales_price")).alias("sales_price"),
    F.when( F.col("sales_quantity").isNull() | ( F.trim(F.col("sales_quantity") ) == "") , "0").otherwise(F.col("sales_quantity")).alias("sales_quantity"),
    F.when( F.col("sales_rep").isNull() | ( F.trim(F.col("sales_rep") ) == "") , "0").otherwise(F.col("sales_rep")).alias("sales_rep"),
    F.when( F.col("u_m").isNull() | ( F.trim(F.col("u_m") ) == "") , "NAO ENCONTRADO").otherwise(F.col("u_m")).alias("u_m"),
    F.col("data_foto")
    
)


#REALIZANDO OS JOIN PARA A CRIAÇÃO DA STAGE 

df_stage = df_vendas_distinct.join( df_clientes_distinct, df_vendas_distinct.customerkey == df_clientes_distinct.customerkey , "left") \
    .join(df_endereco_distinct, df_clientes_distinct.address_number == df_endereco_distinct.address_number , "left") \
    .join(df_divisao, df_divisao.division == df_clientes_distinct.division,"left") \
    .join(df_regiao, df_regiao.region_code == df_clientes_distinct.region_code, "left") \
    .select(
    df_vendas_distinct.actual_delivery_date,
    df_vendas_distinct.customerkey,
    df_vendas_distinct.datekey,
    df_vendas_distinct.discount_amount,
    df_vendas_distinct.invoice_date,
    df_vendas_distinct.invoice_number,
    df_vendas_distinct.item_class,
    df_vendas_distinct.item_number,
    df_vendas_distinct.item,
    df_vendas_distinct.line_number,
    df_vendas_distinct.list_price,
    df_vendas_distinct.order_number,
    df_vendas_distinct.promised_delivery_date,
    df_vendas_distinct.sales_amount,
    df_vendas_distinct.sales_amount_based_on_list_price,
    df_vendas_distinct.sales_cost_amount,
    df_vendas_distinct.sales_margin_amount,
    df_vendas_distinct.sales_price,
    df_vendas_distinct.sales_quantity,
    df_vendas_distinct.sales_rep,
    df_vendas_distinct.u_m,
    df_regiao.region_name,
    df_divisao.division_name,
    df_endereco_distinct.city,
    df_endereco_distinct.country,
    df_endereco_distinct.customer_address_1,
    df_endereco_distinct.customer_address_2,
    df_endereco_distinct.customer_address_3,
    df_endereco_distinct.customer_address_4,
    df_endereco_distinct.state,
    df_endereco_distinct.zip_code,
    df_clientes_distinct.business_family,
    df_clientes_distinct.business_unit,
    df_clientes_distinct.customer,
    df_clientes_distinct.customer_type,
    df_clientes_distinct.line_of_business,
    df_clientes_distinct.phone,
    df_clientes_distinct.regional_sales_mgr,
    df_clientes_distinct.search_type,
)

#Criando os tempos e aproveitando para transformar a , em . na coluna "Sales_amount"

df_stage = (df_stage
            .withColumn('Ano', F.substring(df_stage.invoice_date, 7, 4))
            .withColumn('Mês', F.substring(df_stage.invoice_date, 4 , 2))
            .withColumn('Dia', F.substring(df_stage.invoice_date, 1 , 2))
            .withColumn('sales_amount', F.regexp_replace('sales_amount', ',', '.'))
            )


#Criação das chaves na STAGE

df_stage = df_stage.withColumn("DW_CLIENTES", F.sha2(F.concat_ws("", df_stage.customerkey, df_stage.customer), 256))
df_stage = df_stage.withColumn("DW_LOCALIDADE", F.sha2(F.concat_ws("", df_stage.city, df_stage.country, df_stage.region_name), 256))
df_stage = df_stage.withColumn("DW_TEMPO", F.sha2(F.concat_ws("", df_stage.Ano, df_stage.Dia, df_stage.Mês), 256))


#Criação das dimensões e fato

dim_clientes = df_stage.select(F.col("DW_CLIENTES"),F.col("customerkey"),F.col("customer")).distinct()
dim_localidade = df_stage.select(F.col("DW_LOCALIDADE"), F.col("city"), F.col("country"), F.col("region_name")).distinct()
dim_tempo = df_stage.select(F.col("DW_TEMPO"), F.col("Ano"), F.col("Mês"), F.col("Dia")).distinct()
ft_vendas = df_stage.select(F.col("DW_CLIENTES"),F.col("DW_LOCALIDADE"), F.col("DW_TEMPO"), F.col("sales_amount")).groupBy(F.col("DW_CLIENTES"),F.col("DW_LOCALIDADE"), F.col("DW_TEMPO")).agg(F.sum(F.col("sales_amount"))).distinct()

# função para salvar os dados
# desafio efetuar a gravação no Hive - me passar a função modificada
def salvar_df(df, file):
    output = "/input/desafio_curso/gold/" + file
    erase = "hdfs dfs -rm " + output + "/*"
    rename = "hdfs dfs -get /datalake/gold/"+file+"/part-* /input/desafio_curso/gold/"+file+".csv"
    print(rename)   
    
    df.coalesce(1).write\
        .format("csv")\
        .option("header", True)\
        .option("delimiter", ";")\
        .mode("overwrite")\
        .save("/datalake/gold/"+file+"/")

    os.system(erase)
    os.system(rename)


salvar_df(dim_clientes, 'dim_clientes')
salvar_df(dim_localidade, 'dim_localidade')
salvar_df(dim_tempo, 'dim_tempo')
salvar_df(ft_vendas, 'ft_vendas')