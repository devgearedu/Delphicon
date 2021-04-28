object CodeSite_Form: TCodeSite_Form
  Left = 0
  Top = 0
  Caption = 'Code site Demo'
  ClientHeight = 229
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button3: TButton
    Left = 8
    Top = 33
    Width = 129
    Height = 25
    Caption = #47700#49548#46300#54840#52636'(Enter,Exit)'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 8
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Send('#44592#53440' '#51221#48372')'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 8
    Top = 64
    Width = 266
    Height = 157
    ItemHeight = 13
    Items.Strings = (
      'a'
      'b'
      'c'
      'd')
    TabOrder = 2
  end
  object Button4: TButton
    Left = 151
    Top = 33
    Width = 121
    Height = 25
    Caption = 'FileLoad-->'#47700#47784#47532#45572#49688#48156#49373
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 153
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Get Item'
    TabOrder = 4
  end
  object MainMenu1: TMainMenu
    Left = 304
    Top = 40
    object CodeSite1: TMenuItem
      Caption = 'CodeSite'
      object Enable1: TMenuItem
        Caption = 'Enable'
      end
      object Disable1: TMenuItem
        Caption = 'Disable'
      end
    end
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 296
    Top = 96
  end
end
