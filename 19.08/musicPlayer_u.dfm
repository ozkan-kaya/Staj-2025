object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Music Player'
  ClientHeight = 204
  ClientWidth = 434
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
    Top = 80
    Width = 71
    Height = 15
    Caption = 'Calan Dosya: '
  end
  object LabelPlayingFile: TLabel
    Left = 101
    Top = 80
    Width = 65
    Height = 15
    Caption = '[PlayingFile]'
  end
  object Label2: TLabel
    Left = 144
    Top = 132
    Width = 29
    Height = 15
    Caption = 'Sure: '
  end
  object LabelTime: TLabel
    Left = 179
    Top = 132
    Width = 73
    Height = 15
    Caption = '[00:00 / 00:00]'
  end
  object ButtonOpen: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Ac'
    TabOrder = 0
    OnClick = ButtonOpenClick
  end
  object ButtonPlay: TButton
    Left = 128
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Oynat'
    TabOrder = 1
    OnClick = ButtonPlayClick
  end
  object ButtonPause: TButton
    Left = 232
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Duraklat'
    TabOrder = 2
    OnClick = ButtonPauseClick
  end
  object ButtonStop: TButton
    Left = 336
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Durdur'
    TabOrder = 3
    OnClick = ButtonStopClick
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 109
    Width = 387
    Height = 17
    TabOrder = 4
  end
  object MediaPlayer1: TMediaPlayer
    Left = 24
    Top = 174
    Width = 379
    Height = 22
    DoubleBuffered = True
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 5
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 24
    Top = 136
  end
  object OpenDialog1: TOpenDialog
    Left = 72
    Top = 136
  end
end
