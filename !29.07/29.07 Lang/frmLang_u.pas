unit frmLang_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure clearInputFields;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.clearInputFields;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  clearInputFields;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  clearInputFields;
  Label1.Caption := 'Name';
  Label2.Caption := 'Surname';
  Label3.Caption := 'Age';
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Label1.Caption := 'Name';
  Label2.Caption := 'Surname';
  Label3.Caption := 'Age';
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Label1.Caption := 'Ad';
  Label2.Caption := 'Soyad';
  Label3.Caption := 'Yas';
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Label1.Caption := 'Nombre';
  Label2.Caption := 'Apellido';
  Label3.Caption := 'Edad';
end;

end.
