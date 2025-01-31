use ecommerce_refinado;

-- 1) Inserindo registros na tabela Pessoa
alter table pessoa auto_increment=1;
INSERT INTO pessoa (Tipo_Pessoa, Endereco, email, Data_cadastro)
VALUES
('PF', 'Rua A, 123', 'joao@gmail.com', '2025-01-01'),
('PF', 'Rua B, 456', 'maria@gmail.com', '2025-01-02'),
('PJ', 'Av. C, 789', 'empresa1@corp.com', '2025-01-03'),
('PJ', 'Av. D, 321', 'empresa2@corp.com', '2025-01-04'),
('PF', 'Rua E, 654', 'carlos@gmail.com', '2025-01-05'),
('PJ', 'Av. F, 987', 'empresa3@corp.com', '2025-01-06'),
('PF', 'Rua G, 147', 'ana@gmail.com', '2025-01-07'),
('PJ', 'Av. H, 258', 'empresa4@corp.com', '2025-01-08'),
('PF', 'Rua I, 369', 'paulo@gmail.com', '2025-01-09'),
('PF', 'Rua J, 753', 'lara@gmail.com', '2025-01-10'),
('PJ', 'Av. K, 159', 'empresa5@corp.com', '2025-01-11'),
('PF', 'Rua L, 951', 'davi@gmail.com', '2025-01-12'),
('PJ', 'Av. M, 753', 'empresa6@corp.com', '2025-01-13'),
('PF', 'Rua N, 159', 'sara@gmail.com', '2025-01-14'),
('PJ', 'Av. O, 951', 'empresa7@corp.com', '2025-01-15');

-- select * from pessoa where tipo_pessoa = 'PJ';

-- 2) Inserindo registros na tabela Cliente
alter table cliente auto_increment=1;
INSERT INTO cliente (Cliente, Identificacao, Contato, Cupom_desconto)
VALUES
(1, 'João da Silva', '61999990000', 'CUPOM10'),
(2, 'Maria Souza', '61988880000', 'CUPOM15'),
(3, 'Empresa ABC', '61333330000', NULL),
(4, 'Empresa XYZ', '61344440000', 'DESCONTO20'),
(5, 'Carlos Lima', '61977770000', NULL),
(6, 'Empresa DEF', '61355550000', 'CUPOM5'),
(7, 'Ana Santos', '61966660000', 'PROMO2025'),
(8, 'Empresa GHI', '61366660000', NULL),
(9, 'Paulo Henrique', '61955550000', 'CASHBACK10'),
(10, 'Lara Ribeiro', '61944440000', NULL),
(11, 'Empresa JKL', '61377770000', 'OFERTA25'),
(12, 'Davi Martins', '61933330000', NULL),
(13, 'Empresa MNO', '61388880000', 'DESCONTO15'),
(14, 'Sara Mendes', '61922220000', 'BONUS2025'),
(15, 'Empresa PQR', '61399990000', NULL);

-- 3) Inserindo registros na tabela PessoaFisica
INSERT INTO PessoaFisica (idPessoaFisica, Primeiro_nome, Nome_meio, Sobrenome, CPF, Data_nascimento)
VALUES
(1, 'João', 'M', 'Silva', '12345678400', '1990-01-01'),
(2, 'Maria', 'S', 'Souza', '23456789009', '1985-02-14'),
(5, 'Carlos', 'L', 'Lima', '34568790121', '1978-03-20'),
(7, 'Ana', 'P', 'Santos', '45698901600', '1992-04-10'),
(9, 'Paulo', 'H', 'Henrique', '56796012354', '1989-05-25'),
(10, 'Lara', 'A', 'Ribeiro', '67980123465', '1995-06-15'),
(12, 'Davi', 'C', 'Martins', '79801234576', '1998-07-30'),
(14, 'Sara', 'M', 'Mendes', '98012345687', '2000-08-12');

-- 4) Inserindo registros na tabela PessoaJuridica
INSERT INTO PessoaJuridica (idPessoaJuridica, Razao_social, Nome_fantasia, CNPJ, Data_cadastro)
VALUES
(3, 'Empresa ABC Ltda.', 'ABC', '12354678000109', '2025-01-03'),
(4, 'Empresa XYZ Ltda.', 'XYZ', '23456789000109', '2025-01-04'),
(6, 'Empresa DEF Ltda.', 'DEF', '34567890000187', '2025-01-06'),
(8, 'Empresa GHI Ltda.', 'GHI', '45678900000165', '2025-01-08'),
(11, 'Empresa JKL Ltda.', 'JKL', '56789000000143', '2025-01-11'),
(13, 'Empresa MNO Ltda.', 'MNO', '67890000000121', '2025-01-13'),
(15, 'Empresa PQR Ltda.', 'PQR', '78900000000109', '2025-01-15');

