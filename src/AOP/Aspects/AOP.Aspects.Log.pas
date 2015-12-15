unit AOP.Aspects.Log;

interface

uses
  DSharp.Aspects,
  Rtti,
  SysUtils;

type
  TLogAspect = class(TAspect)
  public
    class procedure DoAfter(Instance: TObject; Method: TRttiMethod;
      const Args: TArray<TValue>; var Result: TValue); override;
    class procedure DoBefore(Instance: TObject; Method: TRttiMethod;
      const Args: TArray<TValue>; out DoInvoke: Boolean;
      out Result: TValue); override;
    class procedure DoException(Instance: TObject; Method: TRttiMethod;
      const Args: TArray<TValue>; out RaiseException: Boolean;
      Exception: Exception; out Result: TValue); override;
  end;

implementation

uses
  Logging.Interfaces,
  Spring.Services;

{ TLogAspect }

class procedure TLogAspect.DoAfter(Instance: TObject; Method: TRttiMethod;
  const Args: TArray<TValue>; var Result: TValue);
var
  Logger : ILogger;
begin
  Logger := ServiceLocator.GetService<ILogger>;
  Logger.Add('User has invoked method ' + Instance.ClassName + '.' + Method.Name);
end;

class procedure TLogAspect.DoBefore(Instance: TObject; Method: TRttiMethod;
  const Args: TArray<TValue>; out DoInvoke: Boolean; out Result: TValue);
begin
  inherited;

end;

class procedure TLogAspect.DoException(Instance: TObject; Method: TRttiMethod;
  const Args: TArray<TValue>; out RaiseException: Boolean; Exception: Exception;
  out Result: TValue);
begin
  inherited;

end;

end.
