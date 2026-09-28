INSERT INTO dw_schema_lojas."DimCliente" ("NIF", "Nome", "Morada", "Contacto") VALUES
(123456789, 'João Silva', 'Rua A, Lisboa', 912345678),
(223456789, 'Maria Santos', 'Rua B, Porto', 913456789),
(323456789, 'Carlos Costa', 'Rua C, Braga', 914567890),
(423456789, 'Ana Pereira', 'Rua D, Faro', 915678901),
(523456789, 'Ricardo Alves', 'Rua E, Coimbra', 916789012),
(623456789, 'Sofia Mendes', 'Rua F, Aveiro', 917890123),
(723456789, 'Paulo Ribeiro', 'Rua G, Setúbal', 918901234),
(823456789, 'Helena Matos', 'Rua H, Viseu', 919012345),
(923456789, 'Rui Fernandes', 'Rua I, Évora', 911234567),
(103456789, 'Beatriz Lopes', 'Rua J, Leiria', 912345679);


INSERT INTO dw_schema_lojas."DimProduto" 
("Designacao", "Categoria", "Sub-Categoria", "Fornecedor", "Qtd", "Valor") VALUES
('Ecrã Samsung S20', 'Eletrónica', 'Telemóveis', 'Samsung', 15, 120),
('Bateria iPhone 12', 'Eletrónica', 'Telemóveis', 'Apple', 25, 95),
('Carregador USB-C', 'Acessórios', 'Carregadores', 'Xiaomi', 80, 15),
('Portátil Lenovo X1', 'Informática', 'Portáteis', 'Lenovo', 5, 1250),
('Rato LogiTech M185', 'Informática', 'Periféricos', 'Logitech', 40, 12),
('Teclado Mecânico RedDragon', 'Informática', 'Periféricos', 'RedDragon', 25, 45),
('Coluna JBL Go 3', 'Áudio', 'Colunas', 'JBL', 60, 30),
('Auriculares Sony WF-1000XM4', 'Áudio', 'Auriculares', 'Sony', 20, 180),
('Monitor Dell 24"', 'Informática', 'Monitores', 'Dell', 10, 155),
('Disco SSD 1TB', 'Informática', 'Armazenamento', 'Kingston', 35, 75);


INSERT INTO dw_schema_lojas."DimLoja" ("Nome", "Morada", "Contacto") VALUES
('Loja Lisboa', 'Av. Liberdade, Lisboa', 210000001),
('Loja Porto', 'Rua Santa Catarina, Porto', 220000002),
('Loja Braga', 'Av. da Liberdade, Braga', 230000003),
('Loja Faro', 'Estrada Nacional, Faro', 240000004),
('Loja Coimbra', 'Rua Principal, Coimbra', 250000005),
('Loja Aveiro', 'Canal Central, Aveiro', 260000006),
('Loja Setúbal', 'Praça do Bocage, Setúbal', 270000007),
('Loja Viseu', 'Rossio, Viseu', 280000008),
('Loja Évora', 'Centro Histórico, Évora', 290000009),
('Loja Leiria', 'Rua Direita, Leiria', 210000010);


INSERT INTO dw_schema_lojas."DimEmpregado" ("Nome", "Morada", "Contacto") VALUES
('Tiago Ramos', 'Rua X, Lisboa', 930000001),
('Mariana Alves', 'Rua Y, Porto', 930000002),
('Gonçalo Freitas', 'Rua Z, Braga', 930000003),
('Joana Correia', 'Rua W, Faro', 930000004),
('Bruno Esteves', 'Rua T, Coimbra', 930000005),
('Carla Monteiro', 'Rua Q, Aveiro', 930000006),
('Nuno Matos', 'Rua P, Setúbal', 930000007),
('Patrícia Faria', 'Rua O, Viseu', 930000008),
('André Sousa', 'Rua V, Évora', 930000009),
('Inês Barros', 'Rua S, Leiria', 930000010);


INSERT INTO dw_schema_lojas."DimOrcamento" ("Valor", "Estado") VALUES
(100, 'Aprovado'),
(150, 'Aprovado'),
(80, 'Pendente'),
(1585, 'Aprovado'),
(12, 'Rejeitado'),
(300, 'Aprovado'),
(45, 'Pendente'),
(500, 'Aprovado'),
(70, 'Pendente'),
(90, 'Aprovado'),
(75, 'Aprovado'),
(120,'Aprovado');


INSERT INTO dw_schema_lojas."DimData" ("Ano", "Mes", "Dia") VALUES
(2025, 1, 10),
(2025, 1, 11),
(2025, 1, 12),
(2025, 1, 13),
(2025, 1, 14),
(2025, 1, 15),
(2025, 2, 1),
(2025, 2, 2),
(2025, 2, 3),
(2025, 2, 4),
(2025, 3, 2);


INSERT INTO dw_schema_lojas."FactReparacao"
("Cliente_NIF", "ProdutoKey", "LojaKey", "EmpregadoKey", "OrcamentoKey", "DataKey", "Valor")
VALUES
(123456789, 1, 1, 1, 1, 1, 120),
(223456789, 2, 2, 2, 2, 2, 150),
(323456789, 3, 3, 3, 3, 3, 15),
(423456789, 4, 4, 4, 4, 4, 1585),
(423456789, 8, 4, 4, 4, 4, 1585),
(423456789, 9, 4, 4, 4, 4, 1585),
(923456789, 4, 4, 4, 11, 9, 75),
(523456789, 5, 5, 5, 5, 11, 12),
(523456789, 1, 5, 5, 12, 5, 120);