-- 5) Inserindo registros na tabela Fornecedor
alter table fornecedor auto_increment=1;
INSERT INTO fornecedor (Pessoa_idPessoaJuridica, Ativo, Qualificacao_fornecedor)
VALUES
(3, true, 'bom'),
(4, true, 'regular'),
(6, false, 'ruim'),
(8, true, 'otimo'),
(11, true, 'bom'),
(13, false, 'regular'),
(15, true, 'otimo');

-- 6) Inserindo registros na tabela Estoque
alter table estoque auto_increment=1;
INSERT INTO estoque (Local_estoque)
VALUES
('Armazém Central'),
('Depósito Sul'),
('Galpão Norte'),
('Centro de Distribuição Oeste'),
('Unidade Leste'),
('Estoque Reserva Central'),
('Pavilhão Industrial 1'),
('Pavilhão Industrial 2'),
('Pavilhão Industrial 3'),
('Centro de Distribuição Regional'),
('Armazém Principal'),
('Depósito Zona Rural'),
('Estoque Comercial'),
('Galpão Urbano 1'),
('Galpão Urbano 2');

-- 7) Inserindo registros na tabela Vendedor
alter table vendedor auto_increment=1;
INSERT INTO Vendedor (VendedorPessoa, Contato, Localizacao) VALUES
(1, '11999998888', 'São Paulo, SP'),
(2, '21988887777', 'Rio de Janeiro, RJ'),
(3, '31977776666', 'Belo Horizonte, MG'),
(4, '41966665555', 'Curitiba, PR'),
(5, '51955554444', 'Porto Alegre, RS'),
(6, '61944443333', 'Brasília, DF'),
(7, '71933332222', 'Salvador, BA'),
(8, '81922221111', 'Recife, PE'),
(9, '92911110000', 'Manaus, AM'),
(10, '12900009999', 'São José dos Campos, SP'),
(11, '13999998877', 'Santos, SP'),
(12, '14988887766', 'Ribeirão Preto, SP'),
(13, '15977776655', 'Campinas, SP'),
(14, '16966665544', 'Uberlândia, MG'),
(15, '17955554433', 'Goiânia, GO');

-- 8) Inserindo registros na tabela Produto
alter table produto auto_increment=1;
INSERT INTO Produto (Produto_nome, Classsificacao_kids, Categoria, Descricao, Avaliacao, Size) VALUES
('Smartphone XYZ', false, 'Eletrônicos', 'Smartphone com câmera de alta qualidade e 128GB', 4.5, null),
('Camiseta Infantil', true, 'Vestimenta', 'Camiseta de algodão para crianças', 4.2, 'M'),
('Boneca de Pano', true, 'Brinquedos', 'Boneca de pano artesanal, lavável', 4.8, null),
('Chocolate Gourmet', false, 'Alimentos', 'Caixa com chocolates finos variados', 4.6, null),
('Mesa de Jantar', false, 'Móveis', 'Mesa de jantar em madeira maciça', 4.7, 'Grande'),
('Fone de Ouvido Bluetooth', false, 'Eletrônicos', 'Fone sem fio com cancelamento de ruído', 4.4, null),
('Jaqueta de Couro', false, 'Vestimenta', 'Jaqueta premium em couro legítimo', 4.9, 'G'),
('Carrinho de Controle Remoto', true, 'Brinquedos', 'Carrinho com controle remoto recarregável', 4.5, null),
('Biscoito Integral', false, 'Alimentos', 'Biscoito integral sabor aveia e mel', 4.3, null),
('Cadeira de Escritório', false, 'Móveis', 'Cadeira ergonômica com ajuste de altura', 4.8, 'Médio'),
('Notebook ABC', false, 'Eletrônicos', 'Notebook com processador i7 e 16GB RAM', 4.6, null),
('Vestido Infantil', true, 'Vestimenta', 'Vestido floral para festas', 4.7, 'P'),
('Quebra-Cabeça 1000 Peças', true, 'Brinquedos', 'Quebra-cabeça temático para adultos e crianças', 4.9, null),
('Cereal Matinal', false, 'Alimentos', 'Cereal matinal com mix de frutas', 4.4, null),
('Estante Modular', false, 'Móveis', 'Estante de montagem fácil para livros', 4.5, 'Pequeno');

-- 9) Inserindo registros na tabela Rastreio
alter table Rastreio auto_increment=1;
INSERT INTO Rastreio (Status_Pedido) VALUES
('Em processamento'),
('Processando'),
('Enviado'),
('Entregue');

-- 10) Inserindo registros na tabela FormaPagamento
alter table FormaPagamento auto_increment=1;
INSERT INTO FormaPagamento (Tipo) VALUES
('Cartão de Crédito'),
('Boleto'),
('PIX');


