object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Temp Cleaner'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnActivate = FormActivate
  TextHeight = 15
  object Label1: TLabel
    Left = 204
    Top = 20
    Width = 221
    Height = 27
    Caption = 'Temp File Cleaner'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'JetBrains Mono'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 26
    Top = 53
    Width = 472
    Height = 51
    Caption = 
      'This program deletes files and folders in cfolders on your compu' +
      'ter. You can choose which folders to clean in the settings. It s' +
      'hows what it deletes in the logs. Select the folders you want, o' +
      'r it will delete all temporary files by default.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Memo1: TMemo
    Left = 21
    Top = 120
    Width = 574
    Height = 241
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 21
    Top = 384
    Width = 75
    Height = 30
    Caption = 'Clean'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 520
    Top = 384
    Width = 75
    Height = 30
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 520
    Top = 64
    Width = 75
    Height = 29
    Caption = 'Settings'
    TabOrder = 3
    OnClick = Button3Click
  end
end
