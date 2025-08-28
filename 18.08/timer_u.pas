unit timer_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    LabelTime: TLabel;
    ButtonStartPause: TButton;
    ButtonLap: TButton;
    ButtonReset: TButton;
    Label1: TLabel;
    ListBoxLaps: TListBox;
    Label2: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ButtonStartPauseClick(Sender: TObject);
    procedure ButtonLapClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FRunning: Boolean;
    FBaseTicks: UInt64;
    FAccumulated: UInt64;
    function GetElapsedMs: UInt64;
    procedure UpdateTimeLabel(const AMS: UInt64);
    procedure ToggleStartPause;
    procedure AddLap;
    procedure ResetAll;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  FRunning := False;
  FBaseTicks := 0;
  FAccumulated := 0;
  LabelTime.Caption := '00:00.00';

  Self.KeyPreview := True;
end;

function TForm2.GetElapsedMs: UInt64;
begin
  if FRunning then
    Result := FAccumulated + (GetTickCount64 - FBaseTicks)
  else
    Result := FAccumulated;
end;

procedure TForm2.UpdateTimeLabel(const AMS: UInt64);
var
  totalCentis, mm, ss, cs: UInt64;
begin
  totalCentis := AMS div 10;
  mm := (totalCentis div 6000);
  ss := (totalCentis div 100) mod 60;
  cs := totalCentis mod 100;
  LabelTime.Caption := Format('%.2d:%.2d.%.2d', [mm, ss, cs]);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  UpdateTimeLabel(GetElapsedMs);
end;

procedure TForm2.ToggleStartPause;
begin
  if not FRunning then
  begin
    FBaseTicks := GetTickCount64;
    FRunning := True;
    Timer1.Enabled := True;
    ButtonStartPause.Caption := 'Durdur';
  end
  else
  begin
    FAccumulated := GetElapsedMs;
    FRunning := False;
    Timer1.Enabled := False;
    ButtonStartPause.Caption := 'Başlat';
    UpdateTimeLabel(FAccumulated);
  end;
end;

procedure TForm2.AddLap;
var
  lapText: string;
begin
  lapText := Format('%d) %s', [ListBoxLaps.Count + 1, LabelTime.Caption]);
  ListBoxLaps.Items.Add(lapText);
  ListBoxLaps.ItemIndex := ListBoxLaps.Count - 1;
end;

procedure TForm2.ResetAll;
begin
  FRunning := False;
  Timer1.Enabled := False;
  FAccumulated := 0;
  FBaseTicks := 0;
  LabelTime.Caption := '00:00.00';
  ButtonStartPause.Caption := 'Başlat';
  ListBoxLaps.Clear;
end;

procedure TForm2.ButtonStartPauseClick(Sender: TObject);
begin
  ToggleStartPause;
end;

procedure TForm2.ButtonLapClick(Sender: TObject);
begin
  AddLap;
end;

procedure TForm2.ButtonResetClick(Sender: TObject);
begin
  ResetAll;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
  begin
    ToggleStartPause;
    Key := 0;
  end;

  if (Key = Ord('L')) or (Key = Ord('l')) then
  begin
    AddLap;
    Key := 0;
  end;

  if (Key = Ord('R')) or (Key = Ord('r')) then
  begin
    ResetAll;
    Key := 0;
  end;
end;

end.
