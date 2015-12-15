object frmItemsView: TfrmItemsView
  Left = 0
  Top = 0
  Caption = 'Items'
  ClientHeight = 329
  ClientWidth = 484
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
  object DBGridItems: TDBGrid
    Left = 0
    Top = 41
    Width = 484
    Height = 288
    Align = alClient
    DataSource = DataSourceItems
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
        FieldName = 'Title'
        Width = 150
        Visible = True
      end>
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 41
    Align = alTop
    TabOrder = 1
  end
  object AureliusDatasetItems: TAureliusDataset
    FieldDefs = <>
    OnObjectInsert = AureliusDatasetItemsObjectInsert
    OnObjectUpdate = AureliusDatasetItemsObjectUpdate
    OnObjectRemove = AureliusDatasetItemsObjectRemove
    Left = 168
    Top = 120
    object AureliusDatasetItemsId: TIntegerField
      FieldName = 'Id'
    end
    object AureliusDatasetItemsTitle: TStringField
      FieldName = 'Title'
      Size = 100
    end
  end
  object DataSourceItems: TDataSource
    DataSet = AureliusDatasetItems
    Left = 72
    Top = 120
  end
end
