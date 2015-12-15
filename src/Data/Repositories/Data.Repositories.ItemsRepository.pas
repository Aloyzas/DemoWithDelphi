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
  //DSharp.Aspects.Weaver,
  //Spring.Services,
  //Aurelius.Drivers.Interfaces;

initialization

  GlobalContainer.RegisterType<TItemsRepository>.Implements<IItemsRepository>;

//  GlobalContainer.RegisterType<IItemsRepository>.DelegateTo
//  (
//    function: IItemsRepository
//    begin
////      Result := TItemsRepository.Create();
//      Result :=  AspectWeaver.Proxify<IItemsRepository>(Instance);
//    end
//  );

end.
