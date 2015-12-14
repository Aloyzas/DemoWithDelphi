unit Security.Authentication.IPasswordValidator;

interface

type
  {$M+}
  IPasswordValidator = interface
  ['{17D974C6-1BCA-40B6-BCB1-ADEDAB55B611}']
    function Validate(userName, password: string): Boolean;
  end;

implementation

end.
