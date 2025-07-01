-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Cliente] (
    [ClienteID] int  NOT NULL ,
    [Nome] varchar  NOT NULL ,
    [Telefone] varchar  NOT NULL ,
    [Email] varchar  NOT NULL ,
    [CPFCNPJ] varchar  NOT NULL ,
    [Endereco] text  NOT NULL ,
    CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED (
        [ClienteID] ASC
    )
)

CREATE TABLE [Projeto] (
    [ProjetoID] int  NOT NULL ,
    [ClienteID] int  NOT NULL ,
    [Descricao] text  NOT NULL ,
    [DataCriacao] date  NOT NULL ,
    [Status] varchar  NOT NULL ,
    [ValorTotal] decimal  NOT NULL ,
    CONSTRAINT [PK_Projeto] PRIMARY KEY CLUSTERED (
        [ProjetoID] ASC
    )
)

CREATE TABLE [Produto] (
    [ProdutoID] int  NOT NULL ,
    [Nome] varchar  NOT NULL ,
    [TipoMaterial] varchar  NOT NULL ,
    [LarguraCM] decimal  NOT NULL ,
    [AlturaCM] decimal  NOT NULL ,
    [PrecoUnitario] decimal  NOT NULL ,
    CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED (
        [ProdutoID] ASC
    )
)

CREATE TABLE [ProjetoProduto] (
    [ProjetoProdutoID] int  NOT NULL ,
    [ProjetoID] int  NOT NULL ,
    [ProdutoID] int  NOT NULL ,
    [Quantidade] int  NOT NULL ,
    CONSTRAINT [PK_ProjetoProduto] PRIMARY KEY CLUSTERED (
        [ProjetoProdutoID] ASC
    )
)

CREATE TABLE [Setor] (
    [SetorID] int  NOT NULL ,
    [NomeSetor] varchar  NOT NULL ,
    CONSTRAINT [PK_Setor] PRIMARY KEY CLUSTERED (
        [SetorID] ASC
    )
)

CREATE TABLE [Funcionario] (
    [FuncionarioID] int  NOT NULL ,
    [Nome] varchar  NOT NULL ,
    [Cargo] varchar  NOT NULL ,
    [SetorID] int  NOT NULL ,
    CONSTRAINT [PK_Funcionario] PRIMARY KEY CLUSTERED (
        [FuncionarioID] ASC
    )
)

CREATE TABLE [OrdemServico] (
    [OrdemServicoID] int  NOT NULL ,
    [ProjetoID] int  NOT NULL ,
    [DataInicio] date  NOT NULL ,
    [DataEntrega] date  NOT NULL ,
    [Status] varchar  NOT NULL ,
    CONSTRAINT [PK_OrdemServico] PRIMARY KEY CLUSTERED (
        [OrdemServicoID] ASC
    )
)

CREATE TABLE [FuncionarioOS] (
    [FuncionarioOSID] int  NOT NULL ,
    [FuncionarioID] int  NOT NULL ,
    [OrdemServicoID] int  NOT NULL ,
    CONSTRAINT [PK_FuncionarioOS] PRIMARY KEY CLUSTERED (
        [FuncionarioOSID] ASC
    )
)

CREATE TABLE [Pagamento] (
    [PagamentoID] int  NOT NULL ,
    [ProjetoID] int  NOT NULL ,
    [DataPagamento] date  NOT NULL ,
    [ValorPago] decimal  NOT NULL ,
    [FormaPagamento] varchar  NOT NULL ,
    CONSTRAINT [PK_Pagamento] PRIMARY KEY CLUSTERED (
        [PagamentoID] ASC
    )
)

ALTER TABLE [Projeto] WITH CHECK ADD CONSTRAINT [FK_Projeto_ClienteID] FOREIGN KEY([ClienteID])
REFERENCES [Cliente] ([ClienteID])

ALTER TABLE [Projeto] CHECK CONSTRAINT [FK_Projeto_ClienteID]

ALTER TABLE [ProjetoProduto] WITH CHECK ADD CONSTRAINT [FK_ProjetoProduto_ProjetoID] FOREIGN KEY([ProjetoID])
REFERENCES [Projeto] ([ProjetoID])

ALTER TABLE [ProjetoProduto] CHECK CONSTRAINT [FK_ProjetoProduto_ProjetoID]

ALTER TABLE [ProjetoProduto] WITH CHECK ADD CONSTRAINT [FK_ProjetoProduto_ProdutoID] FOREIGN KEY([ProdutoID])
REFERENCES [Produto] ([ProdutoID])

ALTER TABLE [ProjetoProduto] CHECK CONSTRAINT [FK_ProjetoProduto_ProdutoID]

ALTER TABLE [Funcionario] WITH CHECK ADD CONSTRAINT [FK_Funcionario_SetorID] FOREIGN KEY([SetorID])
REFERENCES [Setor] ([SetorID])

ALTER TABLE [Funcionario] CHECK CONSTRAINT [FK_Funcionario_SetorID]

ALTER TABLE [OrdemServico] WITH CHECK ADD CONSTRAINT [FK_OrdemServico_ProjetoID] FOREIGN KEY([ProjetoID])
REFERENCES [Projeto] ([ProjetoID])

ALTER TABLE [OrdemServico] CHECK CONSTRAINT [FK_OrdemServico_ProjetoID]

ALTER TABLE [FuncionarioOS] WITH CHECK ADD CONSTRAINT [FK_FuncionarioOS_FuncionarioID] FOREIGN KEY([FuncionarioID])
REFERENCES [Funcionario] ([FuncionarioID])

ALTER TABLE [FuncionarioOS] CHECK CONSTRAINT [FK_FuncionarioOS_FuncionarioID]

ALTER TABLE [FuncionarioOS] WITH CHECK ADD CONSTRAINT [FK_FuncionarioOS_OrdemServicoID] FOREIGN KEY([OrdemServicoID])
REFERENCES [OrdemServico] ([OrdemServicoID])

ALTER TABLE [FuncionarioOS] CHECK CONSTRAINT [FK_FuncionarioOS_OrdemServicoID]

ALTER TABLE [Pagamento] WITH CHECK ADD CONSTRAINT [FK_Pagamento_ProjetoID] FOREIGN KEY([ProjetoID])
REFERENCES [Projeto] ([ProjetoID])

ALTER TABLE [Pagamento] CHECK CONSTRAINT [FK_Pagamento_ProjetoID]

COMMIT TRANSACTION QUICKDBD