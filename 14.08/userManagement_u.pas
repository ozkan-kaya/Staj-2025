unit userManagement_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Data.Win.ADODB, Data.DB,
  userDashboard_u;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    LabelPassword: TLabel;
    EditName: TEdit;
    EditPassword: TEdit;
    ButtonLogin: TButton;
    ADOConnection1: TADOConnection;
    procedure ButtonLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure DoLogin;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.ButtonLoginClick(Sender: TObject);
begin
  DoLogin;
end;

procedure TForm2.DoLogin;
var
  qry: TADOQuery;
begin
  qry := TADOQuery.Create(nil);
  try
    qry.Connection := ADOConnection1;
    qry.SQL.Text := 'SELECT * FROM Users WHERE Username = :u AND Password = :p';
    qry.Parameters.ParamByName('u').Value := EditName.Text;
    qry.Parameters.ParamByName('p').Value := EditPassword.Text;
    qry.Open;

    if not qry.IsEmpty then
    begin
      FormDashboard.ADOTable1.Connection := ADOConnection1;
      FormDashboard.ADOTable1.TableName := 'Users';
      FormDashboard.ADOTable1.Filter := 'Username = ''' + qry.FieldByName('Username').AsString + '''';
      FormDashboard.ADOTable1.Filtered := True;
      FormDashboard.ADOTable1.Active := True;
      FormDashboard.LabelWelcome.Caption := 'Welcome, ' + qry.FieldByName('FullName').AsString;
      FormDashboard.ButtonAddUser.Visible := qry.FieldByName('IsAdmin').AsBoolean;

      FormDashboard.Show;
      Self.Hide;
    end
    else
    begin
      ShowMessage('Kullanıcı adı veya şifre yanlış!');
      EditPassword.Clear;
    end;
  finally
    qry.Free;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  EditName.Clear;
  EditPassword.Clear;
end;

end.

