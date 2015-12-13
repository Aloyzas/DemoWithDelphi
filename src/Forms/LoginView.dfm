object frmLoginView: TfrmLoginView
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  ClientHeight = 149
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsername: TLabel
    Left = 8
    Top = 52
    Width = 52
    Height = 13
    Caption = 'Username:'
  end
  object lblPassword: TLabel
    Left = 8
    Top = 100
    Width = 50
    Height = 13
    Caption = 'Password:'
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 294
    Height = 41
    Align = alTop
    Caption = 'User login'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object txtUsername: TEdit
    Left = 16
    Top = 68
    Width = 137
    Height = 21
    TabOrder = 0
    Text = 'demo'
  end
  object txtPassword: TEdit
    Left = 14
    Top = 116
    Width = 137
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'demo'
  end
  object btnLogin: TButton
    Left = 168
    Top = 75
    Width = 113
    Height = 25
    Caption = 'Login'
    Default = True
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object btnCancel: TButton
    Left = 168
    Top = 106
    Width = 113
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
