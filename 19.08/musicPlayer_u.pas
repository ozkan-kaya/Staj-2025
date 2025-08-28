unit musicPlayer_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, MPlayer, MMSystem;

type
  TForm2 = class(TForm)
    ButtonOpen: TButton;
    ButtonPlay: TButton;
    ButtonPause: TButton;
    ButtonStop: TButton;
    LabelPlayingFile: TLabel;
    LabelTime: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    MediaPlayer1: TMediaPlayer;
    procedure ButtonOpenClick(Sender: TObject);
    procedure ButtonPlayClick(Sender: TObject);
    procedure ButtonPauseClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function FormatTime(Milliseconds: Integer): string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  LabelPlayingFile.Caption := 'Henüz dosya seçilmedi';
  ProgressBar1.Position := 0;

  MediaPlayer1.Visible := False;
  MediaPlayer1.Display := nil;

  OpenDialog1.Filter := 'WAV Dosyaları|*.wav|Tüm Dosyalar|*.*';
  OpenDialog1.Title := 'Müzik Dosyası Seç';
end;

procedure TForm2.ButtonOpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    try
      if MediaPlayer1.Mode <> mpNotReady then
      begin
        MediaPlayer1.Close;
      end;

      if not FileExists(OpenDialog1.FileName) then
      begin
        ShowMessage('Dosya bulunamadı!');
        Exit;
      end;

      if LowerCase(ExtractFileExt(OpenDialog1.FileName)) = '.mp3' then
      begin
        ShowMessage('MP3 dosyaları desteklenmiyor!');
        Exit;
      end;

      MediaPlayer1.FileName := OpenDialog1.FileName;
      MediaPlayer1.DeviceType := dtWaveAudio;

      try
        MediaPlayer1.Open;
      except
        try
          MediaPlayer1.Close;
          MediaPlayer1.DeviceType := dtAutoSelect;
          MediaPlayer1.Open;
        except
          ShowMessage('Dosya açılamadı!');
          Exit;
        end;
      end;

      LabelPlayingFile.Caption := ExtractFileName(OpenDialog1.FileName);

      ProgressBar1.Position := 0;
      ProgressBar1.Min := 0;
      ProgressBar1.Max := 100;
      ButtonPlay.Enabled := True;
      ButtonPause.Enabled := False;
      ButtonStop.Enabled := True;

      if MediaPlayer1.Length > 0 then
        LabelTime.Caption := '00:00 / ' + FormatTime(MediaPlayer1.Length)
      else
        LabelTime.Caption := '00:00 / 00:00';

    except
      on E: Exception do
      begin
        ShowMessage('Hata: ' + E.Message);
        LabelPlayingFile.Caption := 'Dosya açılamadı';
      end;
    end;
  end;
end;

procedure TForm2.ButtonPlayClick(Sender: TObject);
begin
  if MediaPlayer1.Mode = mpNotReady then
  begin
    ShowMessage('Önce dosya seçin!');
    Exit;
  end;

  MediaPlayer1.Play;
  Timer1.Enabled := True;

  ButtonPlay.Enabled := False;
  ButtonPause.Enabled := True;
  ButtonStop.Enabled := True;
end;

procedure TForm2.ButtonPauseClick(Sender: TObject);
begin
  if MediaPlayer1.Mode = mpPlaying then
  begin
    MediaPlayer1.Pause;
    Timer1.Enabled := False;

    ButtonPlay.Enabled := True;
    ButtonPause.Enabled := False;
  end;
end;

procedure TForm2.ButtonStopClick(Sender: TObject);
begin
  MediaPlayer1.Stop;
  Timer1.Enabled := False;

  MediaPlayer1.Position := 0;
  ProgressBar1.Position := 0;

  ButtonPlay.Enabled := True;
  ButtonPause.Enabled := False;

  if MediaPlayer1.Length > 0 then
    LabelTime.Caption := '00:00 / ' + FormatTime(MediaPlayer1.Length)
  else
    LabelTime.Caption := '00:00 / 00:00';
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var
  CurrentPos, TotalLength: Integer;
  ProgressPercent: Integer;
begin
  if (MediaPlayer1.Mode = mpPlaying) then
  begin
    CurrentPos := MediaPlayer1.Position;
    TotalLength := MediaPlayer1.Length;

    if TotalLength > 0 then
    begin
      ProgressPercent := Round((CurrentPos * 100.0) / TotalLength);

      if ProgressPercent <= 100 then
        ProgressBar1.Position := ProgressPercent
      else
        ProgressBar1.Position := 100;

      LabelTime.Caption := FormatTime(CurrentPos) + ' / ' + FormatTime(TotalLength);

      if CurrentPos >= TotalLength then
      begin
        ProgressBar1.Position := 100;
        LabelTime.Caption := FormatTime(TotalLength) + ' / ' + FormatTime(TotalLength);
        ButtonStopClick(Self);
      end;
    end;
  end;
end;

function TForm2.FormatTime(Milliseconds: Integer): string;
var
  TotalSeconds, Minutes, Seconds: Integer;
begin
  TotalSeconds := Milliseconds div 1000;
  Minutes := TotalSeconds div 60;
  Seconds := TotalSeconds mod 60;

  if Minutes < 10 then
    Result := '0' + IntToStr(Minutes) + ':'
  else
    Result := IntToStr(Minutes) + ':';

  if Seconds < 10 then
    Result := Result + '0' + IntToStr(Seconds)
  else
    Result := Result + IntToStr(Seconds);
end;

end.
