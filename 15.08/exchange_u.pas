unit exchange_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    EditAmount: TEdit;
    ComboFrom: TComboBox;
    ComboTo: TComboBox;
    Label2: TLabel;
    ConvertButton: TButton;
    SwapButton: TButton;
    Label3: TLabel;
    LabelResult: TLabel;
    LabelRateValue: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ConvertButtonClick(Sender: TObject);
    procedure SwapButtonClick(Sender: TObject);
  private
    function GetRate(const FromCurr, ToCurr: string): Double;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  ComboFrom.Items.Clear;
  ComboTo.Items.Clear;

  ComboFrom.Items.Add('USD');
  ComboFrom.Items.Add('EUR');
  ComboFrom.Items.Add('GBP');
  ComboFrom.Items.Add('TRY');

  ComboTo.Items.Add('USD');
  ComboTo.Items.Add('EUR');
  ComboTo.Items.Add('GBP');
  ComboTo.Items.Add('TRY');

  if ComboFrom.Items.Count > 0 then ComboFrom.ItemIndex := 0;
  if ComboTo.Items.Count > 1 then ComboTo.ItemIndex := 1;

  LabelResult.Caption := '';
  LabelRateValue.Caption := '';

  EditAmount.Clear;
end;

function TForm2.GetRate(const FromCurr, ToCurr: string): Double;
var
  RateUSD, RateEUR, RateGBP: Double;
begin
  // Güncel sabit kurlar
  RateUSD := 41.01;  // 1 USD = 41.01 TRY
  RateEUR := 47.98;  // 1 EUR = 47.98 TRY
  RateGBP := 55.15;  // 1 GBP = 55.15 TRY

  if SameText(FromCurr, ToCurr) then
  begin
    Result := 1.0;
    Exit;
  end;

  if SameText(FromCurr, 'TRY') then
  begin
    if SameText(ToCurr, 'USD') then Result := 1 / RateUSD
    else if SameText(ToCurr, 'EUR') then Result := 1 / RateEUR
    else if SameText(ToCurr, 'GBP') then Result := 1 / RateGBP
    else Result := 1.0;
    Exit;
  end;

  if SameText(ToCurr, 'TRY') then
  begin
    if SameText(FromCurr, 'USD') then Result := RateUSD
    else if SameText(FromCurr, 'EUR') then Result := RateEUR
    else if SameText(FromCurr, 'GBP') then Result := RateGBP
    else Result := 1.0;
    Exit;
  end;

  var FromToTRY := 1.0;
  var ToToTRY := 1.0;

  if SameText(FromCurr, 'USD') then FromToTRY := RateUSD
  else if SameText(FromCurr, 'EUR') then FromToTRY := RateEUR
  else if SameText(FromCurr, 'GBP') then FromToTRY := RateGBP;

  if SameText(ToCurr, 'USD') then ToToTRY := RateUSD
  else if SameText(ToCurr, 'EUR') then ToToTRY := RateEUR
  else if SameText(ToCurr, 'GBP') then ToToTRY := RateGBP;

  if (ToToTRY = 0) then Result := 1.0
  else Result := FromToTRY / ToToTRY;
end;

procedure TForm2.ConvertButtonClick(Sender: TObject);
var
  Amount, Rate, ResValue: Double;
  FromCurr, ToCurr: string;
begin
  if Trim(EditAmount.Text) = '' then
  begin
    ShowMessage('Lütfen bir miktar giriniz.');
    EditAmount.SetFocus;
    Exit;
  end;

  if not TryStrToFloat(StringReplace(EditAmount.Text, ',', FormatSettings.DecimalSeparator, []), Amount) then
  begin
    if not TryStrToFloat(StringReplace(EditAmount.Text, '.', FormatSettings.DecimalSeparator, []), Amount) then
    begin
      ShowMessage('Geçerli bir sayı girin (ör: 100).');
      EditAmount.SetFocus;
      Exit;
    end;
  end;

  FromCurr := ComboFrom.Text;
  ToCurr := ComboTo.Text;

  if (FromCurr = '') or (ToCurr = '') then
  begin
    ShowMessage('Lütfen dövizleri seçin.');
    Exit;
  end;

  Rate := GetRate(FromCurr, ToCurr);
  ResValue := Amount * Rate;

  LabelResult.Caption := FormatFloat('#,##0.00', ResValue) + ' ' + ToCurr;
  LabelRateValue.Caption := '1 ' + FromCurr + ' = ' + FormatFloat('#,##0.0000', Rate) + ' ' + ToCurr;
end;

procedure TForm2.SwapButtonClick(Sender: TObject);
var
  idx: Integer;
begin
  if (ComboFrom.ItemIndex < 0) or (ComboTo.ItemIndex < 0) then Exit;

  idx := ComboFrom.ItemIndex;
  ComboFrom.ItemIndex := ComboTo.ItemIndex;
  ComboTo.ItemIndex := idx;
  LabelResult.Caption := '';
  LabelRateValue.Caption := '';
end;

end.

