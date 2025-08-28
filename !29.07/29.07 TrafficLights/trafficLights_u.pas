unit trafficLights_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Shape1: TShape;
    Shape2: TShape; // kirmizi
    Shape3: TShape; // sari
    Shape4: TShape; // yesil
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    currentLight: Integer;
    counter: Integer;
    procedure UpdateLights;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  currentLight := 0; //baslangic kirmizi
  counter := 3;
  UpdateLights;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Dec(counter);
  if counter = 0 then
  begin
    // isigi sirayla degistir (0 → 1 → 2 → 3 → 0 → ...)
    currentLight := (currentLight + 1) mod 4;

    case currentLight of
      0: counter := 3; // kirmizi
      1: counter := 1; // sari
      2: counter := 3; // yesil
      3: counter := 1; // sari
    end;

    UpdateLights;
  end;
end;

procedure TForm2.UpdateLights;
begin
  Shape2.Brush.Color := clBlack;
  Shape3.Brush.Color := clBlack;
  Shape4.Brush.Color := clBlack;

  case currentLight of
    0: Shape2.Brush.Color := clRed;
    1, 3: Shape3.Brush.Color := clYellow;
    2: Shape4.Brush.Color := clLime;
  end;
end;

end.