-- 11) Inserindo registros na tabela Pedido
alter table pedido auto_increment=1;
INSERT INTO pedido (PedidoCliente, PedidoStatus, Pedido_FormaPagamento, Descricao, Frete, Valor) VALUES
(1, 1, 1, 'Pedido de itens eletrônicos', 15.00, 200.50),
(2, 2, 2, 'Pedido de vestimentas', 10.00, 350.00),
(3, 3, 3, 'Pedido de brinquedos e móveis', 20.00, 550.75),
(4, 4, 1, 'Pedido de alimentos diversos', 12.00, 120.00),
(5, 1, 2, 'Pedido de eletrônicos e móveis', 25.00, 750.25),
(6, 2, 3, 'Pedido de roupas infantis', 10.00, 300.00),
(7, 3, 1, 'Pedido de brinquedos infantis', 20.00, 250.00),
(8, 4, 2, 'Pedido de móveis para escritório', 15.00, 800.00),
(9, 1, 3, 'Pedido de alimentos e roupas', 12.00, 400.00),
(10, 2, 1, 'Pedido de eletrônicos avançados', 18.00, 1200.50),
(11, 3, 2, 'Pedido de vestimentas casuais', 10.00, 340.00),
(12, 4, 3, 'Pedido de móveis e alimentos', 25.00, 450.00),
(13, 1, 1, 'Pedido de brinquedos eletrônicos', 20.00, 600.00),
(14, 2, 2, 'Pedido de roupas e acessórios', 15.00, 500.00),
(15, 3, 3, 'Pedido de diversos itens', 30.00, 950.00);

-- 12) Inserindo registros na tabela FormaPagamento
alter table PagamentoVista auto_increment=1;
INSERT INTO PagamentoVista (Num_pedido, Tipo_pagamento, DataPagamento) VALUES
(1,'PIX', '2025-01-24'),
(2,'Boleto', '2025-01-24'),
(3,'PIX', '2025-01-24'),
(4,'PIX', '2025-01-24'),
(5,'Boleto', '2025-01-24'),
(6,'PIX', '2025-01-20'),
(7,'PIX', '2025-01-24'),
(8,'Boleto', '2025-01-01'),
(9,'PIX', '2025-01-24'),
(10,'PIX', '2025-01-24'),
(11,'Boleto', '2025-01-15');

-- 13) Inserindo registros na tabela PagamentoCartao
alter table PagamentoCartao auto_increment=1;
INSERT INTO PagamentoCartao (Num_pedido, Num_do_cartao, Titular_do_cartao, Validade_do_cartao, DataPagamento) VALUES
(1, '1234567890123456', 'João Silva', '2026-12-30', '2025-01-20'),
(2, '2345678901234567', 'Maria Oliveira', '2027-11-15', '2025-01-21'),
(3, '3456789012345678', 'Carlos Souza', '2025-06-25', '2025-01-22'),
(4, '4567890123456789', 'Ana Santos', '2026-03-10', '2025-01-23'),
(5, '5678901234567890', 'Fernanda Costa', '2027-07-19', '2025-01-24'),
(6, '6789012345678901', 'Roberto Pereira', '2025-09-15', '2025-01-25'),
(7, '7890123456789012', 'Patrícia Lima', '2026-05-22', '2025-01-26'),
(8, '8901234567890123', 'Lucas Almeida', '2027-10-12', '2025-01-27'),
(9, '9012345678901234', 'Juliana Rocha', '2025-04-05', '2025-01-28'),
(10, '0123456789012345', 'Paulo Mendes', '2026-08-18', '2025-01-29');


-- tabelas n:m

-- 14) Inserindo registros na tabela vendedorProduto
INSERT INTO vendedorProduto (idVP_Vendedor, idVP_Produto, ProdQuantidade) VALUES
(1, 1, 5),
(1, 2, 3),
(2, 3, 7),
(2, 4, 2),
(3, 5, 10),
(3, 6, 4),
(4, 7, 6),
(4, 8, 1),
(5, 9, 8),
(5, 10, 12);

-- 15) Inserindo registros na tabela fornecedorProduto
INSERT INTO fornecedorProduto (idFP_Fornecedor, idFP_Produto) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

-- 16) Inserindo registros na tabela estoqueProduto
INSERT INTO estoqueProduto (idEP_Estoque, idEP_Produto, Quantidade) VALUES
(1, 1, 100),
(1, 2, 150),
(1, 3, 200),
(2, 1, 50),
(2, 4, 75),
(2, 5, 120),
(3, 6, 80),
(3, 2, 90),
(3, 7, 60),
(4, 8, 40);

-- 17) Inserindo registros na tabela produtoPedido
INSERT INTO produtoPedido (idPP_Produto, idPP_Pedido, Quantidade_do_pedido, PP_Status) VALUES
(1, 1, 2, 'disponível'),
(2, 1, 1, 'disponível'),
(3, 2, 1, 'sem estoque'),
(4, 2, 3, 'disponível'),
(5, 3, 1, 'disponível'),
(6, 3, 2, 'sem estoque'),
(7, 4, 5, 'disponível'),
(8, 5, 1, 'disponível'),
(9, 6, 1, 'disponível'),
(10, 7, 4, 'disponível');
