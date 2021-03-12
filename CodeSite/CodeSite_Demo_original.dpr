program CodeSite_Demo_original;

uses
  Vcl.Forms,
  Umain_CodeSite_original in 'Umain_CodeSite_original.pas' {CodeSite_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCodeSite_Form, CodeSite_Form);
  Application.Run;
end.
