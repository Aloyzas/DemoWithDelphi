unit CustomersView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Generics.Collections,
  Aurelius.Bind.Dataset,
  Data.Repositories.ICustomersRepository,
  Data.Entities.Customer, Vcl.StdCtrls;

type
  TfrmCustomersView = class(TForm)
    DBGridCustomers: TDBGrid;
    PanelTop: TPanel;
    AureliusDatasetCustomers: TAureliusDataset;
    DataSourceCustomers: TDataSource;
    AureliusDatasetCustomersId: TIntegerField;
    AureliusDatasetCustomersName: TStringField;
    AureliusDatasetCustomersPhone: TStringField;
    AureliusDatasetCustomersEmail: TStringField;
    AureliusDatasetCustomersAddress: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AureliusDatasetCustomersObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure AureliusDatasetCustomersObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure AureliusDatasetCustomersObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCutomersRepository: ICustomersRepository;
    FCustomers: TList<TCustomer>;
  public
    { Public declarations }
  end;

var
  frmCustomersView: TfrmCustomersView;

implementation

uses
  Data.Repositories.CustomersRepository,
  Spring.Services;

{$R *.dfm}

procedure TfrmCustomersView.AureliusDatasetCustomersObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  FCutomersRepository.Add(AObject as TCustomer);
end;

procedure TfrmCustomersView.AureliusDatasetCustomersObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  FCutomersRepository.Remove(AObject as TCustomer);
end;

procedure TfrmCustomersView.AureliusDatasetCustomersObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  FCutomersRepository.Update(AObject as TCustomer);
end;

procedure TfrmCustomersView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCustomersView.FormCreate(Sender: TObject);
begin
  FCutomersRepository := ServiceLocator.GetService<ICustomersRepository>;

  FCustomers := FCutomersRepository.GetAll;

  AureliusDatasetCustomers.SetSourceList(FCustomers);
  AureliusDatasetCustomers.Open;
end;

end.
