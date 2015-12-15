unit Data.Repositories.IRepository;

interface

uses
  Generics.Collections,
  AOP.Aspects.Attributes;

type
  IRepository<TEntity: class; TKey> = interface (IInvokable)
  ['{5A5BC4A3-BE45-453F-9B90-13FFD7CFCBDB}']
    function GetAll(): TList<TEntity>;
    function Get(Id: TKey): TEntity;
    [Log]
    procedure Add(Entity: TEntity);
    [Log]
    procedure Remove(Entity: TEntity);
    [Log]
    procedure Update(Entity: TEntity);
  end;

implementation

end.
