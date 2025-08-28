object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Pomodoro Timer'
  ClientHeight = 213
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 131
    Height = 25
    Caption = 'Calisma Suresi: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelWorkTime: TLabel
    Left = 161
    Top = 16
    Width = 56
    Height = 25
    Caption = '[00:00]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 26
    Top = 47
    Width = 108
    Height = 25
    Caption = 'Mola Suresi: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelRestTime: TLabel
    Left = 161
    Top = 47
    Width = 56
    Height = 25
    Caption = '[00:00]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 26
    Top = 141
    Width = 97
    Height = 25
    Caption = 'Kalan sure: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelTimeLeft: TLabel
    Left = 161
    Top = 141
    Width = 56
    Height = 25
    Caption = '[00:00]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 172
    Width = 67
    Height = 25
    Caption = 'Durum: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelStatus: TLabel
    Left = 149
    Top = 172
    Width = 68
    Height = 25
    Caption = '[durum]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ButtonStart: TButton
    Left = 26
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Baslat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonReset: TButton
    Left = 142
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Sifirla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonResetClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 32
    Top = 184
  end
end
