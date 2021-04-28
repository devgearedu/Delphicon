program CodeSite_Demo;

uses
  CodeSiteLogging,
  SysUtils,
  Vcl.Forms,
  Umain_CodeSite in 'Umain_CodeSite.pas' {CodeSight_Form},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

var
  Destination: TCodeSiteDestination;

begin
  Application.Initialize;

  Destination := TCodeSiteDestination.Create(Application);
  //  Destination.AsString := 'File[Path=c:\CodeSite_Demo.csl;MaxSize=2000;MaxParts=1000]';

  Destination.LogFile.Active := True;
  Destination.LogFile.FileName :=
        ChangeFileExt(ExtractFileName(Application.ExeName), '.csl');
  Destination.LogFile.FilePath := ExtractFilePath(Application.exename);
  //Destination.LogFile.SetLogbyDate(True); // 일별로 로그 파일이 생성
  Destination.LogFile.MaxSize := 2000;
  Destination.LogFile.MaxParts := 1000;
  CodeSite.Destination := Destination;

  Codesite.Enabled := true;
  Destination.Viewer.Active := True;
  codesite.Send('Application start');
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Emerald');
  Application.CreateForm(TCodeSight_Form, CodeSight_Form);
  Application.Run;
end.
