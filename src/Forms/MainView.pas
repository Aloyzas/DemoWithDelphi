unit MainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls,
  Security.Sessions.IUserSession;

type
  TfrmMainView = class(TForm)
    MainMenu1: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miList: TMenuItem;
    miCustomers: TMenuItem;
    miItems: TMenuItem;
    miOrders: TMenuItem;
    miDB: TMenuItem;
    miUpdateSchema: TMenuItem;
    StatusBarBottom: TStatusBar;
    procedure miExitClick(Sender: TObject);
    procedure miCustomersClick(Sender: TObject);
    procedure miItemsClick(Sender: TObject);
    procedure miOrdersClick(Sender: TObject);
    procedure miUpdateSchemaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FUserSession : IUserSession;
  public
    { Public declarations }
  end;

var
  frmMainView: TfrmMainView;

implementation

uses
  CustomersView,
  ItemsView,
  OrdersView,
  LoginView,
  Aurelius.Engine.DatabaseManager,
  Aurelius.Drivers.Interfaces,
  Aurelius.SQL.SQLite,
  Aurelius.Schema.SQLite,
  Spring.Services;

{$R *.dfm}

procedure TfrmMainView.FormCreate(Sender: TObject);
begin
   frmLoginView := TfrmLoginView.Create(Self);

   if (frmLoginView.ShowModal <> mrOK) then
   begin
     Application.Terminate;
   end;

   FUserSession := ServiceLocator.GetService<IUserSession>;

   StatusBarBottom.Panels[0].Text := IntToStr(FUserSession.getUserId());
end;

procedure TfrmMainView.miCustomersClick(Sender: TObject);
begin
  frmCustomersView := TfrmCustomersView.Create(Self);
  frmCustomersView.Show();
end;

procedure TfrmMainView.miExitClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmMainView.miItemsClick(Sender: TObject);
begin
  frmItemsView := TfrmItemsView.Create(Self);
  frmItemsView.Show();
end;

procedure TfrmMainView.miOrdersClick(Sender: TObject);
begin
  frmOrdersView := TfrmOrdersView.Create(Self);
  frmOrdersView.Show();
end;

procedure TfrmMainView.miUpdateSchemaClick(Sender: TObject);
var
  DatabaseManager: TDatabaseManager;
  ConnFac : IDBConnectionFactory;
begin
  ConnFac := ServiceLocator.GetService<IDBConnectionFactory>;

  DatabaseManager := TDatabaseManager.Create(ConnFac.CreateConnection);
  try
    //DatabaseManager.BuildDatabase;
    DatabaseManager.UpdateDatabase;
    ShowMessage('Database schema updated succesfully.');
  finally
    DatabaseManager.Free;
  end;
end;

end.
