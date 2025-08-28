unit calculator_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    ButtonAC: TButton;
    ButtonNegative: TButton;
    ButtonMod: TButton;
    ButtonDivide: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ButtonMultiply: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ButtonSubtract: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ButtonPlus: TButton;
    ButtonNull: TButton;
    Button0: TButton;
    ButtonPoint: TButton;
    ButtonEquality: TButton;
    procedure FormActivate(Sender: TObject);
    procedure ButtonACClick(Sender: TObject);
    procedure ButtonNegativeClick(Sender: TObject);
    procedure ButtonPointClick(Sender: TObject);
    procedure ButtonEqualityClick(Sender: TObject);
    procedure ButtonPlusClick(Sender: TObject);
    procedure ButtonSubtractClick(Sender: TObject);
    procedure ButtonMultiplyClick(Sender: TObject);
    procedure ButtonDivideClick(Sender: TObject);
    procedure ButtonModClick(Sender: TObject);
    procedure Button0Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    procedure ClearAll;
    procedure AppendToDisplay(const Value: string);
    procedure NumberButtonClick(const Number: string);
    procedure SetOperator(const Op: string);
    function PerformCalculation(Num1, Num2: Double; const Op: string): Double;
  public
  end;

var
  Form2: TForm2;
  FirstNumber: Double = 0;
  SecondNumber: Double = 0;
  Operator: string = '';
  NewInput: Boolean = True;
  LastPressedEquals: Boolean = False;

implementation

{$R *.dfm}

procedure TForm2.ClearAll;
begin
  Edit1.Text := '0';
  FirstNumber := 0;
  SecondNumber := 0;
  Operator := '';
  NewInput := True;
  LastPressedEquals := False;
end;

procedure TForm2.AppendToDisplay(const Value: string);
begin
  if (Edit1.Text = '0') or NewInput then
    Edit1.Text := Value
  else
    Edit1.Text := Edit1.Text + Value;

  NewInput := False;
  LastPressedEquals := False;
end;

procedure TForm2.NumberButtonClick(const Number: string);
begin
  AppendToDisplay(Number);
end;

function TForm2.PerformCalculation(Num1, Num2: Double; const Op: string): Double;
begin
  if Op = '+' then
    Result := Num1 + Num2
  else if Op = '-' then
    Result := Num1 - Num2
  else if Op = '*' then
    Result := Num1 * Num2
  else if Op = '/' then
  begin
    if Num2 = 0 then
      raise Exception.Create('Divide by zero');
    Result := Num1 / Num2;
  end
  else if Op = 'mod' then
  begin
    if Num2 = 0 then
      raise Exception.Create('Mod by zero');
    Result := Trunc(Num1) mod Trunc(Num2);
  end
  else
    Result := Num1;
end;

procedure TForm2.SetOperator(const Op: string);
begin
  if (Operator <> '') and not NewInput and not LastPressedEquals then
  begin
    SecondNumber := StrToFloatDef(Edit1.Text, 0);
    FirstNumber := PerformCalculation(FirstNumber, SecondNumber, Operator);
    Edit1.Text := FloatToStr(FirstNumber);
  end
  else
    FirstNumber := StrToFloatDef(Edit1.Text, 0);

  Operator := Op;
  NewInput := True;
  LastPressedEquals := False;
end;

procedure TForm2.ButtonEqualityClick(Sender: TObject);
var
  InputNumber: Double;
  Result: Double;
begin
  if Operator = '' then Exit;

  try
    if not LastPressedEquals then
      SecondNumber := StrToFloatDef(Edit1.Text, 0);

    Result := PerformCalculation(FirstNumber, SecondNumber, Operator);
    Edit1.Text := FloatToStr(Result);
    FirstNumber := Result;
    NewInput := True;
    LastPressedEquals := True;
  except
    on E: Exception do
    begin
      Edit1.Text := 'Undefined';
      ClearAll;
    end;
  end;
end;

procedure TForm2.ButtonACClick(Sender: TObject);
begin
  ClearAll;
end;

procedure TForm2.ButtonNegativeClick(Sender: TObject);
var
  Num: Double;
begin
  if TryStrToFloat(Edit1.Text, Num) then
  begin
    Num := -Num;
    Edit1.Text := FloatToStr(Num);
    NewInput := False;
    LastPressedEquals := False;
  end;
end;

procedure TForm2.ButtonPointClick(Sender: TObject);
begin
  if NewInput then
    Edit1.Text := '0.';

  if Pos('.', Edit1.Text) = 0 then
    Edit1.Text := Edit1.Text + '.';

  NewInput := False;
  LastPressedEquals := False;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  ClearAll;
end;

procedure TForm2.ButtonPlusClick(Sender: TObject); begin SetOperator('+'); end;
procedure TForm2.ButtonSubtractClick(Sender: TObject); begin SetOperator('-'); end;
procedure TForm2.ButtonMultiplyClick(Sender: TObject); begin SetOperator('*'); end;
procedure TForm2.ButtonDivideClick(Sender: TObject); begin SetOperator('/'); end;
procedure TForm2.ButtonModClick(Sender: TObject); begin SetOperator('mod'); end;

procedure TForm2.Button0Click(Sender: TObject); begin NumberButtonClick('0'); end;
procedure TForm2.Button1Click(Sender: TObject); begin NumberButtonClick('1'); end;
procedure TForm2.Button2Click(Sender: TObject); begin NumberButtonClick('2'); end;
procedure TForm2.Button3Click(Sender: TObject); begin NumberButtonClick('3'); end;
procedure TForm2.Button4Click(Sender: TObject); begin NumberButtonClick('4'); end;
procedure TForm2.Button5Click(Sender: TObject); begin NumberButtonClick('5'); end;
procedure TForm2.Button6Click(Sender: TObject); begin NumberButtonClick('6'); end;
procedure TForm2.Button7Click(Sender: TObject); begin NumberButtonClick('7'); end;
procedure TForm2.Button8Click(Sender: TObject); begin NumberButtonClick('8'); end;
procedure TForm2.Button9Click(Sender: TObject); begin NumberButtonClick('9'); end;

end.
