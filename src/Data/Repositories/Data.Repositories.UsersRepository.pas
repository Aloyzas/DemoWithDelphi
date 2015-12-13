unit Data.Repositories.UsersRepository;

interface

uses
  Data.Repositories.Repository,
  Data.Repositories.IUsersRepository,
  Data.Entities.User;

type
  TUsersRepository = class sealed (TRepository<TUser, Integer>, IUsersRepository)
  public
    function GetByLogin(loginName: string): TUser;
  end;

implementation

uses
  Spring.Container,
  Aurelius.Criteria.Expression;

{ TUsersRepository }

function TUsersRepository.GetByLogin(loginName: string): TUser;
begin
  Result := FObjectManager.Find<TUser>.Add(TExpression.Eq('LoginName', loginName)).UniqueResult;
end;

initialization

  GlobalContainer.RegisterType<TUsersRepository>.Implements<IUsersRepository>;

end.
