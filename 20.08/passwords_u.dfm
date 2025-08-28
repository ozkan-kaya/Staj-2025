object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Passwords'
  ClientHeight = 441
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 113
    Height = 15
    Caption = 'Website / Uygulama: '
  end
  object Label2: TLabel
    Left = 86
    Top = 69
    Width = 59
    Height = 15
    Caption = 'Username: '
  end
  object Label3: TLabel
    Left = 116
    Top = 98
    Width = 29
    Height = 15
    Caption = 'Sifre: '
  end
  object Label4: TLabel
    Left = 32
    Top = 170
    Width = 64
    Height = 15
    Caption = 'Sifre Listesi: '
  end
  object EditwebsiteOrApp: TEdit
    Left = 151
    Top = 37
    Width = 282
    Height = 23
    TabOrder = 0
    Text = 'EditwebsiteOrApp'
  end
  object username: TEdit
    Left = 151
    Top = 66
    Width = 282
    Height = 23
    TabOrder = 1
    Text = 'Username'
  end
  object EditPassword: TEdit
    Left = 151
    Top = 95
    Width = 282
    Height = 23
    TabOrder = 2
    Text = 'Password'
  end
  object ButtonSave: TButton
    Left = 358
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Kaydet'
    TabOrder = 3
    OnClick = ButtonSaveClick
  end
  object CheckBox1: TCheckBox
    Left = 439
    Top = 98
    Width = 97
    Height = 17
    Caption = 'Sifreyi Goster'
    TabOrder = 4
    OnClick = CheckBox1Change
  end
  object ListBox1: TListBox
    Left = 32
    Top = 191
    Width = 401
    Height = 202
    ItemHeight = 15
    TabOrder = 5
  end
  object ButtonDelete: TButton
    Left = 32
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Sil'
    TabOrder = 6
    OnClick = ButtonDeleteClick
  end
  object ButtonExport: TButton
    Left = 196
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Disa Aktar'
    TabOrder = 7
    OnClick = ButtonExportClick
  end
  object ButtonImport: TButton
    Left = 115
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Ice Aktar'
    TabOrder = 8
    OnClick = ButtonImportClick
  end
end
