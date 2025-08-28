program defenderController_p;

uses
  Vcl.Forms,
  defenderController_u in 'defenderController_u.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
