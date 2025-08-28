object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 227
  ClientWidth = 179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Shape1: TShape
    Left = 51
    Top = 16
    Width = 73
    Height = 193
    Brush.Color = clBlack
    Shape = stRoundRect
  end
  object Shape2: TShape
    Left = 60
    Top = 24
    Width = 55
    Height = 55
    Brush.Color = clRed
    Shape = stCircle
  end
  object Shape3: TShape
    Left = 60
    Top = 85
    Width = 55
    Height = 55
    Brush.Color = clYellow
    Shape = stCircle
  end
  object Shape4: TShape
    Left = 60
    Top = 146
    Width = 55
    Height = 55
    Brush.Color = clLime
    Shape = stCircle
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 24
  end
end
