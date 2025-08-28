object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Database Connector'
  ClientHeight = 558
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel2: TPanel
    Left = 8
    Top = 9
    Width = 681
    Height = 369
    TabOrder = 0
    object Label1: TLabel
      Left = 55
      Top = 28
      Width = 99
      Height = 25
      Caption = 'Student ID'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 55
      Top = 84
      Width = 95
      Height = 25
      Caption = 'Firstname'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 55
      Top = 140
      Width = 85
      Height = 25
      Caption = 'Surname'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 55
      Top = 196
      Width = 77
      Height = 25
      Caption = 'Address'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 55
      Top = 252
      Width = 67
      Height = 25
      Caption = 'Gender'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 55
      Top = 308
      Width = 75
      Height = 25
      Caption = 'Number'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit2: TDBEdit
      Left = 168
      Top = 80
      Width = 459
      Height = 35
      DataField = 'FirstName'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'JetBrains Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 168
      Top = 136
      Width = 459
      Height = 35
      DataField = 'Surname'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'JetBrains Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 168
      Top = 192
      Width = 459
      Height = 35
      DataField = 'SAddress'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'JetBrains Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 168
      Top = 248
      Width = 459
      Height = 35
      DataField = 'Gender'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'JetBrains Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 168
      Top = 304
      Width = 459
      Height = 35
      DataField = 'PNumber'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'JetBrains Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit1: TDBEdit
      Left = 168
      Top = 24
      Width = 459
      Height = 35
      DataField = 'StudentID'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'JetBrains Mono'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel4: TPanel
    Left = 8
    Top = 383
    Width = 768
    Height = 170
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 766
      Height = 168
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'StudentID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FirstName'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Surname'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SAddress'
          Width = 260
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Gender'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PNumber'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 695
    Top = 8
    Width = 82
    Height = 369
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 80
      Height = 367
      DataSource = DataSource1
      Align = alClient
      Kind = dbnVertical
      TabOrder = 0
    end
  end
  object DBConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=reallyStrongPwd123;Persist Security' +
      ' Info=True;User ID=SA;Initial Catalog=test;Data Source=192.168.0' +
      '.119,1433'
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 15
  end
  object ADOTable1: TADOTable
    Connection = DBConnection
    CursorType = ctStatic
    TableName = 'Students'
    Left = 8
    Top = 71
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 8
    Top = 135
  end
end
