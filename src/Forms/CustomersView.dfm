object frmCustomersView: TfrmCustomersView
  Left = 0
  Top = 0
  Caption = 'Customers'
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
  object DBGridCustomers: TDBGrid
    Left = 0
    Top = 41
    Width = 746
    Height = 409
    Align = alClient
    DataSource = DataSourceCustomers
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
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Phone'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Email'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address'
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
  object AureliusDatasetCustomers: TAureliusDataset
    FieldDefs = <>
    OnObjectInsert = AureliusDatasetCustomersObjectInsert
    OnObjectUpdate = AureliusDatasetCustomersObjectUpdate
    OnObjectRemove = AureliusDatasetCustomersObjectRemove
    Left = 400
    Top = 88
    object AureliusDatasetCustomersId: TIntegerField
      FieldName = 'Id'
    end
    object AureliusDatasetCustomersName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object AureliusDatasetCustomersPhone: TStringField
      FieldName = 'Phone'
      Size = 50
    end
    object AureliusDatasetCustomersEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object AureliusDatasetCustomersAddress: TStringField
      FieldName = 'Address'
      Size = 100
    end
  end
  object DataSourceCustomers: TDataSource
    DataSet = AureliusDatasetCustomers
    Left = 264
    Top = 88
  end
end
