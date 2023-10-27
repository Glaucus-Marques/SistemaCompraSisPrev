using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SistemaCompra.Domain.Core.Model;
using System;
using ProdutoAgg = SistemaCompra.Domain.ProdutoAggregate;

namespace SistemaCompra.Infra.Data.Produto
{
    public class ProdutoConfiguration : IEntityTypeConfiguration<ProdutoAgg.Produto>
    {
        public void Configure(EntityTypeBuilder<ProdutoAgg.Produto> builder)
        {
            builder.ToTable("Produto");

            builder.OwnsOne(c => c.Preco, b => b.Property("Value").HasColumnName("Preco").HasColumnType("decimal(18,2)"));

            //builder.HasData(
            //        new ProdutoAgg.Produto("Produto01", "Descricao01", "Madeira", 100) { Id = Guid.Parse("75bdf7b5-025d-45c9-abb8-850ff9b48bc5") }
            //    );
        }
    }
}
