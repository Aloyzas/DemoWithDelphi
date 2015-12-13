unit Data.Persistance.IDBConnectionFactory;

interface

uses
  Aurelius.Drivers.Interfaces
  ;

type
  IDBConnectionFactory = interface
    ['{856B9824-AEE4-4684-A184-0F90A2FFB8F3}']
    function GetConnection(): IDBConnection;
  end;

implementation

end.
