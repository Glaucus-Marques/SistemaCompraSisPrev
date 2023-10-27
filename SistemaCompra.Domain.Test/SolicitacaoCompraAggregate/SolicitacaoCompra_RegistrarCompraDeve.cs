using SistemaCompra.Domain.Core;
using SistemaCompra.Domain.ProdutoAggregate;
using SistemaCompra.Domain.SolicitacaoCompraAggregate;
using System.Collections.Generic;
using Xunit;

namespace SistemaCompra.Domain.Test.SolicitacaoCompraAggregate
{
    public class SolicitacaoCompra_RegistrarCompraDeve
    {
        [Fact]
        public void RecusarCondicaoDePagamentoInvalida()
        {
            //Dado
            var solicitacao = (SolicitacaoCompra)null;

            //Quando
            var ex = Assert.Throws<BusinessRuleException>(() => solicitacao = new SolicitacaoCompra("rodrigoasth", "rodrigoasth", 10));

            //Então
            Assert.StartsWith("Condição de pagamento deve ser ", ex.Message);
        }

        [Fact]
        public void RecusarNomeFornecedorComMenos10Charas()
        {
            //Dado
            var solicitacao = (SolicitacaoCompra)null;

            //Quando
            var ex = Assert.Throws<BusinessRuleException>(() => solicitacao = new SolicitacaoCompra("rodrigoasth", "rodrigoas", 30));

            //Então
            Assert.Equal("Nome de fornecedor deve ter pelo menos 10 caracteres.", ex.Message);
        }

        [Fact]
        public void RecusarNomeUsuarioComMenos8Charas()
        {
            //Dado
            var solicitacao = (SolicitacaoCompra)null;

            //Quando
            var ex = Assert.Throws<BusinessRuleException>(() => solicitacao = new SolicitacaoCompra("rodrigo", "rodrigoasth", 30));

            //Então
            Assert.Equal("Nome de usuário deve possuir pelo menos 8 caracteres.", ex.Message);
        }

        [Fact]
        public void DefinirPrazo30DiasAoComprarMais50mil()
        {
            //Dado
            var solicitacao = new SolicitacaoCompra("rodrigoasth", "rodrigoasth", 30);
            var itens = new List<Item>();
            var produto = new Produto("Cedro", "Transversal 3/3", Categoria.Madeira.ToString(), 1001);
            itens.Add(new Item(produto, 50));

            //Quando
            solicitacao.RegistrarCompra(itens);

            //Então
            Assert.Equal(30, solicitacao.CondicaoPagamento.Valor);
        }

        [Fact]
        public void NotificarErroQuandoNaoInformarItensCompra()
        {
            //Dado
            var solicitacao = new SolicitacaoCompra("rodrigoasth", "rodrigoasth", 90);
            var itens = new List<Item>();

            //Quando 
            var ex = Assert.Throws<BusinessRuleException>(() => solicitacao.RegistrarCompra(itens));

            //Então
            Assert.Equal("A solicitação de compra deve possuir itens!", ex.Message);
        }
    }
}
