unit Umain_CodeSite_original;

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
    ListBox1: TListBox;
    Timer1: TTimer;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

  FDQuery1.Open;

end;

procedure TCodeSight_Form.Button4Click(Sender: TObject);
var
  slist : tstringList;
begin
  slist := tstringlist.create;
  slist.LoadFromFile('e:\sample.txt');  //사이크큰것로드
  //free 안함 memory leak
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
end;

end.
