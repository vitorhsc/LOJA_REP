
--create database DW_Lojas;


-- =========================================================
-- SCHEMA: STAR for Repair Analytics
-- Includes ON DELETE CASCADE for FKs and DROP CASCADE for resetaa
-- =========================================================

-- Create schema if not exists
CREATE SCHEMA IF NOT EXISTS dw_schema_lojas;

------------------------------------------------------------
-- Drop existing tables with CASCADE (reset schema)
------------------------------------------------------------
DROP TABLE IF EXISTS dw_schema_lojas."FactReparacao" CASCADE;
DROP TABLE IF EXISTS dw_schema_lojas."DimCliente" CASCADE;
DROP TABLE IF EXISTS dw_schema_lojas."DimProduto" CASCADE;
DROP TABLE IF EXISTS dw_schema_lojas."DimLoja" CASCADE;
DROP TABLE IF EXISTS dw_schema_lojas."DimEmpregado" CASCADE;
DROP TABLE IF EXISTS dw_schema_lojas."DimOrcamento" CASCADE;
DROP TABLE IF EXISTS dw_schema_lojas."DimData" CASCADE;


------------------------------------------------------------
-- Dimensions
------------------------------------------------------------

CREATE TABLE dw_schema_lojas."DimCliente" (
    "NIF"        int  PRIMARY KEY,
    "Nome"       VARCHAR(255),
    "Morada"     VARCHAR(255),
    "Contacto"   int
);
CREATE UNIQUE INDEX "UX_DimCliente_NIF" ON dw_schema_lojas."DimCliente" ("NIF");

CREATE TABLE dw_schema_lojas."DimProduto" (
    "ProdutoKey"  SERIAL PRIMARY KEY,
    "Designacao"  VARCHAR(255),
    "Categoria"	  Varchar(100),
    "Sub-Categoria" Varchar(100),
    "Fornecedor"    varchar(255),
    "Qtd"         int,
    "Valor"       float
);
CREATE INDEX "IX_DimProduto_ProdutoKey" ON dw_schema_lojas."DimProduto" ("ProdutoKey");

CREATE TABLE dw_schema_lojas."DimLoja" (
    "LojaKey"   SERIAL PRIMARY KEY,
    "Nome"      VARCHAR(255),
    "Morada"     VARCHAR(255),
    "Contacto"  int
);
CREATE INDEX "IX_DimLoja_LojaKey" ON dw_schema_lojas."DimLoja" ("LojaKey");

CREATE TABLE dw_schema_lojas."DimEmpregado" (
    "EmpregadoKey" SERIAL PRIMARY KEY,
    "Nome"         VARCHAR(255),
    "Morada"       VARCHAR(255),
    "Contacto"     int 
);
CREATE INDEX "IX_DimEmpregado_EmpregadoKey" ON dw_schema_lojas."DimEmpregado" ("EmpregadoKey");

CREATE TABLE dw_schema_lojas."DimOrcamento" (
    "OrcamentoKey" SERIAL PRIMARY KEY,
    "Valor"        float,
    "Estado"       VARCHAR(50)
);
CREATE INDEX "IX_DimOrcamento_OrcamentoKey" ON dw_schema_lojas."DimOrcamento" ("OrcamentoKey");

CREATE TABLE dw_schema_lojas."DimData" (
    "DataKey" SERIAL PRIMARY KEY,
    "Ano"     int,
    "Mes"     int,
    "Dia"     int
);
CREATE UNIQUE INDEX "UX_DimData_DataKey" ON dw_schema_lojas."DimData" ("DataKey");

------------------------------------------------------------
-- Fact Table
------------------------------------------------------------

CREATE TABLE dw_schema_lojas."FactReparacao" (
    "ReparacaoKey" SERIAL PRIMARY KEY,

    -- Foreign keys
    "Cliente_NIF"  int NOT NULL,
    "ProdutoKey"   INT NOT NULL,
    "LojaKey"      INT NOT NULL,
    "EmpregadoKey" INT NOT NULL,
    "OrcamentoKey" INT NOT NULL,    
    "DataKey"         int NOT NULL,

    -- Fact attributes    
    "Valor"        float
);

-- Add foreign keys with ON DELETE CASCADE
ALTER TABLE dw_schema_lojas."FactReparacao"
  ADD CONSTRAINT "FK_FactReparacao_DimCliente"
    FOREIGN KEY ("Cliente_NIF") REFERENCES dw_schema_lojas."DimCliente"("NIF") ON DELETE CASCADE;

ALTER TABLE dw_schema_lojas."FactReparacao"
  ADD CONSTRAINT "FK_FactReparacao_DimProduto"
    FOREIGN KEY ("ProdutoKey") REFERENCES dw_schema_lojas."DimProduto"("ProdutoKey") ON DELETE CASCADE;

ALTER TABLE dw_schema_lojas."FactReparacao"
  ADD CONSTRAINT "FK_FactReparacao_DimLoja"
    FOREIGN KEY ("LojaKey") REFERENCES dw_schema_lojas."DimLoja"("LojaKey") ON DELETE CASCADE;

ALTER TABLE dw_schema_lojas."FactReparacao"
  ADD CONSTRAINT "FK_FactReparacao_DimEmpregado"
    FOREIGN KEY ("EmpregadoKey") REFERENCES dw_schema_lojas."DimEmpregado"("EmpregadoKey") ON DELETE CASCADE;

ALTER TABLE dw_schema_lojas."FactReparacao"
  ADD CONSTRAINT "FK_FactReparacao_DimOrcamento"
    FOREIGN KEY ("OrcamentoKey") REFERENCES dw_schema_lojas."DimOrcamento"("OrcamentoKey") ON DELETE CASCADE;

ALTER TABLE dw_schema_lojas."FactReparacao"
  ADD CONSTRAINT "FK_FactReparacao_DimData"
    FOREIGN KEY ("DataKey") REFERENCES dw_schema_lojas."DimData"("DataKey") ON DELETE CASCADE;

-- Indexes for performance
CREATE INDEX "IX_FactReparacao_Cliente_NIF"   ON dw_schema_lojas."FactReparacao" ("Cliente_NIF");
CREATE INDEX "IX_FactReparacao_ProdutoKey"   ON dw_schema_lojas."FactReparacao" ("ProdutoKey");
CREATE INDEX "IX_FactReparacao_LojaKey"      ON dw_schema_lojas."FactReparacao" ("LojaKey");
CREATE INDEX "IX_FactReparacao_EmpregadoKey" ON dw_schema_lojas."FactReparacao" ("EmpregadoKey");
CREATE INDEX "IX_FactReparacao_OrcamentoKey" ON dw_schema_lojas."FactReparacao" ("OrcamentoKey");
CREATE INDEX "IX_FactReparacao_DimData" 	 ON dw_schema_lojas."FactReparacao" ("DataKey");
