unit Data.Entities.User;

interface

uses
  Aurelius.Mapping.Attributes;

type
  [Entity]
  [Automapping]
  [Table('Users')]
  TUser = class
  private
    FId: Integer;
    FFirstName: string;
    FLastName: string;
    [Column('LOGIN_NAME', [TColumnProp.Unique, TColumnProp.Required])]
    FLoginName: string;
    FPasswdHash: string;
    FPasswdSalt: string;
  public
    property Id: Integer read FId write FId;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property LoginName: string read FLoginName write FLoginName;
    property PasswdHash: string read FPasswdHash write FPasswdHash;
    property PasswdSalt: string read FPasswdSalt write FPasswdSalt;
  end;

implementation

initialization

  RegisterEntity(TUser);

end.
