program tempCleaner_p;

uses
  Vcl.Forms,
  tempCleaner_u in 'tempCleaner_u.pas' {Form2},
  settings_u in 'settings_u.pas' {SettingsForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.Run;
end.
