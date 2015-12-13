unit Data.Entities.OrderDetails;

interface

uses
  Data.Entities.Item,
  Data.Entities.Order,
  Aurelius.Mapping.Attributes;

type
  [Entity]
  [Automapping]
  [Table('OrderDetails')]
  TOrderDetails = class
  private
    FId: Integer;
    FOrderId: Integer;
    [Assotiation]
    FOrder: TOrder;
    FItemId: Integer;
    [Assotiation]
    FItem: TItem;
    FQuantity: Integer;
  public
    property Id: Integer read FId write FId;
    property OrderId: Integer read FOrderId write FOrderId;
    property Order: TOrder read FOrder write FOrder;
    property ItemId: Integer read FItemId write FItemId;
    property Item: TItem read FItem write FItem;
    property Quantity: Integer read FQuantity write FQuantity;
  end;

implementation

initialization

  RegisterEntity(TOrderDetails);

end.
