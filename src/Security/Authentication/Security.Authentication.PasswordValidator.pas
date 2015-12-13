unit Security.Authentication.PasswordValidator;

interface

uses
  Security.Authentication.IPasswordValidator
  , Data.Repositories.IUsersRepository
  ;

type
  TPasswordValidator = class (TInterfacedObject, IPasswordValidator)
  private
    FUsersRepository : IUsersRepository;
  public
    constructor Create(usersRepository : IUsersRepository); reintroduce;
    function Validate(userName, password: string): Boolean;
  end;

implementation

uses
  Data.Entities.User,
  Spring.Cryptography,
  Spring.Container;

{ TPasswordValidator }

constructor TPasswordValidator.Create(usersRepository: IUsersRepository);
begin
  inherited Create();

  FUsersRepository := usersRepository;
end;

function TPasswordValidator.Validate(userName, password: string): Boolean;

  //TODO: delegate HASH calculation to a separate class
  function calculateMD5(data: string): string;
  var
    md5 : IMD5;
  begin
    md5 := CreateMD5;

    Result := md5.ComputeHash(data).ToHexString();;
  end;

var
  User : TUser;
begin
  User := nil;

  Result := False;

  User := FUsersRepository.GetByLogin(userName);
  if User <> nil then
  begin
    Result := User.PasswdHash = calculateMD5(password + User.PasswdSalt);

    User.Free;
  end;
end;

initialization

  GlobalContainer.RegisterType<TPasswordValidator>.Implements<IPasswordValidator>;

end.
