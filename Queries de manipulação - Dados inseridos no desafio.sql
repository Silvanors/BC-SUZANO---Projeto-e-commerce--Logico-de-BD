use ecommerce_refinado;

#Algumas das perguntas que podes fazer para embasar as queries SQL:
#Quantos pedidos foram feitos por cada cliente?
#Algum vendedor também é fornecedor?
#Relação de produtos fornecedores e estoques;
#Relação de nomes dos fornecedores e nomes dos produtos;

--
#Quantos pedidos foram feitos por cada cliente?

select c.idCliente, concat(pf.Primeiro_nome, ' ', pf.Nome_meio, ' ', pf.Sobrenome) as Nome_Cliente, COUNT(p.idPedido) as totalPedidos
from 
    cliente c
	join pessoafisica pf on c.Cliente = pf.idPessoaFisica
	join pedido p on c.idCliente = p.PedidoCliente
group by 
    c.idCliente,
    Nome_cliente
order by Nome_cliente;

#Algum vendedor também é fornecedor?
-- Total de vendedores
select count(*) from vendedor;

-- Lista dos vendedores
select * from vendedor
order by localizacao;

-- Lista dos vendedores de São Paulo
select * from vendedor where localizacao = 'São Paulo, SP';

-- Total de fornecedores
select count(*) from fornecedor;

-- Lista de vendedores que também são fornecedores 
select v.vendedorPessoa, pj.Nome_fantasia, pj.CNPJ, f.Pessoa_idPessoaJuridica from vendedor v
	inner join fornecedor f on v.vendedorPessoa = f.Pessoa_idPessoaJuridica
	inner join pessoaJuridica pj  on v.vendedorPessoa = pj.idPessoaJuridica
order by pj.nome_fantasia;

-- Lista de vendedores que também são fornecedores e tem qualificação 'ruim'
select v.vendedorPessoa, pj.Nome_fantasia, pj.CNPJ, f.Pessoa_idPessoaJuridica, f.Qualificacao_fornecedor from vendedor v
	inner join fornecedor f on v.vendedorPessoa = f.Pessoa_idPessoaJuridica
	inner join pessoaJuridica pj  on v.vendedorPessoa = pj.idPessoaJuridica
    having f.Qualificacao_fornecedor = 'ruim'
order by pj.nome_fantasia;

-- Total de vendedores que também são fornecedores 
select count(*) from vendedor v
	inner join fornecedor f on v.vendedorPessoa = f.Pessoa_idPessoaJuridica 
	inner join pessoaJuridica pj  on v.vendedorPessoa = pj.idPessoaJuridica
order by pj.nome_fantasia;
	
#Relação de produtos fornecedores e estoques;
    select p.idProduto as codigo_do_produto,
			p.Produto_nome as Produto, 
                        f.Pessoa_idPessoaJuridica as codigo_pj, 
                        pj.nome_fantasia as Nome_fornecedor
	from estoqueProduto ep
		inner join produto p on ep.idEP_Produto = p.idProduto
        inner join estoque e on ep.idEP_Estoque = e.idEstoque
        inner join fornecedorProduto fp on fp.idFP_Produto = p.idProduto
        inner join fornecedor f on fp.idFP_Fornecedor = f.idFornecedor
        inner join pessoajuridica pj on f.Pessoa_idPessoaJuridica = pj.idPessoaJuridica;

#Relação de nomes dos fornecedores e nomes dos produtos;
select p.idProduto as codigo_do_produto,
			p.Produto_nome as Produto, 
                        f.Pessoa_idPessoaJuridica as codigo_pj, 
                        pj.nome_fantasia as Nome_fornecedor
	from estoqueProduto ep
		inner join produto p on ep.idEP_Produto = p.idProduto
        inner join fornecedorProduto fp on fp.idFP_Produto = p.idProduto
        inner join fornecedor f on fp.idFP_Fornecedor = f.idFornecedor
        inner join pessoajuridica pj on f.Pessoa_idPessoaJuridica = pj.idPessoaJuridica;
