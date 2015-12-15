unit Logging.Logger;

interface

uses
  Logging.Interfaces;

type
  TLogger = class (TInterfacedObject, ILogger)
  private
    FWarningCount : integer;
    FErrorCount   : integer;
    FLogWritter   : ILogWritter;

    function getWarningCount: integer;
    function getErrorCount: integer;
  public
    procedure Add(msg: string; const mType: TLogMessageType = lmtDefault);
    procedure ResetCounters();
    procedure Clear();
    procedure ClearAndReset();

    property WarningCount: integer read getWarningCount;
    property ErrorCount: integer read getErrorCount;

    constructor Create(LogWritter: ILogWritter);
  end;

implementation

uses
  Spring.Container,
  SysUtils;

{ TLogger }

procedure TLogger.Add(msg: string; const mType: TLogMessageType);
begin
  case mType of
    lmtError:
      begin
        msg := 'ERROR: ' + msg;
        Inc(FErrorCount);
      end;
    lmtWarning:
      begin
        msg := 'WARNING: ' + msg;
        Inc(FWarningCount);
      end;
  end;

  msg := DateTimeToStr(Now) + ' ' + msg;

  FLogWritter.Write(msg, mType);
end;

procedure TLogger.Clear;
begin
  FLogWritter.Clear;
end;

procedure TLogger.ClearAndReset;
begin
  ResetCounters();
  Clear();
end;

constructor TLogger.Create(LogWritter: ILogWritter);
begin
  inherited Create;

  FLogWritter := LogWritter;
  ResetCounters();
end;

function TLogger.getErrorCount: integer;
begin
  Result := FErrorCount;
end;

function TLogger.getWarningCount: integer;
begin
  Result := FWarningCount;
end;

procedure TLogger.ResetCounters;
begin
  FErrorCount := 0;
  FWarningCount := 0;
end;

initialization

  GlobalContainer.RegisterType<TLogger>.Implements<ILogger>.AsSingleton;

end.
