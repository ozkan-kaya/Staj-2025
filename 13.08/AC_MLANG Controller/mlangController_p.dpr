program mlangController_p;

uses
  Vcl.Forms,
  mlangController_u in 'mlangController_u.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
