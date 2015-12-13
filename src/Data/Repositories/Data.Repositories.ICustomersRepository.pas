unit Data.Repositories.ICustomersRepository;

interface

uses
    Data.Repositories.IRepository
  , Data.Entities.Customer
  ;

type
  ICustomersRepository = interface (IRepository<TCustomer, Integer>)
  ['{400A71CF-6D60-4323-8F25-BB45E72BDE87}']
  end;

implementation

end.
