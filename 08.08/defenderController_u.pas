unit defenderController_u;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms, Vcl.StdCtrls,
  Vcl.Dialogs, System.Win.Registry, Vcl.Controls, System.UITypes;

type
  TForm2 = class(TForm)
    disableDefenderButton: TButton;
    enableDefenderButton: TButton;
    Memo1: TMemo;
    procedure disableDefenderButtonClick(Sender: TObject);
    procedure enableDefenderButtonClick(Sender: TObject);
    procedure disableSmartScreenButtonClick(Sender: TObject);
    procedure enableSmartScreenButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    function WriteRegistryValue(RootKey: HKEY; const KeyPath, ValueName: string; Value: DWORD): Boolean;
    procedure ShowResultMsg(const SuccessMsg: string; HasErrors: Boolean);
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add('Run this application as Administrator.');
end;

procedure TForm2.ShowResultMsg(const SuccessMsg: string; HasErrors: Boolean);
begin
  if HasErrors then
    Memo1.Lines.Add('Some operations failed. You may need administrator privileges or some keys might be locked by the system.')
  else
    Memo1.Lines.Add(SuccessMsg);

  Memo1.Lines.Add('You may need to restart your computer to see changes.');
end;

function TForm2.WriteRegistryValue(RootKey: HKEY; const KeyPath, ValueName: string; Value: DWORD): Boolean;
var
  reg: TRegistry;
begin
  Result := False;
  reg := TRegistry.Create(KEY_WRITE or KEY_WOW64_64KEY);
  try
    reg.RootKey := RootKey;
    if reg.OpenKey(KeyPath, True) then
    begin
      try
        reg.WriteInteger(ValueName, Value);
        Result := True;
      except
        on E: Exception do
          Memo1.Lines.Add('Failed to write ' + ValueName + ' in ' + KeyPath + ': ' + E.Message);
      end;
      reg.CloseKey;
    end
    else
      Memo1.Lines.Add('Failed to open key: ' + KeyPath);
  finally
    reg.Free;
  end;
end;

// defender aç
procedure TForm2.enableDefenderButtonClick(Sender: TObject);
var
  HasErrors: Boolean;
begin
  if MessageDlg('Are you sure you want to turn ON Windows Defender?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  HasErrors := False;
  Memo1.Lines.Add('Enabling Windows Defender...');

  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\wdboot', 'Start', 0) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\wdfilter', 'Start', 0) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\WinDefend', 'Start', 2) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\SecurityHealthService', 'Start', 2) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\wdnisdrv', 'Start', 3) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\mssecflt', 'Start', 0) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\WdNisSvc', 'Start', 3) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\Sense', 'Start', 3) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\wscsvc', 'Start', 2) then HasErrors := True;

  ShowResultMsg('Windows Defender enabled successfully.', HasErrors);
end;

// defender kapat
procedure TForm2.disableDefenderButtonClick(Sender: TObject);
var
  HasErrors: Boolean;
begin
  if MessageDlg('Are you sure you want to turn OFF Windows Defender?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  HasErrors := False;
  Memo1.Lines.Add('Disabling Windows Defender...');

  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\wdboot', 'Start', 4) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\wdfilter', 'Start', 4) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\WinDefend', 'Start', 4) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\SecurityHealthService', 'Start', 4) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\wdnisdrv', 'Start', 4) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\mssecflt', 'Start', 4) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\WdNisSvc', 'Start', 4) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\Sense', 'Start', 4) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\wscsvc', 'Start', 4) then HasErrors := True;

  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows Defender', 'DisableAntiSpyware', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows Defender', 'DisableRoutinelyTakingAction', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows Defender', 'ServiceKeepAlive', 0) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection', 'DisableBehaviorMonitoring', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection', 'DisableIOAVProtection', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection', 'DisableOnAccessProtection', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection', 'DisableRealtimeMonitoring', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows Defender\Reporting', 'DisableEnhancedNotifications', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications', 'DisableNotifications', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_CURRENT_USER, 'Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications', 'NoToastApplicationNotification', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_CURRENT_USER, 'Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications', 'NoToastApplicationNotificationOnLockScreen', 1) then HasErrors := True;

  ShowResultMsg('Windows Defender disabled successfully.', HasErrors);
end;

// smartscreen aç
procedure TForm2.enableSmartScreenButtonClick(Sender: TObject);
var
  HasErrors: Boolean;
begin
  if MessageDlg('Are you sure you want to turn ON SmartScreen?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  HasErrors := False;
  Memo1.Lines.Add('Enabling SmartScreen...');

  if not WriteRegistryValue(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments', 'SaveZoneInformation', 0) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows\System', 'EnableSmartScreen', 1) then HasErrors := True;

  ShowResultMsg('SmartScreen enabled successfully.', HasErrors);
end;

// smartscreen kapat
procedure TForm2.disableSmartScreenButtonClick(Sender: TObject);
var
  HasErrors: Boolean;
begin
  if MessageDlg('Are you sure you want to turn OFF SmartScreen?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  HasErrors := False;
  Memo1.Lines.Add('Disabling SmartScreen...');

  if not WriteRegistryValue(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments', 'SaveZoneInformation', 1) then HasErrors := True;
  if not WriteRegistryValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Policies\Microsoft\Windows\System', 'EnableSmartScreen', 0) then HasErrors := True;

  ShowResultMsg('SmartScreen disabled successfully.', HasErrors);
end;

end.

