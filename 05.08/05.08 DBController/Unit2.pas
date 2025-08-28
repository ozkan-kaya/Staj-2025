unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm2 = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    DBConnection: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

  procedure TForm2.FormCreate(Sender: TObject);
  begin
    try
      //write code here
    except
        on E: Exception do
          ShowMessage('Something went wrong: ' + E.Message);
    end;
  end;
end.
