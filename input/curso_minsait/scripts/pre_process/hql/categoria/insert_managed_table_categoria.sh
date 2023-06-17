SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

-- Insert into vai adicionar dados as partições já existentes.
INSERT INTO 

-- Insert Overwrite ele vai sobrescrever os dados de uma determinada partição
--INSERT OVERWRITE TABLE
-- Tabela definitiva que vai acontecer a inseção dos dados
-- Parâmetro TARGET_DATABASE que consta no sh de configuração sendo utilizado para definir o nome do banco.
    aula_minsait.categoria
-- Partição ou partições que foi definida na tabela definitiva
PARTITION(DATA_FOTO) 
SELECT
-- Campos que foram definidos para inserir os dados
-- Os últimos campos que eu estou inserindo tem que corresponder obrigatoriamente 
-- com os campos da/das minha/minhas partições
    `id_categoria`,
    `ds_categoria`,
    `perc_parceiro`,
    "20230603" AS DATA_FOTO
-- Tabela temporária que contém os dados
FROM aula_minsait_raw.categoria_stg
-- Para inserir os dados em uma determinada partição
-- Parâmetro DATE_INSERT que consta no sh de configuração sendo utilizado para definir o nome do banco.
--WHERE particao_data="${DATE_INSERT}"
;