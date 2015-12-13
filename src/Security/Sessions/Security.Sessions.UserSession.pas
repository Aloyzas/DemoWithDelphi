unit Security.Sessions.UserSession;

interface

uses
  Security.Sessions.IUserSession
  , Security.Authentication.IPasswordValidator
  , Data.Repositories.IUsersRepository
  ;

type
  TUserSession = class(TInterfacedObject, IUserSession)
  private
    FUserId: Integer;
    FPasswordValidator: IPasswordValidator;
    FUsersRepository: IUsersRepository;
  public
    constructor Create(passwordValidator: IPasswordValidator; usersRep: IUsersRepository);
    function LogIn(userName, password: string): Boolean;
    procedure LogOut();
    function isLoggedIn(): Boolean;
    function getUserId(): Integer;
  end;

implementation

uses
  Data.Entities.User,
  Spring.Container;

{ TUserSession }

constructor TUserSession.Create(passwordValidator: IPasswordValidator; usersRep: IUsersRepository);
begin
  FUserId := 0;

  FPasswordValidator := passwordValidator;
  FUsersRepository := usersRep;
end;

function TUserSession.isLoggedIn: Boolean;
begin
  Result := getUserId() > 0;
end;

function TUserSession.LogIn(userName, password: string): Boolean;
var
  User: TUser;
begin
  User := nil;

  LogOut();

  if FPasswordValidator.Validate(userName, password) then
  begin
    User := FUsersRepository.GetByLogin(userName);

    if (User <> nil) then
    begin
      FUserId := User.Id;
      User.Free;
    end;

    Result := True;
  end else
  begin
    Result := False;
  end;
end;

procedure TUserSession.LogOut;
begin
  FUserId := 0;
end;

function TUserSession.getUserId: Integer;
begin
  Result := FUserId;
end;

initialization

  GlobalContainer.RegisterType<TUserSession>.Implements<IUserSession>.AsSingleton;

end.
