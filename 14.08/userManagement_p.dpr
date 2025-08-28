program userManagement_p;

uses
  Vcl.Forms,
  userManagement_u in 'userManagement_u.pas' {Form2},
  userDashboard_u in 'userDashboard_u.pas' {FormDashboard};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormDashboard, FormDashboard);
  Application.Run;
end.
