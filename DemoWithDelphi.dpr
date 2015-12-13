program DemoWithDelphi;

uses
  Spring.Container,
  Vcl.Forms,
  MainView in 'src\Forms\MainView.pas' {frmMainView},
  Data.Entities.User in 'src\Data\Entities\Data.Entities.User.pas',
  Data.Entities.Customer in 'src\Data\Entities\Data.Entities.Customer.pas',
  Data.Entities.Order in 'src\Data\Entities\Data.Entities.Order.pas',
  Data.Entities.OrderDetails in 'src\Data\Entities\Data.Entities.OrderDetails.pas',
  Data.Entities.Item in 'src\Data\Entities\Data.Entities.Item.pas',
  Data.Repositories.IRepository in 'src\Data\Repositories\Data.Repositories.IRepository.pas',
  Data.Repositories.IUsersRepository in 'src\Data\Repositories\Data.Repositories.IUsersRepository.pas',
  Security.Authentication.IPasswordValidator in 'src\Security\Authentication\Security.Authentication.IPasswordValidator.pas',
  Security.Authentication.PasswordValidator in 'src\Security\Authentication\Security.Authentication.PasswordValidator.pas',
  Security.Sessions.IUserSession in 'src\Security\Sessions\Security.Sessions.IUserSession.pas',
  Security.Sessions.UserSession in 'src\Security\Sessions\Security.Sessions.UserSession.pas',
  LoginView in 'src\Forms\LoginView.pas' {frmLoginView},
  OrdersView in 'src\Forms\OrdersView.pas' {frmOrdersView},
  Data.Repositories.UsersRepository in 'src\Data\Repositories\Data.Repositories.UsersRepository.pas',
  Data.Persistance.SQLiteConnectionFactory in 'src\Data\Persistance\Data.Persistance.SQLiteConnectionFactory.pas',
  Data.Repositories.Repository in 'src\Data\Repositories\Data.Repositories.Repository.pas',
  Data.Repositories.ICustomersRepository in 'src\Data\Repositories\Data.Repositories.ICustomersRepository.pas',
  Data.Repositories.CustomersRepository in 'src\Data\Repositories\Data.Repositories.CustomersRepository.pas',
  Data.Repositories.IOrdersRepository in 'src\Data\Repositories\Data.Repositories.IOrdersRepository.pas',
  Data.Repositories.OrdersRepository in 'src\Data\Repositories\Data.Repositories.OrdersRepository.pas',
  ItemsView in 'src\Forms\ItemsView.pas' {frmItemsView},
  CustomersView in 'src\Forms\CustomersView.pas' {frmCustomersView},
  Data.Repositories.IItemsRepository in 'src\Data\Repositories\Data.Repositories.IItemsRepository.pas',
  Data.Repositories.ItemsRepository in 'src\Data\Repositories\Data.Repositories.ItemsRepository.pas';

{$R *.res}

begin
  GlobalContainer.Build;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainView, frmMainView);
  Application.Run;
end.
