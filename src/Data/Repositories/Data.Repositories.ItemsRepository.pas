unit Data.Repositories.ItemsRepository;

interface

uses
    Data.Repositories.Repository
  , Data.Repositories.IItemsRepository
  , Data.Entities.Item
  ;

type
  TItemsRepository = class sealed (TRepository<TItem, Integer>, IItemsRepository)
  end;

implementation

uses
  Spring.Container;

initialization

  GlobalContainer.RegisterType<TItemsRepository>.Implements<IItemsRepository>;

end.
