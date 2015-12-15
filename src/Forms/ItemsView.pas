unit ItemsView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Generics.Collections,
  Aurelius.Bind.Dataset,
  Data.Repositories.IItemsRepository,
  Data.Entities.Item;

type
  TfrmItemsView = class(TForm)
    DBGridItems: TDBGrid;
    PanelTop: TPanel;
    AureliusDatasetItems: TAureliusDataset;
    DataSourceItems: TDataSource;
    AureliusDatasetItemsId: TIntegerField;
    AureliusDatasetItemsTitle: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AureliusDatasetItemsObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure AureliusDatasetItemsObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure AureliusDatasetItemsObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FRepository: IItemsRepository;
    FItems: TList<TItem>;
  public
    { Public declarations }
  end;

var
  frmItemsView: TfrmItemsView;

implementation

uses
  Spring.Services,
  DSharp.Aspects.Weaver;

{$R *.dfm}

procedure TfrmItemsView.AureliusDatasetItemsObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  FRepository.Add(AObject as TItem);
end;

procedure TfrmItemsView.AureliusDatasetItemsObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  FRepository.Remove(AObject as TItem);
end;

procedure TfrmItemsView.AureliusDatasetItemsObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  FRepository.Update(AObject as TItem);
end;

procedure TfrmItemsView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmItemsView.FormCreate(Sender: TObject);
begin
  //FRepository := ServiceLocator.GetService<IItemsRepository>;

  //TODO: find a way to assign Proxifier to global ServiceLocator service.
  FRepository := AspectWeaver.Proxify<IItemsRepository>(ServiceLocator.GetService<IItemsRepository>);

  FItems := FRepository.GetAll;

  AureliusDatasetItems.SetSourceList(FItems);
  AureliusDatasetItems.Open;
end;

end.
