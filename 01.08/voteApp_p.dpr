program voteApp_p;

uses
  Vcl.Forms,
  voteApp_u in 'voteApp_u.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
