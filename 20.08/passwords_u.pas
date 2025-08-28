unit passwords_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.NetEncoding;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    EditwebsiteOrApp: TEdit;
    Label2: TLabel;
    username: TEdit;
    Label3: TLabel;
    EditPassword: TEdit;
    ButtonSave: TButton;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    ListBox1: TListBox;
    ButtonDelete: TButton;
    ButtonExport: TButton;
    ButtonImport: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonExportClick(Sender: TObject);
    procedure ButtonImportClick(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
  private
    function EncodePassword(const S: string): string;
    function DecodePassword(const S: string): string;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

// Base64 ile şifreleme
function TForm2.EncodePassword(const S: string): string;
begin
  Result := TNetEncoding.Base64.Encode(S);
end;

function TForm2.DecodePassword(const S: string): string;
begin
  Result := TNetEncoding.Base64.Decode(S);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  EditwebsiteOrApp.Clear;
  username.Clear;
  EditPassword.Clear;

  EditPassword.PasswordChar := '*';
  CheckBox1.Checked := False;
end;

procedure TForm2.ButtonSaveClick(Sender: TObject);
var
  entry: string;
begin
  if (EditwebsiteOrApp.Text <> '') and (username.Text <> '') and (EditPassword.Text <> '') then
  begin
    entry := EditwebsiteOrApp.Text + ' | ' + username.Text + ' | ' + EditPassword.Text;
    ListBox1.Items.Add(entry);
    EditwebsiteOrApp.Clear;
    username.Clear;
    EditPassword.Clear;
  end
  else
    ShowMessage('Lütfen tüm alanları doldurun.');
end;

procedure TForm2.ButtonDeleteClick(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
    ListBox1.DeleteSelected
  else
    ShowMessage('Lütfen silmek için bir kayıt seçin.');
end;

procedure TForm2.ButtonExportClick(Sender: TObject);
var
  SaveDialog: TSaveDialog;
  i: Integer;
  tempLine: string;
  parts: TArray<string>;
  encodedPass: string;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Filter := 'Text Files (*.txt)|*.txt';
    SaveDialog.DefaultExt := 'txt';
    if SaveDialog.Execute then
    begin
      with TStringList.Create do
      try
        for i := 0 to ListBox1.Items.Count - 1 do
        begin
          tempLine := ListBox1.Items[i];
          parts := tempLine.Split(['|']);
          encodedPass := EncodePassword(Trim(parts[2]));
          Add(Trim(parts[0]) + '|' + Trim(parts[1]) + '|' + encodedPass);
        end;
        SaveToFile(SaveDialog.FileName);
      finally
        Free;
      end;
      ShowMessage('Şifreler kaydedildi.');
    end;
  finally
    SaveDialog.Free;
  end;
end;

procedure TForm2.ButtonImportClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  lines: TStringList;
  i: Integer;
  parts: TArray<string>;
  decodedPass: string;
begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Filter := 'Text Files (*.txt)|*.txt';
    if OpenDialog.Execute then
    begin
      lines := TStringList.Create;
      try
        lines.LoadFromFile(OpenDialog.FileName);
        ListBox1.Items.Clear;
        for i := 0 to lines.Count - 1 do
        begin
          parts := lines[i].Split(['|']);
          if Length(parts) = 3 then
          begin
            decodedPass := DecodePassword(Trim(parts[2]));
            ListBox1.Items.Add(Trim(parts[0]) + ' | ' + Trim(parts[1]) + ' | ' + decodedPass);
          end;
        end;
      finally
        lines.Free;
      end;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TForm2.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked then
    EditPassword.PasswordChar := #0
  else
    EditPassword.PasswordChar := '*';
end;

end.
