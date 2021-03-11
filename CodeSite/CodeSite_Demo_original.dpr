program CodeSite_Demo_original;

uses
  Vcl.Forms,
  Umain_CodeSite_original in 'Umain_CodeSite_original.pas' {CodeSight_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCodeSight_Form, CodeSight_Form);
  Application.Run;
end.
