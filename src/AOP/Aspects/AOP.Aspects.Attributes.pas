unit AOP.Aspects.Attributes;

interface

uses
  DSharp.Aspects;

type
  LogAttribute = class(AspectAttribute)
  public
    constructor Create;
  end;

type
  CursorizeAttribute = class(AspectAttribute)
  public
    constructor Create;
  end;

implementation

uses
  AOP.Aspects.Log,
  AOP.Aspects.Cursorize;

{ LogAttribute }

constructor LogAttribute.Create;
begin
  inherited Create(TLogAspect);
end;

{ CursorizeAttribute }

constructor CursorizeAttribute.Create;
begin
  inherited Create(TCursorizeAspect);
end;

end.
