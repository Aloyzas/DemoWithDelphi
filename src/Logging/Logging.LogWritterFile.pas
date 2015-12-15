unit Logging.LogWritterFile;

interface

uses
  Logging.Interfaces;

type
  TLogWritterFile = class (TInterfacedObject, ILogWritter)
  private
    FFile     : TextFile;
  public
    procedure Write(msg: string; const mType: TLogMessageType = lmtDefault);
    procedure Clear();
    constructor Create(FileName : String); reintroduce;
    destructor Destroy(); override;
  end;

implementation

uses
  Spring.Container,
  SysUtils;

{ TLogWritterFile }

procedure TLogWritterFile.Clear;
begin
  //TODO or NOT TODO
end;

constructor TLogWritterFile.Create(FileName: String);
begin
  inherited Create;

  Assign(FFile, FileName);

  if FileExists(FileName)
    then Append(FFile)
    else Rewrite(FFile);
end;

destructor TLogWritterFile.Destroy;
begin
  CloseFile(FFile);

  inherited Destroy;
end;

procedure TLogWritterFile.Write(msg: string; const mType: TLogMessageType);
begin
  Writeln(FFile, msg);
end;

initialization

  GlobalContainer.RegisterType<ILogWritter>.DelegateTo
  (
    function: ILogWritter
    begin
      Result := TLogWritterFile.Create('../../logs/demowithdelphi.log');
    end
  );

end.
