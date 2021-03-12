object CodeSite_Form: TCodeSite_Form
  Left = 0
  Top = 0
  Caption = 'Code site Demo'
  ClientHeight = 229
  ClientWidth = 641
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 52
    Width = 497
    Height = 169
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cbCountry: TComboBox
    Left = 8
    Top = 25
    Width = 113
    Height = 21
    TabOrder = 1
    Text = 'cbCountry'
    Items.Strings = (
      'USA'
      'England'
      'Canada'
      'Brazil'
      'Italy'
      'France'
      'Switzerland'
      'Japan'
      'Belgium'
      '')
  end
  object Button1: TButton
    Left = 136
    Top = 20
    Width = 113
    Height = 26
    Caption = 'Find Country'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 390
    Top = 21
    Width = 122
    Height = 25
    Caption = #47700#49548#46300#54840#52636'(Enter,Exit)'
    TabOrder = 3
  end
  object Button2: TButton
    Left = 255
    Top = 21
    Width = 129
    Height = 25
    Caption = 'Send('#44592#53440' '#51221#48372')'
    TabOrder = 4
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 511
    Top = 52
    Width = 122
    Height = 169
    ItemHeight = 13
    Items.Strings = (
      'a'
      'b'
      'c'
      'd')
    TabOrder = 5
  end
  object Button4: TButton
    Left = 518
    Top = 21
    Width = 115
    Height = 25
    Caption = 'FileLoad-->'#47700#47784#47532#45572#49688#48156#49373
    TabOrder = 6
    OnClick = Button4Click
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from customer')
    Left = 448
    Top = 72
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 320
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 384
    Top = 88
  end
  object MainMenu1: TMainMenu
    Left = 384
    Top = 72
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
    Left = 448
    Top = 128
  end
end
