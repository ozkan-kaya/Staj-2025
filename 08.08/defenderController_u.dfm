object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 292
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object disableDefenderButton: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 58
    Caption = 'Disable Defender'
    TabOrder = 0
    OnClick = disableDefenderButtonClick
  end
  object disableSmartScreen: TButton
    Left = 8
    Top = 72
    Width = 121
    Height = 57
    Caption = 'Disable SmartScreen'
    TabOrder = 1
    OnClick = disableSmartScreenButtonClick
  end
  object enableDefenderButton: TButton
    Left = 135
    Top = 8
    Width = 121
    Height = 58
    Caption = 'Enable Defender'
    TabOrder = 2
    OnClick = enableDefenderButtonClick
  end
  object enableSmartScreen: TButton
    Left = 135
    Top = 72
    Width = 121
    Height = 57
    Caption = 'Enable SmartScreen'
    TabOrder = 3
    OnClick = enableSmartScreenButtonClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 138
    Width = 248
    Height = 146
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
end
