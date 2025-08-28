unit pomodoroTimer_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    LabelWorkTime: TLabel;
    Label2: TLabel;
    LabelRestTime: TLabel;
    ButtonStart: TButton;
    ButtonReset: TButton;
    Label4: TLabel;
    LabelTimeLeft: TLabel;
    Label6: TLabel;
    LabelStatus: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FWorkSeconds: Integer;
    FBreakSeconds: Integer;
    FLongBreakSeconds: Integer;
    FRemaining: Integer;
    FIsWork: Boolean;
    FWorkCount: Integer;
    procedure UpdateLabels;
    procedure StartWork;
    procedure StartBreak;
    procedure StartLongBreak;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  LabelWorkTime.Caption := '25';
  LabelRestTime.Caption := '5';
  LabelTimeLeft.Caption := '00:00';
  LabelStatus.Caption := 'Hazır';

  FWorkSeconds := StrToIntDef(LabelWorkTime.Caption, 25) * 60;
  FBreakSeconds := StrToIntDef(LabelRestTime.Caption, 5) * 60;
  FLongBreakSeconds := 15 * 60;
  FIsWork := True;
  FWorkCount := 0;

  Timer1.Enabled := False;
end;

procedure TForm2.UpdateLabels;
var
  minutes, seconds: Integer;
begin
  minutes := FRemaining div 60;
  seconds := FRemaining mod 60;
  LabelTimeLeft.Caption := Format('%.2d:%.2d', [minutes, seconds]);
  if FIsWork then
    LabelStatus.Caption := 'Çalışıyor'
  else
  begin
    if FWorkCount mod 4 = 0 then
      LabelStatus.Caption := 'Uzun Mola'
    else
      LabelStatus.Caption := 'Mola';
  end;
end;

procedure TForm2.StartWork;
begin
  FRemaining := FWorkSeconds;
  FIsWork := True;
  UpdateLabels;
  Timer1.Enabled := True;
end;

procedure TForm2.StartBreak;
begin
  FWorkCount := FWorkCount + 1;
  if FWorkCount mod 4 = 0 then
    StartLongBreak
  else
  begin
    FRemaining := FBreakSeconds;
    FIsWork := False;
    UpdateLabels;
    Timer1.Enabled := True;
  end;
end;

procedure TForm2.StartLongBreak;
begin
  FRemaining := FLongBreakSeconds;
  FIsWork := False;
  UpdateLabels;
  Timer1.Enabled := True;
end;

procedure TForm2.ButtonStartClick(Sender: TObject);
begin
  if not Timer1.Enabled then
    StartWork;
end;

procedure TForm2.ButtonResetClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  FIsWork := True;
  FRemaining := 0;
  FWorkCount := 0;
  LabelTimeLeft.Caption := '00:00';
  LabelStatus.Caption := 'Hazır';
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Dec(FRemaining);
  UpdateLabels;

  if FRemaining <= 0 then
  begin
    if FIsWork then
      StartBreak
    else
      StartWork;
  end;
end;

end.
