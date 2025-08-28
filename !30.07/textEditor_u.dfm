object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TXT Editor'
  ClientHeight = 441
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 272
    Top = 19
    Width = 86
    Height = 25
    Caption = 'TXT Editor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 35
    Width = 96
    Height = 21
    Caption = 'Dosya '#304#231'eri'#287'i: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ButtonOpen: TButton
    Left = 8
    Top = 408
    Width = 104
    Height = 25
    Caption = 'A'#231
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonOpenClick
  end
  object ButtonSave: TButton
    Left = 118
    Top = 408
    Width = 104
    Height = 25
    Caption = 'Kaydet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonSaveAsClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 62
    Width = 598
    Height = 331
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 392
    Top = 408
    Width = 104
    Height = 25
    Caption = 'Temizle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = ButtonClearClick
  end
  object Button2: TButton
    Left = 502
    Top = 408
    Width = 104
    Height = 25
    Caption = 'Replace'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = ButtonReplaceClick
  end
  object ButtonSaveAs: TButton
    Left = 228
    Top = 408
    Width = 104
    Height = 25
    Caption = 'Farkl'#305' Kaydet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = ButtonSaveAsClick
  end
  object OpenDialog1: TOpenDialog
    Left = 560
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 560
    Top = 72
  end
end
