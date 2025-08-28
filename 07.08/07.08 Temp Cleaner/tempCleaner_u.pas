unit tempCleaner_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, settings_u;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Button3: TButton;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

// klasor boyutunu hesapla
function GetFolderSize(const Folder: string): Int64;
var
  SR: TSearchRec;
begin
  Result := 0;
  if FindFirst(IncludeTrailingPathDelimiter(Folder) + '*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        if (SR.Attr and faDirectory) = faDirectory then
          Inc(Result, GetFolderSize(IncludeTrailingPathDelimiter(Folder) + SR.Name)) // recursive
        else
          Inc(Result, SR.Size);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  SettingsForm.Position := poMainFormCenter;
  SettingsForm.Show;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add('===================== Temp Cleaner =====================');
  Memo1.Lines.Add('This script cleans: local temp, system temp, windows/temp and old update files');
  Memo1.Lines.Add('====================================================');
  Memo1.Lines.Add('Logs:');
end;

procedure DeleteFolder(const folderPath: string);
var
  SR: TSearchRec;
  searchPath: string;
begin
  searchPath := IncludeTrailingPathDelimiter(folderPath);

  if FindFirst(searchPath + '*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        if (SR.Attr and faDirectory) = faDirectory then
          DeleteFolder(searchPath + SR.Name)  // recursive
        else
          DeleteFile(searchPath + SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;

  RemoveDir(folderPath);
end;

procedure DeleteFile(const filePath: string);
begin
  System.SysUtils.DeleteFile(filePath);
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  buffer: array[0..MAX_PATH] of Char;
  tempPath: string;
  paths: array[0..3] of string;
  i: Integer;
  SR: TSearchRec;
  filePath: string;
  BeforeSize, AfterSize: Int64;
begin
  if MessageDlg('Are you sure you want to clean the selected folders?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  GetTempPath(MAX_PATH, buffer);
  tempPath := string(buffer);

  paths[0] := IncludeTrailingPathDelimiter(tempPath);
  paths[1] := 'C:\Windows\Temp\';
  paths[2] := 'C:\Windows\SystemTemp\';
  paths[3] := 'C:\Windows\SoftwareDistribution\Download\';

  // temizlik oncesi boyut
  BeforeSize := 0;
  for i := 0 to High(paths) do
    if SettingsForm.SelectedFolders[i] and DirectoryExists(paths[i]) then
      Inc(BeforeSize, GetFolderSize(paths[i]));

  // temizlik islemi
  for i := 0 to High(paths) do
  begin
    if SettingsForm.SelectedFolders[i] then
    begin
      Memo1.Lines.Add('');
      Memo1.Lines.Add('Cleaning ===> ' + paths[i]);
      if FindFirst(paths[i] + '*', faAnyFile, SR) = 0 then
      begin
        repeat
          if (SR.Name <> '.') and (SR.Name <> '..') then
          begin
            filePath := paths[i] + SR.Name;
            if (SR.Attr and faDirectory) = faDirectory then
              DeleteFolder(filePath)
            else
              DeleteFile(filePath);
          end;
        until FindNext(SR) <> 0;
        FindClose(SR);
        Memo1.Lines.Add('Cleaned: ' + paths[i]);
      end;
    end;
  end;

  // temizlik sonrasi boyut
  AfterSize := 0;
  for i := 0 to High(paths) do
    if SettingsForm.SelectedFolders[i] and DirectoryExists(paths[i]) then
      Inc(AfterSize, GetFolderSize(paths[i]));

  Memo1.Lines.Add('');
  Memo1.Lines.Add(Format('Total freed space: %.2f MB', [(BeforeSize - AfterSize) / (1024 * 1024)]));
end;

end.

