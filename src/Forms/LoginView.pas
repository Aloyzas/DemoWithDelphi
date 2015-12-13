unit LoginView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Security.Sessions.IUserSession;

type
  TfrmLoginView = class(TForm)
    panelTop: TPanel;
    lblUsername: TLabel;
    lblPassword: TLabel;
    txtUsername: TEdit;
    txtPassword: TEdit;
    btnLogin: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
    FUserSession : IUserSession;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
  end;

var
  frmLoginView: TfrmLoginView;

implementation

uses
  Spring.Services;

{$R *.dfm}

procedure TfrmLoginView.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close();
end;

procedure TfrmLoginView.btnLoginClick(Sender: TObject);
begin
  if FUserSession.LogIn(txtUsername.Text, txtPassword.Text) then
  begin
    ModalResult := mrOk;
  end else
  begin
    Application.MessageBox('Wrong username or password!', 'Login', MB_OK);
  end;
end;

constructor TfrmLoginView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FUserSession :=  ServiceLocator.GetService<IUserSession>;
end;

end.
