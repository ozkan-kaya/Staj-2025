unit voteApp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Math, Vcl.Samples.Spin;

type
  TForm2 = class(TForm)
    LabelQuestion: TLabel;
    RadioButtonDelphi: TRadioButton;
    RadioButtonPython: TRadioButton;
    RadioButtonCpp: TRadioButton;
    RadioButtonJava: TRadioButton;
    RadioButtonJavascript: TRadioButton;
    RadioButtonOther: TRadioButton;
    ButtonVote: TButton;
    ButtonVoteSimulation: TButton;
    LabelResult: TLabel;
    LabelDelphi: TLabel;
    LabelPython: TLabel;
    LabelCpp: TLabel;
    LabelJava: TLabel;
    LabelJavascipt: TLabel;
    LabelOther: TLabel;
    LabelNumberofVotes: TLabel;
    ProgressBarDelphi: TProgressBar;
    ProgressBarPython: TProgressBar;
    ProgressBarCpp: TProgressBar;
    ProgressBarJava: TProgressBar;
    ProgressBarJavascript: TProgressBar;
    ProgressBarOther: TProgressBar;
    SpinEdit1: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure ButtonVoteClick(Sender: TObject);
    procedure ButtonVoteSimulationClick(Sender: TObject);
  private
    { Private declarations }
    VOyDelphi, VOyPython, VOyCpp, VOyJava, VOyJS, VOyOther: Integer;
    procedure UpdateResults;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  VOyDelphi := 0;
  VOyPython := 0;
  VOyCpp := 0;
  VOyJava := 0;
  VOyJS := 0;
  VOyOther := 0;
  UpdateResults;
end;

procedure TForm2.ButtonVoteClick(Sender: TObject);
var
  OySayisi: Integer;
begin
  OySayisi := SpinEdit1.Value;
  if RadioButtonDelphi.Checked then Inc(VOyDelphi, OySayisi)
  else if RadioButtonPython.Checked then Inc(VOyPython, OySayisi)
  else if RadioButtonCpp.Checked then Inc(VOyCpp, OySayisi)
  else if RadioButtonJava.Checked then Inc(VOyJava, OySayisi)
  else if RadioButtonJavascript.Checked then Inc(VOyJS, OySayisi)
  else if RadioButtonOther.Checked then Inc(VOyOther, OySayisi);

  UpdateResults;
end;

procedure TForm2.ButtonVoteSimulationClick(Sender: TObject);
begin
  Inc(VOyDelphi, Random(11));
  Inc(VOyPython, Random(11));
  Inc(VOyCpp, Random(11));
  Inc(VOyJava, Random(11));
  Inc(VOyJS, Random(11));
  Inc(VOyOther, Random(11));

  UpdateResults;
end;

procedure TForm2.UpdateResults;
var
  TotalVotes: Integer;
  DelphiPct, PythonPct, CppPct, JavaPct, JSPct, OtherPct: Integer;
begin
  TotalVotes := VOyDelphi + VOyPython + VOyCpp + VOyJava + VOyJS + VOyOther;
  if TotalVotes = 0 then TotalVotes := 1; // sıfıra bölmeyi önlemek için

  DelphiPct := Round(VOyDelphi / TotalVotes * 100);
  PythonPct := Round(VOyPython / TotalVotes * 100);
  CppPct := Round(VOyCpp / TotalVotes * 100);
  JavaPct := Round(VOyJava / TotalVotes * 100);
  JSPct := Round(VOyJS / TotalVotes * 100);
  OtherPct := Round(VOyOther / TotalVotes * 100);

  LabelDelphi.Caption := Format('Delphi: %d (%d%%)', [VOyDelphi, DelphiPct]);
  LabelPython.Caption := Format('Python: %d (%d%%)', [VOyPython, PythonPct]);
  LabelCpp.Caption := Format('C++: %d (%d%%)', [VOyCpp, CppPct]);
  LabelJava.Caption := Format('Java: %d (%d%%)', [VOyJava, JavaPct]);
  LabelJavascipt.Caption := Format('Javascript: %d (%d%%)', [VOyJS, JSPct]);
  LabelOther.Caption := Format('Other: %d (%d%%)', [VOyOther, OtherPct]);

  ProgressBarDelphi.Position := DelphiPct;
  ProgressBarPython.Position := PythonPct;
  ProgressBarCpp.Position := CppPct;
  ProgressBarJava.Position := JavaPct;
  ProgressBarJavascript.Position := JSPct;
  ProgressBarOther.Position := OtherPct;

  LabelResult.Caption := Format('Sonuçlar (toplam oy sayısı %d):', [VOyDelphi + VOyPython + VOyCpp + VOyJava + VOyJS + VOyOther]);
end;


end.

