-- Atualizar o estado de todos os orçamentos pendentes para 'Rejeitado'
SELECT * from dw_schema_lojas."DimOrcamento" t  where t."Estado" = 'Pendente';

update  dw_schema_lojas."DimOrcamento" t 
set "Estado" = 'Rejeitado'
where t."Estado" = 'Pendente';

SELECT * from dw_schema_lojas."DimOrcamento" t  where t."Estado" = 'Pendente';

-- Atualizar o nome de um empregado e de uma loja específica
SELECT * from dw_schema_lojas."DimEmpregado" de  where de."EmpregadoKey" = 3;

update  dw_schema_lojas."DimEmpregado" de 
set "Nome" = 'Vitor'
where de."EmpregadoKey" = 3;

SELECT * from dw_schema_lojas."DimEmpregado" de  order by de."EmpregadoKey";
-- Atualizar o nome de uma loja específica
SELECT * from dw_schema_lojas."DimLoja" dl  where dl."LojaKey"  = 2;

update  dw_schema_lojas."DimLoja" dl 
set "Nome" = 'Loja Viana'
where dl."LojaKey"  = 2;

SELECT * from dw_schema_lojas."DimLoja" dl  order by dl."LojaKey";

-- Delete registos de reparação associadas a um determinado produto, empregado e loja
select * from dw_schema_lojas."FactReparacao" where "ReparacaoKey" = 9;
delete from  dw_schema_lojas."FactReparacao" where "ReparacaoKey" = 9;


-- Delete registos de uma loja específica
delete from  dw_schema_lojas."DimLoja" dl   where dl."LojaKey"  = 2;

-- Delete registos de um empregado específico
delete from  dw_schema_lojas."DimEmpregado" de  where de."EmpregadoKey"  = 3;

-- Agregados: total, média e diferença (reparação - orçamento) por estado
SELECT
  o."Estado",  COUNT(*) AS total_registos,  SUM(o."Valor") AS total_orcamento,  SUM(f."Valor") AS total_reparacao,
   ROUND(AVG(o."Valor")::numeric,2) AS media_orcamento,   ROUND(AVG(f."Valor")::numeric,2) AS media_reparacao,  
   ROUND(AVG(f."Valor" - o."Valor")::numeric  ,2) || '%'AS media_diferenca
FROM "FactReparacao" f
JOIN "DimOrcamento" o
  ON o."OrcamentoKey" = f."OrcamentoKey"
JOIN "DimData" d
  ON d."DataKey" = f."DataKey"
GROUP BY
  o."Estado"
ORDER BY
  o."Estado";


-- Total de reparações e valor total por produto
SELECT
  dp."Designacao",  SUM(dp."Valor"),  COUNT(*) AS total_reparacoes,  SUM(fr."Valor") AS valor_total_reparacoes
FROM "DimProduto" dp
JOIN "FactReparacao" fr
  ON dp."ProdutoKey" = fr."ProdutoKey"
GROUP BY  dp."Designacao",  dp."Valor"
ORDER BY
  total_reparacoes DESC ;

--Valor Gasto por cliente
select dc."Nome", sum(fr."Valor") as Valos_Gasto   from "DimCliente" dc 
inner join "FactReparacao" fr  on fr."Cliente_NIF"  = dc."NIF" 
group by dc."Nome", fr."Valor"
order by fr."Valor" desc;

--Produtos mais vendidos no mes de janeiros

select dp."Designacao" , count(fr."ProdutoKey" ) as total_vendas
from "FactReparacao" fr 
inner join "DimData" dd on dd."DataKey"  = fr."DataKey"
inner join "DimProduto" dp on dp."ProdutoKey" = fr."ProdutoKey" 
where dd."Mes"  = 1
group  by dp."Designacao"
order by count(fr."ProdutoKey" ) desc;

-- Total de valor e nº de reparações por ano e mês
SELECT
  d."Ano",  d."Mes",  SUM(f."Valor") AS total_valor,  COUNT(*) AS total_reparacoes
FROM "FactReparacao" f
JOIN "DimData" d
  ON d."DataKey" = f."DataKey"
GROUP BY
  d."Ano",  d."Mes"
ORDER BY
  d."Ano",  d."Mes";

  
-- Nº de reparações e valor total por empregado, agregados por ano e mês
SELECT
  e."Nome" AS empregado,  d."Ano",  d."Mes",  COUNT(*) AS total_reparacoes,  SUM(f."Valor") AS total_valor, AVG(f."Valor") AS valor_medio_por_reparacao
FROM "FactReparacao" f
JOIN "DimEmpregado" e
  ON e."EmpregadoKey" = f."EmpregadoKey"
JOIN "DimData" d
  ON d."DataKey" = f."DataKey"
GROUP BY
  e."Nome",  d."Ano",  d."Mes"
ORDER BY
  e."Nome",  d."Ano",  d."Mes";

 



