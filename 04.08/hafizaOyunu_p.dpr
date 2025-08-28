program hafizaOyunu_p;

uses
  Vcl.Forms,
  hafizaOyunu_u in 'hafizaOyunu_u.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
