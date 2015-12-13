object frmOrdersView: TfrmOrdersView
  Left = 0
  Top = 0
  Caption = 'Orders'
  ClientHeight = 450
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 233
    Width = 746
    Height = 8
    Cursor = crVSplit
    Align = alTop
  end
  object DBGridOrders: TDBGrid
    Left = 0
    Top = 41
    Width = 746
    Height = 192
    Align = alTop
    Constraints.MinHeight = 150
    DataSource = DataSourceOrders
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerName'
        Title.Caption = 'Customer'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Note'
        Width = 150
        Visible = True
      end>
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 41
    Align = alTop
    TabOrder = 1
  end
  object DBGridOrderDetails: TDBGrid
    Left = 0
    Top = 241
    Width = 746
    Height = 209
    Align = alClient
    Constraints.MinHeight = 150
    DataSource = DataSourceOrderDetails
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ItemTitle'
        Title.Caption = 'Item'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Visible = True
      end>
  end
  object AureliusDatasetOrders: TAureliusDataset
    FieldDefs = <>
    AfterScroll = AureliusDatasetOrdersAfterScroll
    OnObjectInsert = AureliusDatasetOrdersObjectInsert
    OnObjectUpdate = AureliusDatasetOrdersObjectUpdate
    OnObjectRemove = AureliusDatasetOrdersObjectRemove
    Left = 408
    Top = 88
    object AureliusDatasetOrdersId: TIntegerField
      FieldName = 'Id'
    end
    object AureliusDatasetOrdersDate: TDateTimeField
      FieldName = 'Date'
    end
    object AureliusDatasetOrdersCustomerName: TStringField
      FieldKind = fkLookup
      FieldName = 'CustomerName'
      LookupDataSet = AureliusDatasetCustomersList
      LookupKeyFields = 'Id'
      LookupResultField = 'Name'
      KeyFields = 'CustomerId'
      Lookup = True
    end
    object AureliusDatasetOrdersNote: TStringField
      FieldName = 'Note'
    end
    object AureliusDatasetOrdersCustomerId: TIntegerField
      FieldName = 'CustomerId'
    end
  end
  object DataSourceOrders: TDataSource
    DataSet = AureliusDatasetOrders
    Left = 264
    Top = 88
  end
  object DataSourceOrderDetails: TDataSource
    DataSet = AureliusDatasetOrderDetails
    Left = 264
    Top = 272
  end
  object AureliusDatasetOrderDetails: TAureliusDataset
    FieldDefs = <>
    BeforePost = AureliusDatasetOrderDetailsBeforePost
    OnObjectInsert = AureliusDatasetOrderDetailsObjectInsert
    OnObjectUpdate = AureliusDatasetOrderDetailsObjectUpdate
    OnObjectRemove = AureliusDatasetOrderDetailsObjectRemove
    Left = 400
    Top = 272
    object IntegerField1: TIntegerField
      FieldName = 'Id'
    end
    object AureliusDatasetOrderDetailsOrderId: TIntegerField
      FieldName = 'OrderId'
    end
    object AureliusDatasetOrderDetailsItemId: TIntegerField
      FieldName = 'ItemId'
    end
    object AureliusDatasetOrderDetailsItemTitle: TStringField
      FieldKind = fkLookup
      FieldName = 'ItemTitle'
      LookupDataSet = AureliusDatasetItemsList
      LookupKeyFields = 'Id'
      LookupResultField = 'Title'
      KeyFields = 'ItemId'
      Size = 100
      Lookup = True
    end
    object AureliusDatasetOrderDetailsQuantity: TIntegerField
      FieldName = 'Quantity'
    end
  end
  object AureliusDatasetCustomersList: TAureliusDataset
    FieldDefs = <>
    Left = 400
    Top = 152
  end
  object AureliusDatasetItemsList: TAureliusDataset
    FieldDefs = <>
    Left = 400
    Top = 336
  end
end
