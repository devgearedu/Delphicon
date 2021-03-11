object CodeSight_Form: TCodeSight_Form
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
  object Image1: TImage
    Left = 511
    Top = 52
    Width = 126
    Height = 74
    Picture.Data = {
      055449636F6E0000010001002020100000000000E80200001600000028000000
      2000000040000000010004000000000080020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF0000000000000000000000000000000000000000000000007777770000
      0000000000000000000000000007000000000000000000000000000000070000
      0000000000000000000000777007000000000000000000077070007770070000
      7000000000000077000700787000000007000000000007708000077877000070
      00700000000007088807777777770777000700000000008F88877FFFFF077887
      70070000000000088888F88888FF08870070000000000000880888877778F070
      00700000000777088888880007778F770077777000700008F088007777077F07
      000000700700008F08880800077778F7700000700708888F0880F08F807078F7
      777700700708F88F0780F070F07078F7887700700708888F0780F077807088F7
      777700700700008F0788FF00080888F77000007000000008F0780FFFF0088F77
      0070000000000008F07788000888887700700000000000008F07788888880870
      00700000000000088FF0077788088887000700000000008F888FF00000F87887
      7007000000000708F8088FFFFF88078700700000000007708000088888000070
      0700000000000077007000888007000070000000000000077700008F80070007
      0000000000000000000000888007000000000000000000000000000000070000
      0000000000000000000007777777000000000000000000000000000000000000
      00000000FFFFFFFFFFFC0FFFFFFC0FFFFFF80FFFFFF80FFFFE180E7FFC00043F
      F800001FF800000FF800000FFC00001FFE00001FE0000001C000000180000001
      80000001800000018000000180000001FC00001FFC00001FFE00001FFC00000F
      F800000FF800001FF800003FFC180C7FFE380EFFFFF80FFFFFF80FFFFFF80FFF
      FFFFFFFF}
  end
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
    OnClick = Button3Click
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
    Top = 132
    Width = 126
    Height = 89
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
    Left = 440
    Top = 72
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 336
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 376
    Top = 128
  end
  object MainMenu1: TMainMenu
    Left = 376
    Top = 72
    object CodeSite1: TMenuItem
      Caption = 'CodeSite'
      object Enable1: TMenuItem
        Caption = 'Enable'
        OnClick = Enable1Click
      end
      object Disable1: TMenuItem
        Caption = 'Disable'
        OnClick = Disable1Click
      end
    end
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 440
    Top = 128
  end
end
