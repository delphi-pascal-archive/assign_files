program Assign_files;

uses
  Forms,
  Assign in 'Assign.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
