object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object LabelTime: TLabel
    Left = 48
    Top = 32
    Width = 70
    Height = 21
    Caption = '[00:00:00]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 48
    Top = 144
    Width = 48
    Height = 21
    Caption = 'Turlar: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 376
    Width = 364
    Height = 21
    Caption = 'Kisayollar: Space = Baslat/Durdur, L = Tur, R = Sifirla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ButtonStartPause: TButton
    Left = 48
    Top = 88
    Width = 105
    Height = 25
    Caption = 'Baslat / Durdur'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonStartPauseClick
  end
  object ButtonLap: TButton
    Left = 179
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Tur'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonLapClick
  end
  object ButtonReset: TButton
    Left = 280
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Sifirla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonResetClick
  end
  object ListBoxLaps: TListBox
    Left = 48
    Top = 171
    Width = 169
    Height = 190
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    TabOrder = 3
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 568
    Top = 24
  end
end
