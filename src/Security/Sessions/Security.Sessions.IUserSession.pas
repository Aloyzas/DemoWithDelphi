unit Security.Sessions.IUserSession;

interface

type
  IUserSession = interface
  ['{2F4F4874-785E-4582-9BBB-D9BD73F31CD3}']
    function LogIn(userName, password: string): Boolean;
    procedure LogOut();
    function isLoggedIn(): Boolean;
    function getUserId(): Integer;
  end;

implementation

end.
