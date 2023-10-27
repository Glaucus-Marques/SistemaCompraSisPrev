using MediatR;
using SistemaCompra.Domain.SolicitacaoCompraAggregate.Events;
using System;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;

namespace SistemaCompra.Application.SolicitacaoCompra.Command.RegistrarCompra
{
    public class RegistrarCompraEventHandler : INotificationHandler<CompraRegistradaEvent>
    {
        public Task Handle(CompraRegistradaEvent notification, CancellationToken cancellationToken)
        {
            //TODO: SignalIR

            return Task.Run(() =>
            {
                Debug.WriteLine($"{notification.DataOcorrencia.ToString("o")} RegistrarCompraEventHandler: Id: {notification.Id} - TotalGeral: {notification.TotalGeral}");
            });
        }
    }
}
