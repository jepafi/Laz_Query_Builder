unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Forms, StdCtrls, ZConnection, QBuilder, QBEZEOS;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    ZConnection1: TZConnection;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  meuqb: TOQBuilderDialog;
  zeosengine: TOQBEngineZEOS;
begin
  try
    ZConnection1.Database := ExtractFilePath(Application.ExeName)+'EMPLOYEE.FDB';
    meuqb := TOQBuilderDialog.Create(nil);
    zeosengine := TOQBEngineZEOS.Create(nil);
    zeosengine.DatabaseName := ZConnection1;
    meuqb.OQBEngine := zeosengine;
    meuqb.OQBEngine.DatabaseName := ZConnection1.Database;
    // for schema PostgreSQL
    // zeosengine.SchemaPostgreSQL := 'my_schema';
    zeosengine.ShowSystemTables := False;
    ZConnection1.Connect;
    if meuqb.Execute then Memo1.Text := meuqb.SQL.Text;
  finally
    meuqb.Free;
    zeosengine.Free;
  end;
end;

{$R *.lfm}

end.
