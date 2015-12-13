unit Data.Repositories.CustomersRepository;

interface

uses
    Data.Repositories.Repository
  , Data.Repositories.ICustomersRepository
  , Data.Entities.Customer
  ;

type
  TCustomersRepository = class sealed (TRepository<TCustomer, Integer>, ICustomersRepository)
  end;

implementation

uses
  Spring.Container;

initialization

  GlobalContainer.RegisterType<TCustomersRepository>.Implements<ICustomersRepository>;

end.
