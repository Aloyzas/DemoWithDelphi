unit Data.Entities.Customer;

interface

uses
  Aurelius.Mapping.Attributes;

type
  [Entity]
  [Automapping]
  [Table('Customers')]
  TCustomer = class
  private
    FId: Integer;
    FName: string;
    FEmail: string;
    FPhone: string;
    FAddress: string;
  public
    property Id: Integer read FId write FId;
    property Name: string read FName write FName;
    property Email: string read FEmail write FEmail;
    property Phone: string read FPhone write FPhone;
    property Address: string read FAddress write FAddress;
  end;

implementation

initialization

  RegisterEntity(TCustomer);

end.
