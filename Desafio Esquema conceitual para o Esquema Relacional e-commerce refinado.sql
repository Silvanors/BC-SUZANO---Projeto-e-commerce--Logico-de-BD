-- criação do banco de dados para o Desafio cenário de E-commerce refinado
create database ecommerce_refinado;
-- drop database ecommerce_refinado;
use ecommerce_refinado;

-- drop table pessoa;
-- Tabela 1)
create table pessoa(
	idPessoa int auto_increment primary key,
    Tipo_Pessoa enum('PF','PJ') not null,
    Endereco varchar(30) not null,
    email varchar(45),
    Data_cadastro date not null
);
-- desc pessoa;

-- Tabela 2)
create table cliente(
	idCliente int auto_increment primary key,
    Cliente int,
    Identificacao varchar(30),
    Contato char(11) not null,
    Cupom_desconto varchar(30),
    constraint fk_pessoa_cliente foreign key (Cliente) references Pessoa(idPessoa)
);
-- desc cliente;

-- Tabela 3)
create table PessoaFisica(
	idPessoaFisica int,
    Primeiro_nome varchar(30),
    Nome_meio varchar(3),
    Sobrenome varchar(30),
    CPF char(11) not null,
    Data_nascimento date not null,
    constraint fk_pessoa_PessoaFisica foreign key (idPessoaFisica) references Pessoa(idPessoa),
    constraint unique_cpf_PessoaFisica unique (CPF)
);
-- desc PessoaFisica;
-- select * from information_schema.referential_constraints where constraint_schema = 'ecommerce_refinado';

-- Tabela 4)
create table PessoaJuridica(
	idPessoaJuridica int,
    Razao_social varchar(45),
    Nome_fantasia varchar(45),
    CNPJ char(14) not null,
    Data_cadastro date not null,
    constraint fk_pessoa_PessoaJuridica foreign key (idPessoaJuridica) references Pessoa(idPessoa),
    constraint unique_cnpj_PessoaJuridica unique (CNPJ)
);
-- desc pessoajuridica;

-- Tabela 5)
create table Fornecedor(
	idFornecedor int auto_increment primary key,
    Pessoa_idPessoaJuridica int,
    Ativo boolean default true,
    Qualificacao_fornecedor enum('ruim', 'regular', 'bom', 'otimo') default 'bom',
    constraint fk_Fornecedor_pj foreign key (Pessoa_idPessoaJuridica) references PessoaJuridica(idPessoaJuridica)
);
-- desc fornecedor;

-- Tabela 6)
create table estoque(
	idEstoque int auto_increment primary key,
    Local_estoque varchar(250) not null
);
-- desc estoque;

-- Tabela 7)
create table vendedor(
	idVendedor int auto_increment primary key,
    VendedorPessoa int,
    Contato varchar(11) not null,
    Localizacao varchar(255),
    constraint fk_vendedorPessoa foreign key (VendedorPessoa) references Pessoa(idPessoa)
);
-- desc vendedor;

-- Tabela 8)
create table produto(
	idProduto int auto_increment primary key,
    Produto_nome varchar(45) not null,
    Classsificacao_kids bool default false,
	Categoria ENUM('Eletrônicos', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    Descricao varchar(255),
    Avaliacao float default 0,
    Size varchar(10)
);
-- desc produto;

-- Tabela 9)
create table Rastreio(
	idRastreio int auto_increment primary key,
	Status_Pedido enum ('Em processamento', 'Processando', 'Enviado', 'Entregue') not null default 'Em processamento'
);
-- desc rastreio;

-- Tabela 10)
create table FormaPagamento(
	idFormaPagamento int auto_increment primary key,
	Tipo enum ('Cartão de Crédito', 'Boleto','PIX') not null default 'Cartão de Crédito'
);
-- desc formapagamento;

-- Tabela 11)
create table pedido(
	idPedido int auto_increment primary key,
    PedidoCliente int,
    PedidoStatus int,
    Pedido_FormaPagamento int,
    Descricao varchar(250),
    Frete float default 10,
    Valor float not null,
    constraint fk_pedido_status foreign key (PedidoStatus) references Rastreio(idRastreio),
    constraint fk_pedido_formaPagamento foreign key (Pedido_FormaPagamento) references FormaPagamento(idFormaPagamento),
    constraint fk_pedido_cliente foreign key (PedidoCliente) references Cliente(idCliente)
		on update cascade
        -- on delete set null
);
-- desc pedido;

-- Tabela 12)
create table PagamentoVista(
	idPagamentoVista int auto_increment primary key,
    Num_pedido int,
	Tipo_pagamento enum ('Boleto', 'PIX') not null,
    constraint fk_pagamentoVista_Pedido foreign key (Num_pedido) references Pedido(idPedido),
    DataPagamento date not null
);
-- desc pagamentovista;

-- Tabela 13)
create table PagamentoCartao(
	idPagamentoCartao int auto_increment primary key,
    Num_pedido int,
    Num_do_cartao char(16) not null,
    Titular_do_cartao varchar(30) not null,
    Validade_do_cartao date not null,
    DataPagamento date not null,
    constraint fk_pagamentoCartao_Pedido foreign key (Num_pedido) references Pedido(idPedido),
    constraint unique_num_do_cartao unique (Num_do_cartao)
);
-- desc pagamentocartao;

-- Criação das tabelas de relação n:m

-- Tabela 14)
create table vendedorProduto(
	idVP_Vendedor int,
    idVP_Produto int,
    ProdQuantidade int default 1,
    primary key (idVP_Vendedor, idVP_Produto),
    constraint fk_vendedor_produto foreign key (idVP_Vendedor) references Vendedor(idVendedor),
    constraint fk_produto_produto foreign key (idVP_Produto) references Produto(idProduto)
);
-- desc vendedorProduto;

-- Tabela 15)
create table fornecedorProduto(
	idFP_Fornecedor int,
    idFP_Produto int,
    primary key ( idFP_Fornecedor, idFP_Produto),
    constraint fk_fornecedorProduto_fornecedor foreign key (idFP_Fornecedor) references Fornecedor(idFornecedor),
    constraint fk_fornecedorProduto_produto foreign key (idFP_Produto) references Produto(idProduto)
);
-- desc fornecedorProduto;

-- Tabela 16)
create table estoqueProduto(
	idEP_Estoque int,
    idEP_Produto int,
    Quantidade int not null,
    primary key ( idEP_Estoque, idEP_Produto),
    constraint fk_estoqueProduto_estoque foreign key (idEP_Estoque) references Estoque(idEstoque),
    constraint fk_estoqueProduto_produto foreign key (idEP_Produto) references Produto(idProduto)
);
-- desc estoqueProduto;

-- Tabela 17)
create table produtoPedido(
	idPP_Produto int,
    idPP_Pedido int,
    Quantidade_do_pedido int default 1,
    PP_Status ENUM('disponível', 'sem estoque') default 'disponível',
    primary key (idPP_Produto, idPP_Pedido),
    constraint fk_produtoPedido_produto foreign key (idPP_Produto) references Produto(idProduto),
    constraint fk_produtoPedido_pedido foreign key (idPP_Pedido) references Pedido(idPedido)
);
-- desc produtoPedido;


