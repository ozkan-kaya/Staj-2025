unit operations_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    num1 : Integer;
    num2 : Integer;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  num1 := StrToInt(Edit1.Text);
  num2 := StrToInt(Edit2.Text);

  case RadioGroup1.ItemIndex of
    0: Label4.Caption := IntToStr(num1 + num2);
    1: Label4.Caption := IntToStr(num1 - num2);
    2: Label4.Caption := IntToStr(num1 * num2);
    3:
      if num2 <> 0 then
        Label4.Caption := FloatToStr(num1 / num2)
      else
        Label4.Caption := 'Error: Divided by 0';
  else
    Label4.Caption := 'Select an operation';
  end;
end;

end.
