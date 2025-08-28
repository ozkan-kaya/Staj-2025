unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    EditName: TEdit;
    Label2: TLabel;
    EditSurname: TEdit;
    Label3: TLabel;
    EditAge: TEdit;
    Label4: TLabel;
    Number: TEdit;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  cinsiyet, abone: string;
begin
  Memo1.Clear;

  if RadioButton1.Checked then
    cinsiyet := 'Erkek'
  else if RadioButton2.Checked then
    cinsiyet := 'Kadın'
  else
    cinsiyet := 'Belirtilmemiş';

  if Number.Text = '1' then
    abone := 'Evet'
  else
    abone := 'Hayır';

  Memo1.Lines.Add('Ad: ' + EditName.Text);
  Memo1.Lines.Add('Soyad: ' + EditSurname.Text);
  Memo1.Lines.Add('Yaş: ' + EditAge.Text);
  Memo1.Lines.Add('Cinsiyet: ' + cinsiyet);
  Memo1.Lines.Add('Abone: ' + abone);
end;

end.

