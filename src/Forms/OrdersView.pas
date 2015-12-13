unit OrdersView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Generics.Collections,
  Aurelius.Bind.Dataset,
  Data.Repositories.IOrdersRepository,
  Data.Repositories.IItemsRepository,
  Data.Repositories.ICustomersRepository,
  Data.Entities.Order,
  Data.Entities.Item,
  Data.Entities.Customer;

type
  TfrmOrdersView = class(TForm)
    DBGridOrders: TDBGrid;
    PanelTop: TPanel;
    AureliusDatasetOrders: TAureliusDataset;
    DataSourceOrders: TDataSource;
    Splitter1: TSplitter;
    DBGridOrderDetails: TDBGrid;
    DataSourceOrderDetails: TDataSource;
    AureliusDatasetOrderDetails: TAureliusDataset;
    IntegerField1: TIntegerField;
    AureliusDatasetCustomersList: TAureliusDataset;
    AureliusDatasetOrdersId: TIntegerField;
    AureliusDatasetOrdersDate: TDateTimeField;
    AureliusDatasetOrdersNote: TStringField;
    AureliusDatasetOrdersCustomerId: TIntegerField;
    AureliusDatasetOrdersCustomerName: TStringField;
    AureliusDatasetOrderDetailsOrderId: TIntegerField;
    AureliusDatasetOrderDetailsItemId: TIntegerField;
    AureliusDatasetItemsList: TAureliusDataset;
    AureliusDatasetOrderDetailsItemTitle: TStringField;
    AureliusDatasetOrderDetailsQuantity: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AureliusDatasetOrdersObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure AureliusDatasetOrdersObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure AureliusDatasetOrdersObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AureliusDatasetOrdersAfterScroll(DataSet: TDataSet);
    procedure AureliusDatasetOrderDetailsObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure AureliusDatasetOrderDetailsObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure AureliusDatasetOrderDetailsObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure AureliusDatasetOrderDetailsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FRepository: IOrdersRepository;
    FOrders: TList<TOrder>;

    FCustomersRepository: ICustomersRepository;
    FCustomers: TList<TCustomer>;

    FItemsRepository: IItemsRepository;
    FItems: TList<TItem>;
  public
    { Public declarations }
  end;

var
  frmOrdersView: TfrmOrdersView;

implementation

uses
  Spring.Services,
  Data.Entities.OrderDetails;

{$R *.dfm}

procedure TfrmOrdersView.AureliusDatasetOrderDetailsBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('OrderId').AsInteger :=
    FOrders[AureliusDatasetOrders.RecNo-1].Id;
end;

procedure TfrmOrdersView.AureliusDatasetOrderDetailsObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  FRepository.AddOrderDetails(AObject as TOrderDetails);
end;

procedure TfrmOrdersView.AureliusDatasetOrderDetailsObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  FRepository.RemoveOrderDetails(AObject as TOrderDetails);
end;

procedure TfrmOrdersView.AureliusDatasetOrderDetailsObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  FRepository.UpdateOrderDetails(AObject as TOrderDetails);
end;

procedure TfrmOrdersView.AureliusDatasetOrdersAfterScroll(DataSet: TDataSet);
begin
  AureliusDatasetOrderDetails.Close;
  if DataSet.RecordCount > 0 then
  begin
    AureliusDatasetOrderDetails.SetSourceList(
      FRepository.GetAllOrderDetails(FOrders[DataSet.RecNo-1].Id)
    );
    AureliusDatasetOrderDetails.Open;
  end;
end;

procedure TfrmOrdersView.AureliusDatasetOrdersObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  FRepository.Add(AObject as TOrder);
end;

procedure TfrmOrdersView.AureliusDatasetOrdersObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
 FRepository.Remove(AObject as TOrder);
end;

procedure TfrmOrdersView.AureliusDatasetOrdersObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  FRepository.Update(AObject as TOrder);
end;

procedure TfrmOrdersView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmOrdersView.FormCreate(Sender: TObject);
begin
  FCustomersRepository := ServiceLocator.GetService<ICustomersRepository>;
  FCustomers := FCustomersRepository.GetAll;
  AureliusDatasetCustomersList.SetSourceList(FCustomers);
  AureliusDatasetCustomersList.Open;

  FItemsRepository := ServiceLocator.GetService<IItemsRepository>;
  FItems := FItemsRepository.GetAll;
  AureliusDatasetItemsList.SetSourceList(FItems);
  AureliusDatasetItemsList.Open;

  FRepository := ServiceLocator.GetService<IOrdersRepository>;
  FOrders := FRepository.GetAll;
  AureliusDatasetOrders.SetSourceList(FOrders);
  AureliusDatasetOrders.Open;
end;

end.
