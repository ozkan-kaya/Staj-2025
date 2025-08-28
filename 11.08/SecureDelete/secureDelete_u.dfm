object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Secure Delete'
  ClientHeight = 441
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object Label1: TLabel
    Left = 193
    Top = 16
    Width = 169
    Height = 27
    Caption = 'Secure Delete'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'JetBrains Mono'
    Font.Style = []
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 68
    Width = 391
    Height = 135
    ItemHeight = 15
    TabOrder = 0
  end
  object addFileButton: TButton
    Left = 413
    Top = 68
    Width = 132
    Height = 41
    Caption = 'Add File(s)'
    TabOrder = 1
    OnClick = addFileButtonClick
  end
  object clearListButton: TButton
    Left = 413
    Top = 115
    Width = 132
    Height = 41
    Caption = 'Clear List'
    TabOrder = 2
    OnClick = clearListButtonClick
  end
  object secureDeleteButton: TButton
    Left = 413
    Top = 162
    Width = 132
    Height = 41
    Caption = 'Secure Delete'
    TabOrder = 3
    OnClick = secureDeleteButtonClick
  end
  object Log: TMemo
    Left = 8
    Top = 248
    Width = 537
    Height = 185
    Lines.Strings = (
      'Log')
    TabOrder = 4
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 217
    Width = 537
    Height = 17
    TabOrder = 5
  end
end
