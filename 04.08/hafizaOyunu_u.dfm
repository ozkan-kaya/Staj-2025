object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Haf'#305'za Oyunu'
  ClientHeight = 279
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object LabelStatus: TLabel
    Left = 24
    Top = 32
    Width = 119
    Height = 21
    Caption = 'Kartlar'#305' E'#351'le'#351'tirin:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 24
    Top = 88
    Width = 57
    Height = 57
    Caption = '[?]'
    TabOrder = 0
    OnClick = CardClick
  end
  object Button2: TButton
    Left = 96
    Top = 88
    Width = 57
    Height = 57
    Caption = '[?]'
    TabOrder = 1
    OnClick = CardClick
  end
  object Button3: TButton
    Left = 168
    Top = 88
    Width = 57
    Height = 57
    Caption = '[?]'
    TabOrder = 2
    OnClick = CardClick
  end
  object Button4: TButton
    Left = 240
    Top = 88
    Width = 57
    Height = 57
    Caption = '[?]'
    TabOrder = 3
    OnClick = CardClick
  end
  object Button5: TButton
    Left = 24
    Top = 160
    Width = 57
    Height = 57
    Caption = '[?]'
    TabOrder = 4
    OnClick = CardClick
  end
  object Button6: TButton
    Left = 96
    Top = 160
    Width = 57
    Height = 57
    Caption = '[?]'
    TabOrder = 5
    OnClick = CardClick
  end
  object Button7: TButton
    Left = 168
    Top = 160
    Width = 57
    Height = 57
    Caption = '[?]'
    TabOrder = 6
    OnClick = CardClick
  end
  object Button8: TButton
    Left = 240
    Top = 160
    Width = 57
    Height = 57
    Caption = '[?]'
    TabOrder = 7
    OnClick = CardClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 232
  end
end
