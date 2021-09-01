unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    StringGrid2: TStringGrid;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure LoadCSVFile(FileName: String; separator: char);
    procedure SaveCSVFile(FileName: String; Grid: TStringGrid);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


//��������� CSV-���� � StringGrid1
procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
//������� ���� ����� ��������� ������ �����
  for i := 0 to StringGrid1.ColCount - 1 do
  StringGrid1.Cols[i].Clear;
  StringGrid1.RowCount := 1;

  if OpenDialog1.Execute then
  LoadCSVFile(OpenDialog1.FileName, ';');
end;
{��������� ���������� � ���� �� �������. � �������� ����������
������� ��� ����� � ����}
procedure TForm1.SaveCSVFile(FileName: String; Grid: TStringGrid);
var
  l: TStrings;
  i: word;
begin
  l:= TStringList.Create;
  {������ ���������� �� ����, ����� ����������� �� ;
  ����� �������� �������� � ������
  � ����� ��������� ����� ��������� �� � ����}
  for i:= 0 to Pred(Grid.RowCount) do
  begin
    Grid.Rows[i].StrictDelimiter:= true;
    Grid.Rows[i].Delimiter:= ';';
    l.Add(Grid.Rows[i].DelimitedText);
  end;
  l.SaveToFile(FileName);
  l.Free;
end;

//������� ���������� TRX �� ������ BS
procedure TForm1.Button2Click(Sender: TObject);
var
    i,j,k:integer;
    t:TStringList;
    s:string;
begin
StringGrid2.Cells[0,0] := 'BS Name';
StringGrid2.Cells[1,0] := 'TRX Count';
t:=TStringList.Create;
t.AddStrings(StringGrid1.Cols[0]); //��������� ���� � ������
for j:=t.Count-1 downto 0 do
if t.Strings[j]='' then t.Delete(j); //� ������� ������ ������
i:=1; //��������� ����� ����� (������� � �������)
while t.Count>0 do
 begin
  k:=0; //������� ���������� BS
  s:=t.Strings[0]; //
  for j:=t.Count-1 downto 0 do
  if t.Strings[j]=s then //���� ����� ����������� �� �������������� �� ����������
   begin
    inc(k);
    t.Delete(j); //������� ������ ��� ��������� ��������
   end;
  StringGrid2.Cells[0,i]:=s;//���������� BS � ������ ������� �����
  StringGrid2.Cells[1,i]:=inttostr(k);//���������� TRX
  inc(i);//��������� �����
 end;
end;

//��������� CSV ���� �� StringGrid2
procedure TForm1.Button3Click(Sender: TObject);
begin
if SaveDialog1.Execute then
 SaveCSVFile(SaveDialog1.FileName, Form1.StringGrid2);
end;

{��������� �������� CSV �����. ���� �������������� ��� ��������� ����,
����� ��� ���������, � � �������� ���������� ������� ��� ����� � ��� ����������� ������
���������� ��������� ���� ��� ���������� ��������}
procedure TForm1.LoadCSVFile(FileName: String; separator: char);
var
    f: TextFile;
    s1, s2: string;
    i, j: integer;
begin
 i := 0;  //�������� �������
 AssignFile (f, FileName);
 Reset(f); //���������� ����� � ���������� f � �������� ��� ������ �� ��� ���������
 while not eof(f) do
  begin
   readln (f, s1);
   i := i + 1; //������� ���������� �����
   j := 0;
   while pos(separator, s1)<>0 do
    begin
     s2 := copy(s1,1,pos(separator, s1)-1);  //��������� �������� � ����� �������
     j := j + 1;
     delete(s1, 1, pos(separator, s1));
    StringGrid1.Cells[j-1, i-1] := s2;     //���������� �������� � ����
    end;
   if pos (separator, s1)=0 then
    begin
     j := j + 1;
     StringGrid1.Cells[j-1, i-1] := s1;
    end;
    StringGrid1.ColCount := j;
    StringGRid1.RowCount := i+1;
  end;
 CloseFile(f);
//end 
end;



end.
