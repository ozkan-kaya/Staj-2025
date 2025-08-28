object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SettingsForm'
  ClientHeight = 161
  ClientWidth = 134
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 120
    Height = 30
    Alignment = taCenter
    Caption = 'Which files would you '#13#10'like to clean?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object CheckListBox1: TCheckListBox
    Left = 5
    Top = 44
    Width = 121
    Height = 73
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 17
    Items.Strings = (
      '.'
      '.'
      '.'
      '.')
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 5
    Top = 123
    Width = 121
    Height = 30
    Caption = 'Save'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
end
