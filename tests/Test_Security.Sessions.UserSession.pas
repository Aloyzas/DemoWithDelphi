unit Test_Security.Sessions.UserSession;

interface

uses
  DUnitX.TestFramework, DSharp.Testing.Mock, Security.Authentication.IPasswordValidator,
  Data.Repositories.IUsersRepository, Data.Entities.User;

type

  [TestFixture]
  TUserSessionTest = class(TObject)
  private
    FMockPasswordValidator : Mock<IPasswordValidator>;
    FMockUsersRepository : Mock<IUsersRepository>;
    FUser : TUser;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestLogin_WithValidCrediantials;
    [Test]
    procedure TestLogin_WithInvalidCrediantials;
    [Test]
    procedure TestGetUserId_AfterValidLogin;
    [Test]
    procedure TestLogout;
  end;

implementation

uses
  Security.Sessions.IUserSession, Security.Sessions.UserSession;

procedure TUserSessionTest.Setup;
begin
  with FMockPasswordValidator.Setup do
  begin
    WillReturn(True).Any.WhenCalling.Validate('demo', 'demo');
    WillReturn(False).Any.WhenCallingWithAnyArguments.Validate('', '');
  end;

  FUser := TUser.Create;
  FUser.Id := 500;
  FUser.FirstName := 'Jonas';
  FUser.LastName := 'Jonaitis';
  FUser.LoginName := 'demo';

  with FMockUsersRepository.Setup do
  begin
    WillReturn(FUser).Any.WhenCalling.GetByLogin('demo');
    WillReturn(nil).Any.WhenCallingWithAnyArguments.GetByLogin('');
  end;
end;

procedure TUserSessionTest.TearDown;
begin
end;

procedure TUserSessionTest.TestLogin_WithInvalidCrediantials;
var
  userSession : IUserSession;
  ReturnValue : Boolean;
begin
  userSession := TUserSession.Create(FMockPasswordValidator, FMockUsersRepository);

  ReturnValue := userSession.LogIn('demo', 'hmm');
  Assert.IsFalse(ReturnValue);
end;

procedure TUserSessionTest.TestLogin_WithValidCrediantials;
var
  userSession : IUserSession;
  ReturnValue : Boolean;
begin
  userSession := TUserSession.Create(FMockPasswordValidator, FMockUsersRepository);

  ReturnValue := userSession.LogIn('demo', 'demo');
  Assert.IsTrue(ReturnValue);
end;

procedure TUserSessionTest.TestGetUserId_AfterValidLogin;
var
  userSession : IUserSession;
  ReturnValue : Integer;
begin
  userSession := TUserSession.Create(FMockPasswordValidator, FMockUsersRepository);

  userSession.LogIn('demo', 'demo');
  ReturnValue := userSession.getUserId();
  Assert.IsTrue(ReturnValue = 500);
end;

procedure TUserSessionTest.TestLogout;
var
  userSession : IUserSession;
begin
  userSession := TUserSession.Create(FMockPasswordValidator, FMockUsersRepository);

  userSession.LogIn('demo', 'demo');
  Assert.IsTrue(userSession.isLoggedIn());
  userSession.LogOut;
  Assert.IsFalse(userSession.isLoggedIn());
end;

initialization

  TDUnitX.RegisterTestFixture(TUserSessionTest);

end.
