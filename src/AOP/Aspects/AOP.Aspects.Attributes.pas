unit AOP.Aspects.Attributes;

interface

uses
  DSharp.Aspects;

type
  LogAttribute = class(AspectAttribute)
  public
    constructor Create;
  end;

implementation

uses
  AOP.Aspects.Log;

{ LogAttribute }

constructor LogAttribute.Create;
begin
  inherited Create(TLogAspect);
end;

end.
