unit Data.Repositories.Repository;

interface

uses
  Generics.Collections
  , Data.Repositories.IRepository
  , Aurelius.Drivers.Interfaces
  , Aurelius.Engine.ObjectManager
  ;

type
  TRepository<TEntity: class; TKey> = class abstract (TInterfacedObject, IRepository<TEntity, TKey>)
  protected
    FObjectManager: TObjectManager;
  public
    constructor Create(DBConnFac: IDBConnectionFactory);
    destructor Destroy(); reintroduce; virtual;
    function GetAll(): TList<TEntity>; virtual;
    function Get(Id: TKey): TEntity; virtual;
    procedure Add(Entity: TEntity); virtual;
    procedure Remove(Entity: TEntity); virtual;
    procedure Update(Entity: TEntity); virtual;
  end;

implementation

{ TRepository<TEntity, TKey> }

constructor TRepository<TEntity, TKey>.Create(DBConnFac: IDBConnectionFactory);
begin
  FObjectManager := TObjectManager.Create(DBConnFac.CreateConnection);
end;

destructor TRepository<TEntity, TKey>.Destroy;
begin
  FObjectManager.Free;

  inherited;
end;

procedure TRepository<TEntity, TKey>.Add(Entity: TEntity);
begin
  FObjectManager.Save(Entity);
  FObjectManager.Flush;
end;

function TRepository<TEntity, TKey>.Get(Id: TKey): TEntity;
begin
//  Result := FObjectManager.Find<TEntity>(Id);
end;

function TRepository<TEntity, TKey>.GetAll: TList<TEntity>;
begin
  Result := FObjectManager.FindAll<TEntity>;
end;

procedure TRepository<TEntity, TKey>.Remove(Entity: TEntity);
begin
  FObjectManager.Remove(Entity);
  FObjectManager.Flush;
end;

procedure TRepository<TEntity, TKey>.Update(Entity: TEntity);
begin
  FObjectManager.Update(Entity);
  FObjectManager.Flush;
end;

end.
