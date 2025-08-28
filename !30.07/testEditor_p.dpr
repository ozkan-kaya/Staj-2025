program testEditor_p;

uses
  Vcl.Forms,
  textEditor_u in 'textEditor_u.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
