program secureDelete_p;

uses
  Vcl.Forms,
  secureDelete_u in 'secureDelete_u.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
