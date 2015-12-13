unit Data.Repositories.IRepository;

interface

uses
  Generics.Collections;

type
  IRepository<TEntity: class; TKey> = interface
  ['{5A5BC4A3-BE45-453F-9B90-13FFD7CFCBDB}']
    function GetAll(): TList<TEntity>;
    function Get(Id: TKey): TEntity;
    procedure Add(Entity: TEntity);
    procedure Remove(Entity: TEntity);
    procedure Update(Entity: TEntity);
  end;

implementation

end.
