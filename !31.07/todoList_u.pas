unit todoList_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    ListBox1: TListBox;
    Label2: TLabel;
    EditTask: TEdit;
    Label3: TLabel;
    ButtonAdd: TButton;
    ButtonDelete: TButton;
    ButtonClear: TButton;
    ButtonSave: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
  private
    { Private declarations }
    FFileName: string;
    procedure LoadTasks;
    procedure SaveTasks;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  FFileName := ExtractFilePath(Application.ExeName) + 'tasks.txt';
  LoadTasks;
end;

procedure TForm2.ButtonAddClick(Sender: TObject);
begin
  if Trim(EditTask.Text) <> '' then
  begin
    ListBox1.Items.Add(EditTask.Text);
    EditTask.Clear;
    SaveTasks;
  end
  else
    ShowMessage('Lütfen bir görev giriniz.');
end;

procedure TForm2.ButtonDeleteClick(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    ListBox1.Items.Delete(ListBox1.ItemIndex);
    SaveTasks;
  end
  else
    ShowMessage('Silinecek görevi seçiniz.');
end;

procedure TForm2.ButtonClearClick(Sender: TObject);
begin
  if MessageDlg('Tüm görevler silinsin mi?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ListBox1.Clear;
    SaveTasks;
  end;
end;

procedure TForm2.ButtonSaveClick(Sender: TObject);
begin
  SaveTasks;
  ShowMessage('Görevler kaydedildi.');
end;

procedure TForm2.LoadTasks;
var
  TaskList: TStringList;
begin
  if not FileExists(FFileName) then Exit;

  TaskList := TStringList.Create;
  try
    TaskList.LoadFromFile(FFileName);
    ListBox1.Items.Assign(TaskList);
  finally
    TaskList.Free;
  end;
end;

procedure TForm2.SaveTasks;
var
  TaskList: TStringList;
begin
  TaskList := TStringList.Create;
  try
    TaskList.Assign(ListBox1.Items);
    TaskList.SaveToFile(FFileName);
  finally
    TaskList.Free;
  end;
end;

end.

