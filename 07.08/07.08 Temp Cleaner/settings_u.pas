unit settings_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst;

type
  TSettingsForm = class(TForm)
    CheckListBox1: TCheckListBox;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    //
  public
    SelectedFolders: array[0..3] of Boolean;
  end;

var
  SettingsForm: TSettingsForm;
implementation

{$R *.dfm}


procedure TSettingsForm.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 3 do
    SelectedFolders[i] := CheckListBox1.Checked[i];

  Self.Hide;
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  CheckListBox1.Items.Clear;
  CheckListBox1.Items.Add('User Temp');
  CheckListBox1.Items.Add('Windows Temp');
  CheckListBox1.Items.Add('System Temp');
  CheckListBox1.Items.Add('Update Files');

  CheckListBox1.Checked[0] := True;
  CheckListBox1.Checked[1] := True;
  CheckListBox1.Checked[2] := True;
  CheckListBox1.Checked[3] := True;

    for i := 0 to 3 do
    SelectedFolders[i] := CheckListBox1.Checked[i];

  Self.Hide;
end;

end.
