object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Vote App'
  ClientHeight = 319
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object LabelQuestion: TLabel
    Left = 16
    Top = 16
    Width = 502
    Height = 21
    Caption = 
      'Soru: A'#351'a'#287#305'daki programlama dillerinden hangisini en '#231'ok seviyor' +
      'sunuz?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelResult: TLabel
    Left = 290
    Top = 130
    Width = 60
    Height = 20
    Caption = 'Sonu'#231'lar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelDelphi: TLabel
    Left = 290
    Top = 160
    Width = 73
    Height = 15
    Caption = 'Delphi: 0 (0%)'
  end
  object LabelPython: TLabel
    Left = 290
    Top = 186
    Width = 44
    Height = 15
    Caption = 'Python: '
  end
  object LabelCpp: TLabel
    Left = 290
    Top = 208
    Width = 30
    Height = 15
    Caption = 'C++: '
  end
  object LabelJava: TLabel
    Left = 290
    Top = 229
    Width = 28
    Height = 15
    Caption = 'Java: '
  end
  object LabelJavascipt: TLabel
    Left = 290
    Top = 254
    Width = 57
    Height = 15
    Caption = 'Javascript: '
  end
  object LabelOther: TLabel
    Left = 290
    Top = 275
    Width = 34
    Height = 15
    Caption = 'Di'#287'er: '
  end
  object LabelNumberofVotes: TLabel
    Left = 16
    Top = 225
    Width = 59
    Height = 17
    Caption = 'Oy Say'#305's'#305': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object RadioButtonDelphi: TRadioButton
    Left = 16
    Top = 66
    Width = 113
    Height = 17
    Caption = 'Delphi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RadioButtonPython: TRadioButton
    Left = 16
    Top = 89
    Width = 113
    Height = 17
    Caption = 'Python'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object RadioButtonCpp: TRadioButton
    Left = 16
    Top = 112
    Width = 113
    Height = 17
    Caption = 'C++'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object RadioButtonJava: TRadioButton
    Left = 16
    Top = 135
    Width = 113
    Height = 17
    Caption = 'Java'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object RadioButtonJavascript: TRadioButton
    Left = 16
    Top = 158
    Width = 113
    Height = 17
    Caption = 'Javascript'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object RadioButtonOther: TRadioButton
    Left = 16
    Top = 181
    Width = 113
    Height = 17
    Caption = 'Di'#287'er'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object ButtonVote: TButton
    Left = 16
    Top = 268
    Width = 86
    Height = 25
    Caption = 'Oy ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = ButtonVoteClick
  end
  object ProgressBarDelphi: TProgressBar
    Left = 400
    Top = 161
    Width = 150
    Height = 17
    TabOrder = 7
  end
  object ProgressBarPython: TProgressBar
    Left = 400
    Top = 184
    Width = 150
    Height = 17
    TabOrder = 8
  end
  object ProgressBarCpp: TProgressBar
    Left = 400
    Top = 207
    Width = 150
    Height = 17
    TabOrder = 9
  end
  object ProgressBarJava: TProgressBar
    Left = 400
    Top = 230
    Width = 150
    Height = 17
    TabOrder = 10
  end
  object ProgressBarJavascript: TProgressBar
    Left = 400
    Top = 253
    Width = 150
    Height = 17
    TabOrder = 11
  end
  object ProgressBarOther: TProgressBar
    Left = 400
    Top = 276
    Width = 150
    Height = 17
    TabOrder = 12
  end
  object ButtonVoteSimulation: TButton
    Left = 124
    Top = 268
    Width = 86
    Height = 25
    Caption = 'Simule Oy Ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = ButtonVoteSimulationClick
  end
  object SpinEdit1: TSpinEdit
    Left = 81
    Top = 224
    Width = 40
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 14
    Value = 0
  end
end
