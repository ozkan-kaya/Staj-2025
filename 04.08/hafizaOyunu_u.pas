unit hafizaOyunu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    LabelStatus: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure CardClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    Cards: array[1..8] of string;
    FirstIndex, SecondIndex: Integer;
    Buttons: array[1..8] of TButton;
    MatchedCards: array[1..8] of Boolean;
    IsChecking: Boolean;
    procedure ShuffleCards;
    procedure CheckCards;
    function IsGameComplete: Boolean;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Buttons[1] := Button1; Buttons[2] := Button2; Buttons[3] := Button3; Buttons[4] := Button4;
  Buttons[5] := Button5; Buttons[6] := Button6; Buttons[7] := Button7; Buttons[8] := Button8;

  for i := 1 to 8 do
  begin
    Buttons[i].Tag := i;
    Buttons[i].Caption := '?';
    Buttons[i].OnClick := CardClick;
    MatchedCards[i] := False;
  end;

  ShuffleCards;
  FirstIndex := 0;
  SecondIndex := 0;
  IsChecking := False;
  LabelStatus.Caption := 'Durum: Oyun başladı';

  Timer1.Enabled := False;
  Timer1.Interval := 1000;
end;

procedure TForm2.ShuffleCards;
var
  TempCards: array[1..8] of string;
  i, j: Integer;
  tmp: string;
begin
  TempCards[1] := 'A'; TempCards[2] := 'A';
  TempCards[3] := 'B'; TempCards[4] := 'B';
  TempCards[5] := 'C'; TempCards[6] := 'C';
  TempCards[7] := 'D'; TempCards[8] := 'D';

  Randomize;
  for i := 1 to 8 do
    Cards[i] := TempCards[i];

  for i := 8 downto 2 do
  begin
    j := Random(i) + 1;
    tmp := Cards[i];
    Cards[i] := Cards[j];
    Cards[j] := tmp;
  end;
end;

procedure TForm2.CardClick(Sender: TObject);
var
  BtnIndex: Integer;
begin
  BtnIndex := (Sender as TButton).Tag;

  if (BtnIndex < 1) or (BtnIndex > 8) then Exit;

  if IsChecking then Exit;

  if (Buttons[BtnIndex].Caption <> '?') or MatchedCards[BtnIndex] then Exit;

  Buttons[BtnIndex].Caption := Cards[BtnIndex];

  if FirstIndex = 0 then
  begin
    FirstIndex := BtnIndex;
    LabelStatus.Caption := 'Durum: İkinci kartı seçin';
  end
  else if SecondIndex = 0 then
  begin
    SecondIndex := BtnIndex;
    IsChecking := True;
    LabelStatus.Caption := 'Durum: Kontrol ediliyor...';

    Timer1.Enabled := True;
  end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  CheckCards;
end;

procedure TForm2.CheckCards;
begin
  if Cards[FirstIndex] = Cards[SecondIndex] then
  begin
    MatchedCards[FirstIndex] := True;
    MatchedCards[SecondIndex] := True;
    LabelStatus.Caption := 'Durum: Eşleşme bulundu!';

    if IsGameComplete then
    begin
      LabelStatus.Caption := 'Durum: Tebrikler! Oyunu tamamladınız!';
    end;
  end
  else
  begin
    Buttons[FirstIndex].Caption := '?';
    Buttons[SecondIndex].Caption := '?';
    LabelStatus.Caption := 'Durum: Eşleşme yok! Tekrar deneyin';
  end;

  FirstIndex := 0;
  SecondIndex := 0;
  IsChecking := False;
end;

function TForm2.IsGameComplete: Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 1 to 8 do
  begin
    if not MatchedCards[i] then
    begin
      Result := False;
      Break;
    end;
  end;
end;

end.
