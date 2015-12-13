unit Data.Persistance.SQLiteConnectionFactory;

interface

uses
  Aurelius.Drivers.Interfaces;

type
  TSQLiteConnectionFactory = class (TInterfacedObject, IDBConnectionFactory)
  public
    function CreateConnection(): IDBConnection;
  end;

implementation

uses
  Aurelius.Drivers.SQLite,
  Spring.Container;

{ TSQLiteConnectionFactory }

function TSQLiteConnectionFactory.CreateConnection: IDBConnection;
begin
  Result := TSQLiteNativeConnectionAdapter.Create('../../data/demowithdelphi.sqlite');
end;

initialization

  GlobalContainer.RegisterType<TSQLiteConnectionFactory>.Implements<IDBConnectionFactory>.AsSingleton;

end.
