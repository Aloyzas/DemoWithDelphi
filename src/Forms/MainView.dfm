object frmMainView: TfrmMainView
  Left = 0
  Top = 0
  Caption = 'DemoWithDelphi'
  ClientHeight = 565
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBarBottom: TStatusBar
    Left = 0
    Top = 546
    Width = 854
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 152
    object miFile: TMenuItem
      Caption = 'File'
      object miExit: TMenuItem
        Caption = 'Exit'
        OnClick = miExitClick
      end
    end
    object miList: TMenuItem
      Caption = 'List'
      object miCustomers: TMenuItem
        Caption = 'Customers'
        OnClick = miCustomersClick
      end
      object miItems: TMenuItem
        Caption = 'Items'
        OnClick = miItemsClick
      end
      object miOrders: TMenuItem
        Caption = 'Orders'
        OnClick = miOrdersClick
      end
    end
    object miDB: TMenuItem
      Caption = 'DB'
      object miUpdateSchema: TMenuItem
        Caption = 'Update schema'
        OnClick = miUpdateSchemaClick
      end
    end
  end
end
