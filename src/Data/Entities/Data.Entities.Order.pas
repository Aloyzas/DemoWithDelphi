unit Data.Entities.Order;

interface

uses
  Generics.Collections,
  Data.Entities.Customer,
//  Data.Entities.OrderDetails,
  Data.Entities.Item,
  Aurelius.Mapping.Attributes;

type
  [Entity]
  [Automapping]
  [Table('Orders')]
  TOrder = class
  private
    FId: Integer;
    FDate: TDateTime;
    FCustomerId: Integer;
    [Association]
    FCustomer: TCustomer;
//    [Association]
//    FOrderDetails: TList<TOrderDetails>;
    FNote: string;
  public
    property Id: Integer read FId write FId;
    property Date: TDateTime read FDate write FDate;
    property CustomerId: Integer read FCustomerId write FCustomerId;
    property Customer: TCustomer read FCustomer write FCustomer;
//    property OrderDetails: TList<TOrderDetails> read FOrderDetails write FOrderDetails;
    property Note: string read FNote write FNote;
  end;

implementation

initialization

  RegisterEntity(TOrder);

end.
