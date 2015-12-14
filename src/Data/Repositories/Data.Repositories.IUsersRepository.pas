unit Data.Repositories.IUsersRepository;

interface

uses
    Data.Repositories.IRepository
  , Data.Entities.User
  ;

type
  {$M+}
  IUsersRepository = interface (IRepository<TUser, Integer>)
  ['{1ED377EC-1C2F-4F4F-95BE-87E037B7BF7C}']
    function GetByLogin(loginName: string): TUser;
  end;

implementation

end.
