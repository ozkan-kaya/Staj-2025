program lights_u;

uses
  Vcl.Forms,
  trafficLights_u in 'trafficLights_u.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
