unit userDashboard_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Data.Win.ADODB, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TFormDashboard = class(TForm)
    LabelWelcome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ButtonAddUser: TButton;
    ButtonLogout: TButton;
    ButtonUpdate: TButton;
    EditUsername: TDBEdit;
    EditEmail: TDBEdit;
    EditPhone: TDBEdit;
    EditBirthday: TDBEdit;
    EditAddress: TDBEdit;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label7: TLabel;
    DBEditGender: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure ButtonLogoutClick(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonAddUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDashboard: TFormDashboard;

implementation

{$R *.dfm}

uses userManagement_u;

procedure TFormDashboard.FormCreate(Sender: TObject);
begin
  ButtonAddUser.Visible := False;
  DataSource1.DataSet := ADOTable1;
end;

procedure TFormDashboard.ButtonLogoutClick(Sender: TObject);
begin
  Self.Hide;
  Form2.Show;
  Form2.EditPassword.Clear;
end;

procedure TFormDashboard.ButtonUpdateClick(Sender: TObject);
begin
  if ADOTable1.State in [dsEdit, dsInsert] then
    ADOTable1.Post;
  ShowMessage('Bilgiler güncellendi.');
end;

procedure TFormDashboard.ButtonAddUserClick(Sender: TObject);
var
  qry: TADOQuery;
  newUsername, newPassword, newFullName, newEmail, newPhone, newAddress, newGender: string;
begin
  newUsername := InputBox('Yeni Kullanıcı', 'Kullanıcı Adı:', '');
  if newUsername = '' then Exit;

  newPassword := InputBox('Yeni Kullanıcı', 'Şifre:', '');
  if newPassword = '' then Exit;

  newFullName := InputBox('Yeni Kullanıcı', 'Ad Soyad:', '');
  newEmail    := InputBox('Yeni Kullanıcı', 'Email:', '');
  newPhone    := InputBox('Yeni Kullanıcı', 'Telefon:', '');
  newAddress  := InputBox('Yeni Kullanıcı', 'Adres:', '');

  newGender := InputBox('Yeni Kullanıcı', 'Cinsiyet (Male/Female):', '');
  if (newGender <> 'Male') and (newGender <> 'Female') then
  begin
    ShowMessage('Cinsiyet Male veya Female olmalıdır!');
    Exit;
  end;

  qry := TADOQuery.Create(nil);
  try
    qry.Connection := ADOTable1.Connection;
    qry.SQL.Text := 'INSERT INTO Users (Username, Password, FullName, Email, Phone, Address, Gender, IsAdmin) ' +
                    'VALUES (:Username, :Password, :FullName, :Email, :Phone, :Address, :Gender, 0)';

    qry.Parameters.ParamByName('Username').Value := newUsername;
    qry.Parameters.ParamByName('Password').Value := newPassword;
    qry.Parameters.ParamByName('FullName').Value := newFullName;
    qry.Parameters.ParamByName('Email').Value := newEmail;
    qry.Parameters.ParamByName('Phone').Value := newPhone;
    qry.Parameters.ParamByName('Address').Value := newAddress;
    qry.Parameters.ParamByName('Gender').Value := newGender;

    qry.ExecSQL;
    ShowMessage('Yeni kullanıcı başarıyla eklendi.');

    ADOTable1.Close;
    ADOTable1.Open;

  finally
    qry.Free;
  end;
end;

end.

