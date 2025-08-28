object FormDashboard: TFormDashboard
  Left = 0
  Top = 0
  Caption = 'FormDashboard'
  ClientHeight = 343
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object LabelWelcome: TLabel
    Left = 21
    Top = 16
    Width = 148
    Height = 21
    Caption = 'Welcome, [FullName]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 21
    Top = 57
    Width = 78
    Height = 21
    Caption = 'Username: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 21
    Top = 62
    Width = 4
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 58
    Top = 92
    Width = 41
    Height = 21
    Caption = 'Email:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 52
    Top = 124
    Width = 47
    Height = 21
    Caption = 'Phone:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 38
    Top = 162
    Width = 61
    Height = 21
    Caption = 'Birthday:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 40
    Top = 197
    Width = 59
    Height = 21
    Caption = 'Address:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 40
    Top = 232
    Width = 54
    Height = 21
    Caption = 'Gender:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ButtonAddUser: TButton
    Left = 40
    Top = 303
    Width = 75
    Height = 25
    Caption = 'Add User'
    TabOrder = 0
    Visible = False
    OnClick = ButtonAddUserClick
  end
  object ButtonLogout: TButton
    Left = 121
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Logout'
    TabOrder = 1
    OnClick = ButtonLogoutClick
  end
  object EditUsername: TDBEdit
    Left = 105
    Top = 54
    Width = 177
    Height = 23
    DataField = 'Username'
    DataSource = DataSource1
    TabOrder = 2
  end
  object EditEmail: TDBEdit
    Left = 105
    Top = 89
    Width = 177
    Height = 23
    DataField = 'Email'
    DataSource = DataSource1
    TabOrder = 3
  end
  object EditPhone: TDBEdit
    Left = 105
    Top = 124
    Width = 177
    Height = 23
    DataField = 'Phone'
    DataSource = DataSource1
    TabOrder = 4
  end
  object EditBirthday: TDBEdit
    Left = 105
    Top = 159
    Width = 177
    Height = 23
    DataField = 'BirthDate'
    DataSource = DataSource1
    TabOrder = 5
  end
  object EditAddress: TDBEdit
    Left = 105
    Top = 194
    Width = 177
    Height = 23
    DataField = 'Address'
    DataSource = DataSource1
    TabOrder = 6
  end
  object ButtonUpdate: TButton
    Left = 40
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 7
    OnClick = ButtonUpdateClick
  end
  object DBEditGender: TDBEdit
    Left = 105
    Top = 229
    Width = 177
    Height = 23
    DataField = 'Gender'
    DataSource = DataSource1
    TabOrder = 8
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = Form2.ADOConnection1
    CursorType = ctStatic
    TableName = 'Users'
    Left = 240
    Top = 264
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 240
    Top = 320
  end
end
