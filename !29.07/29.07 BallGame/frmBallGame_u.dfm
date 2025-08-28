object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 330
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 96
    Height = 18
    Caption = 'Click a Button'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 232
    Top = 237
    Width = 60
    Height = 60
    Brush.Color = clSkyBlue
    Brush.Style = bsVertical
    Shape = stCircle
  end
  object btnUp: TButton
    Left = 40
    Top = 49
    Width = 75
    Height = 25
    Caption = 'Up'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnUpClick
  end
  object btnDown: TButton
    Left = 40
    Top = 89
    Width = 75
    Height = 25
    Caption = 'Down'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnDownClick
  end
  object BitBtnClose: TBitBtn
    Left = 40
    Top = 272
    Width = 75
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Roboto'
    Font.Style = []
    Kind = bkClose
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
  end
end
