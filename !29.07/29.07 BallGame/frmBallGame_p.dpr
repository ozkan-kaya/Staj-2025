program frmBallGame_p;

uses
  Vcl.Forms,
  frmBallGame_u in 'frmBallGame_u.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
