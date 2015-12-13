unit Data.Repositories.IItemsRepository;

interface

uses
    Data.Repositories.IRepository
  , Data.Entities.Item
  ;

type
  IItemsRepository = interface (IRepository<TItem, Integer>)
  ['{6955F1C0-C9D9-47E0-8ED3-BA323DB6D5DD}']
  end;

implementation

end.
