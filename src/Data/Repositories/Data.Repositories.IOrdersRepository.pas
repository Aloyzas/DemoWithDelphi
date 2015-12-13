unit Data.Repositories.IOrdersRepository;

interface

uses
    Generics.Collections
  , Data.Repositories.IRepository
  , Data.Entities.Order
  , Data.Entities.OrderDetails
  ;

type
  IOrdersRepository = interface (IRepository<TOrder, Integer>)
  ['{EB60FA36-064E-4D90-875C-199885185D70}']
    function GetAllOrderDetails(Id: Integer): TList<TOrderDetails>;
    function GetOrderDetails(Id: Integer): TOrderDetails;
    procedure AddOrderDetails(Entity: TOrderDetails);
    procedure RemoveOrderDetails(Entity: TOrderDetails);
    procedure UpdateOrderDetails(Entity: TOrderDetails);
  end;

implementation

end.
