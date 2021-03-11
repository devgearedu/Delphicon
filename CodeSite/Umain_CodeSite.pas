unit Umain_CodeSite;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Menus,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TCodeSight_Form = class(TForm)
    DBGrid1: TDBGrid;
    cbCountry: TComboBox;
    Button1: TButton;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    Button3: TButton;
    Button2: TButton;
    MainMenu1: TMainMenu;
    CodeSite1: TMenuItem;
    Enable1: TMenuItem;
    Disable1: TMenuItem;
    Image1: TImage;
    ListBox1: TListBox;
    Timer1: TTimer;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Enable1Click(Sender: TObject);
    procedure Disable1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CurrentProcessMemory:Cardinal;

var
  CodeSight_Form: TCodeSight_Form;

implementation
uses CodeSiteLogging,psAPI;   //CodeSiteDBTools; //csmDataSet 사용을 위함
{$R *.dfm}
var
  CodeSiteEx: TCodeSiteLogger; // 폼의 변수로 로거를 선언
function CurrentProcessMemory:Cardinal;
var
  MemCounters : TProcessMemoryCounters;
begin
  MemCounters.cb := SizeOf(MemCounters);
  if GetProcessMemoryInfo(GetCurrentProcess,
      @MemCounters,
      SizeOf(MemCounters)) then
    Result := MemCounters.WorkingSetSize
  else
    result := 0;
end;


procedure TCodeSight_Form.Button1Click(Sender: TObject);
begin

  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT * FROM Customers ' +
    'WHERE Country = ' + '''' + cbCountry.Items[cbCountry.ItemIndex] + '''';

  try
      CodeSite.Send(csmgreen,  FDQuery1.SQL.Text);
      fdquery1.Open;
      CodeSite.Send(csmYellow, FDQuery1.RecordCount.ToString + ' 개 데이터');
      If FDQuery1.RecordCount > 4 then
        CodeSite.SendWarning('데이터가 4개를 넘음');
    // 결과 데이터세트를 통채로 전달 (그림4)
    //CodeSite.Send(csmDataSet, ‘Customers’, FDQuery1);
    // (변경후)

    //If FDQuery1.RecordCount > 4 then
    //   CodeSite.SendWarning('데이터가 4개를 넘음');
    //else
    // CodeSite.Send(csmDataSet, ‘Customers’, FDQuery1);
  except
      on E: Exception do
      begin
         CodeSiteEx.SendException(FDQuery1.SQL.Text, E); // Error.csl에 따로 또 로그를 남기자.
         CodeSite.SendException(FDQuery1.SQL.Text, E)
      end;
  end;

end;

procedure TCodeSight_Form.Button3Click(Sender: TObject);
begin
    codesite.EnterMethod('Enter button3click');
    CodeSite.Category := 'Level Overview';
    CodeSite.Send(csmLevel1, 'Level 1 = Red');
    CodeSite.Send(csmred, 'Level 1 = Red');
    codesite.ExitMethod('Exit button3click');
end;
procedure TCodeSight_Form.Button4Click(Sender: TObject);
var
  slist : tstringList;
begin
  slist := tstringlist.create;
  slist.LoadFromFile('e:\sample.txt');  //사이크큰것로드
  //free 안함 memory leak
 end;

procedure TCodeSight_Form.Disable1Click(Sender: TObject);
begin
  Codesite.Enabled := false;
end;

procedure TCodeSight_Form.Enable1Click(Sender: TObject);
begin
  Codesite.Enabled := true;
  CodeSite.AddSeparator;
  CodeSite.Send('사용자가 코드사이트 로그를 켬');
end;

procedure TCodeSight_Form.Timer1Timer(Sender: TObject);
begin
//  CodeSite.Send(csscratchpad, Timetostr(now)+ 'memory : ' +
//      (CurrentProcessMemory div (1024 * 1024)).ToString + 'MB' );
//    Codesite.send(timetostr(now),'memory : ' +
//      (CurrentProcessMemory div (1024 * 1024)).ToString + 'MB' );
end;

procedure TCodeSight_Form.Button2Click(Sender: TObject);
begin
// {$ifdef debug}codesite.tracemethod(self,'button2click');{$endif}
 CodeSite.Send( 'Codesite_Form', CodeSight_Form);
 CodeSite.Send( 'Screen.Fonts', Screen.Fonts );
 CodeSite.Send( 'ListBox items', ListBox1.items);
 CodeSite.AddSeparator;
end;

Initialization // 폼의 Initialization 블록을 사용하여 로거
begin
  CodeSiteEx :=  TCodeSiteLogger.Create(nil); // (finalization 블록에서) 직접 Free 하기로 한다
  CodeSiteEx.Destination := TCodeSiteDestination.Create(CodeSiteEX);
  CodeSiteEx.Destination.AsString :=
   'File[Path=d:\Errors.csl]';
  codesiteEx.Destination.Viewer.active := true;
  codesite.Enabled := true;
end;
finalization
  CodeSiteEx.Free;
end.
