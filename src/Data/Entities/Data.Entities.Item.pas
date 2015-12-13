unit Data.Entities.Item;

interface

uses
  Aurelius.Mapping.Attributes;

type
  [Entity]
  [Automapping]
  [Table('Items')]
  TItem = class
  private
    FId: Integer;
    FTitle: string;
  public
    property Id: Integer read FId write FId;
    property Title: string read FTitle write FTitle;
  end;

implementation

initialization

  RegisterEntity(TItem);

end.
