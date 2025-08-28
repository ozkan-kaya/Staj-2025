unit secureDelete_u;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    addFileButton: TButton;
    clearListButton: TButton;
    secureDeleteButton: TButton;
    Log: TMemo;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure addFileButtonClick(Sender: TObject);
    procedure clearListButtonClick(Sender: TObject);
    procedure secureDeleteButtonClick(Sender: TObject);
  private
    function OverwriteFile(const FileName: string; Passes: Integer): Boolean;
    function GetFileSizeInt64(const FileName: string): Int64;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function TForm2.GetFileSizeInt64(const FileName: string): Int64;
var
  SR: TSearchRec;
begin
  Result := -1;
  if FindFirst(FileName, faAnyFile, SR) = 0 then
  begin
    Result := SR.Size;
    FindClose(SR);
  end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  Log.Lines.Clear;
  ProgressBar1.Position := 0;
end;

procedure TForm2.addFileButtonClick(Sender: TObject);
var
  dlg: TOpenDialog;
  i: Integer;
begin
  ProgressBar1.Position := 0;
  dlg := TOpenDialog.Create(Self);
  try
    dlg.Options := [ofFileMustExist, ofAllowMultiSelect];
    dlg.Title := 'Select file(s) to shred';
    if dlg.Execute then
      for i := 0 to dlg.Files.Count - 1 do
        ListBox1.Items.Add(dlg.Files[i]);
  finally
    dlg.Free;
  end;
end;

procedure TForm2.clearListButtonClick(Sender: TObject);
begin
  ListBox1.Clear;
  Log.Lines.Add('File list cleared.');
  ProgressBar1.Position := 0;
end;

procedure TForm2.secureDeleteButtonClick(Sender: TObject);
var
  i: Integer;
  fileName: string;
  fileSize: Int64;
begin
  if ListBox1.Count = 0 then
  begin
    Log.Lines.Add('No files to shred.');
    Exit;
  end;

  if MessageDlg('Are you sure you want to securely delete the selected files?',
     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  Randomize;

  for i := 0 to ListBox1.Count - 1 do
  begin
    fileName := ListBox1.Items[i];

    if not FileExists(fileName) then
    begin
      Log.Lines.Add('File not found: ' + fileName);
      Log.Lines.Add('----------------------------------------');
      Continue;
    end;

    fileSize := GetFileSizeInt64(fileName);

    // bos dosya ise sadece sil
    if fileSize = 0 then
    begin
      if DeleteFile(fileName) then
        Log.Lines.Add('Empty file deleted: ' + fileName)
      else
        Log.Lines.Add(Format('Could not delete file: %s (Error %d)', [fileName, GetLastError]));

      Log.Lines.Add('----------------------------------------');
      Continue;
    end;

    // boyutu > 0 dosya için shred
    if fileSize > 0 then
    begin
      Log.Lines.Add('Overwriting: ' + fileName);

      if OverwriteFile(fileName, 3) then
      begin
        if DeleteFile(fileName) then
          Log.Lines.Add('Deleted: ' + fileName)
        else
          Log.Lines.Add(Format('Could not delete file: %s (Error %d)', [fileName, GetLastError]));
      end
      else
        Log.Lines.Add('Overwrite failed: ' + fileName);

      Log.Lines.Add('----------------------------------------');
      Continue;
    end;

    // beklenmedik hata olursa
    Log.Lines.Add('Unable to determine size or access file: ' + fileName);
    Log.Lines.Add('----------------------------------------');
  end;

  Log.Lines.Add('Secure delete operation completed.');
  ProgressBar1.Position := 0;
end;

// secure delete icin overwrite islemi

function TForm2.OverwriteFile(const FileName: string; Passes: Integer): Boolean;
const
  BUFFER_SIZE = 1024 * 1024; // 1mb blok
var
  fs: TFileStream;
  buffer: array of Byte;
  i, pass, bytesToWrite: Integer;
  fileSize, bytesRemaining, totalWritten: Int64;
  percentBase, percentNow: Integer;
begin
  Result := False;

  if not FileExists(FileName) then
  begin
    Log.Lines.Add('File not found (Overwrite): ' + FileName);
    Exit;
  end;

  try
    // varsa read-only ozelligini kaldir
    try
      FileSetAttr(FileName, faArchive);
    except
      //
    end;

    fs := TFileStream.Create(FileName, fmOpenReadWrite or fmShareExclusive);
    try
      fileSize := fs.Size;
      if fileSize <= 0 then
      begin
        Result := True;
        Exit;
      end;

      SetLength(buffer, BUFFER_SIZE);

      // yuzde bazli progress bar
      ProgressBar1.Min := 0;
      ProgressBar1.Max := Passes * 100;

      for pass := 1 to Passes do
      begin
        bytesRemaining := fileSize;
        fs.Position := 0;
        totalWritten := 0;
        percentBase := (pass - 1) * 100;

        while bytesRemaining > 0 do
        begin
          bytesToWrite := BUFFER_SIZE;
          if bytesRemaining < BUFFER_SIZE then
            bytesToWrite := bytesRemaining;

          case pass mod 3 of
            0: FillChar(buffer[0], bytesToWrite, $FF); // 0xFF
            1: FillChar(buffer[0], bytesToWrite, $00); // 0x00
            2: for i := 0 to bytesToWrite - 1 do
                 buffer[i] := Random(256); // random
          end;

          fs.WriteBuffer(buffer[0], bytesToWrite);
          Inc(totalWritten, bytesToWrite);
          Dec(bytesRemaining, bytesToWrite);

          // yuzde hesabi ve progress bar
          percentNow := percentBase + Round((totalWritten / fileSize) * 100);
          if percentNow > ProgressBar1.Max then
            percentNow := ProgressBar1.Max;
          ProgressBar1.Position := percentNow;

          Application.ProcessMessages;
        end;

        // disk cache'i zorla yaz
        FlushFileBuffers(fs.Handle);
      end;

      Result := True;
    finally
      fs.Free;
    end;
  except
    on E: Exception do
    begin
      Log.Lines.Add('Error overwriting file: ' + FileName + ' - ' + E.Message);
      Result := False;
    end;
  end;
end;

end.

