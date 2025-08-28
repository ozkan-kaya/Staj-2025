unit frmBallGame_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    btnUp: TButton;
    btnDown: TButton;
    Shape1: TShape;
    BitBtnClose: TBitBtn;
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnDownClick(Sender: TObject);
begin
  Shape1.Top := 237;
  btnDown.Enabled := False;
  btnUp.Enabled := True;
end;

procedure TForm2.btnUpClick(Sender: TObject);
begin
  Shape1.Top := 49;
  btnDown.Enabled := True;
  btnUp.Enabled := False;
end;

end.
