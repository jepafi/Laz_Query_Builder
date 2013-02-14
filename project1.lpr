program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, QBDBFrm, QBDBFrm2, QBAbout, QBuilder, QBEZEOS,
  QBDirFrm, QBLnkFrm, zcomponent;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TOQBForm, OQBForm);
  Application.Run;
end.

