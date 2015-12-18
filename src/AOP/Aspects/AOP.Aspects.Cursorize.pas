unit AOP.Aspects.Cursorize;

interface

uses
  DSharp.Aspects,
  Rtti,
  SysUtils;

type
  TCursorizeAspect = class(TAspect)
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
  Vcl.Forms, Vcl.Controls;

{ TCursorizeAspect }

class procedure TCursorizeAspect.DoAfter(Instance: TObject; Method: TRttiMethod;
  const Args: TArray<TValue>; var Result: TValue);
begin
  Screen.Cursor := crDefault;
end;

class procedure TCursorizeAspect.DoBefore(Instance: TObject; Method: TRttiMethod;
  const Args: TArray<TValue>; out DoInvoke: Boolean; out Result: TValue);
begin
  //TODO: save previuos cursor instead of using crDefault
  Screen.Cursor := crHourGlass;
end;

class procedure TCursorizeAspect.DoException(Instance: TObject; Method: TRttiMethod;
  const Args: TArray<TValue>; out RaiseException: Boolean; Exception: Exception;
  out Result: TValue);
begin
  Screen.Cursor := crDefault;
end;

end.
