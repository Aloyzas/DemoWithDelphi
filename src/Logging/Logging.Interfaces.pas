unit Logging.Interfaces;

interface

type
  TLogMessageType = (lmtError, lmtWarning, lmtDefault);

type
  ILogger = interface
    ['{D0391630-3A81-44CC-B717-4ED8614AAEF0}']
    function getWarningCount: integer;
    function getErrorCount: integer;

    procedure Add(msg: string; const mType: TLogMessageType = lmtDefault);
    procedure ResetCounters();
    procedure Clear();
    procedure ClearAndReset();

    property WarningCount: integer read getWarningCount;
    property ErrorCount: integer read getErrorCount;
  end;

type
  ILogWritter = interface
    ['{154E0618-D807-4308-B17F-766CE9EB6945}']
    procedure Write(msg: string; const mType: TLogMessageType = lmtDefault);
    procedure Clear();
  end;

implementation

end.
