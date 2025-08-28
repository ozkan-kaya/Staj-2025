object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'To-Do List'
  ClientHeight = 439
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 120
    Top = 16
    Width = 84
    Height = 25
    Caption = 'To-Do List'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 51
    Width = 47
    Height = 15
    Caption = 'G'#246'revler:'
  end
  object Label3: TLabel
    Left = 8
    Top = 367
    Width = 34
    Height = 15
    Caption = 'G'#246'rev:'
  end
  object ListBox1: TListBox
    Left = 8
    Top = 72
    Width = 318
    Height = 281
    ItemHeight = 15
    TabOrder = 0
  end
  object EditTask: TEdit
    Left = 48
    Top = 364
    Width = 278
    Height = 23
    TabOrder = 1
  end
  object ButtonAdd: TButton
    Left = 8
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Ekle'
    TabOrder = 2
    OnClick = ButtonAddClick
  end
  object ButtonDelete: TButton
    Left = 89
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Sil'
    TabOrder = 3
    OnClick = ButtonDeleteClick
  end
  object ButtonClear: TButton
    Left = 170
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Temizle'
    TabOrder = 4
    OnClick = ButtonClearClick
  end
  object ButtonSave: TButton
    Left = 251
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Kaydet'
    TabOrder = 5
    OnClick = ButtonSaveClick
  end
end
