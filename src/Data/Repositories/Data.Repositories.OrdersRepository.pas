unit Data.Repositories.OrdersRepository;

interface

uses
  Generics.Collections,
  Data.Repositories.Repository,
  Data.Repositories.IOrdersRepository,
  Data.Entities.Order,
  Data.Entities.OrderDetails;

type
  TOrdersRepository = class sealed (TRepository<TOrder, Integer>, IOrdersRepository)
  public
    function GetAllOrderDetails(Id: Integer): TList<TOrderDetails>;
    function GetOrderDetails(Id: Integer): TOrderDetails;
    procedure AddOrderDetails(Entity: TOrderDetails);
    procedure RemoveOrderDetails(Entity: TOrderDetails);
    procedure UpdateOrderDetails(Entity: TOrderDetails);
  end;

implementation

uses
  Spring.Container,
  Aurelius.Criteria.Expression;

{ TOrdersRepository }

procedure TOrdersRepository.AddOrderDetails(Entity: TOrderDetails);
begin
  FObjectManager.Save(Entity);
  FObjectManager.Flush;
end;

function TOrdersRepository.GetAllOrderDetails(Id: Integer): TList<TOrderDetails>;
begin
  Result := FObjectManager.Find<TOrderDetails>.Add(TExpression.Eq('OrderId', Id)).List;
end;

function TOrdersRepository.GetOrderDetails(Id: Integer): TOrderDetails;
begin
  Result := FObjectManager.Find<TOrderDetails>(Id);
end;

procedure TOrdersRepository.RemoveOrderDetails(Entity: TOrderDetails);
begin
  FObjectManager.Remove(Entity);
  FObjectManager.Flush;
end;

procedure TOrdersRepository.UpdateOrderDetails(Entity: TOrderDetails);
begin
  FObjectManager.Update(Entity);
  FObjectManager.Flush;
end;

initialization

  GlobalContainer.RegisterType<TOrdersRepository>.Implements<IOrdersRepository>;

end.
