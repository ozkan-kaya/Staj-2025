unit textEditor_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    ButtonOpen: TButton;
    ButtonSave: TButton;
    Label2: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ButtonSaveAs: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonSaveAsClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonReplaceClick(Sender: TObject);
  private
    CurrentFileName: string;
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  CurrentFileName := '';
end;

procedure TForm2.ButtonOpenClick(Sender: TObject);
begin
  OpenDialog1.Filter := 'Text Files (*.txt)|*.txt';
  OpenDialog1.DefaultExt := 'txt';

  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    CurrentFileName := OpenDialog1.FileName;
    ShowMessage('Dosya başarıyla açıldı: ' + CurrentFileName);
  end;
end;

procedure TForm2.ButtonSaveClick(Sender: TObject);
begin
  if CurrentFileName <> '' then
  begin
    Memo1.Lines.SaveToFile(CurrentFileName);
    ShowMessage('Dosya kaydedildi: ' + CurrentFileName);
  end
  else
    ButtonSaveAsClick(Sender);
end;

procedure TForm2.ButtonSaveAsClick(Sender: TObject);
begin
  SaveDialog1.Filter := 'Text Files (*.txt)|*.txt';
  SaveDialog1.DefaultExt := 'txt';
  SaveDialog1.Options := SaveDialog1.Options + [ofOverwritePrompt];

  if SaveDialog1.Execute then
  begin
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
    CurrentFileName := SaveDialog1.FileName;
    ShowMessage('Dosya başarıyla kaydedildi: ' + CurrentFileName);
  end;
end;


procedure TForm2.ButtonClearClick(Sender: TObject);
begin
  Memo1.Clear;
  ShowMessage('Memo temizlendi.');
end;

procedure TForm2.ButtonReplaceClick(Sender: TObject);
var
  FindText, ReplaceText: string;
begin
  FindText := InputBox('Kelime Bul', 'Değiştirilecek kelimeyi girin:', '');
  if FindText = '' then Exit;

  ReplaceText := InputBox('Kelime Değiştir', 'Yeni kelimeyi girin:', '');

  Memo1.Lines.Text := StringReplace(Memo1.Lines.Text, FindText, ReplaceText, [rfReplaceAll, rfIgnoreCase]);

  ShowMessage('"' + FindText + '" kelimesi "' + ReplaceText + '" ile değiştirildi.');
end;

end.
