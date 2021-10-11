unit Assign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    SaveDialog1: TSaveDialog;
    Bevel1: TBevel;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FindFile(Dir:String);
    procedure FindDir(Dirs:String);    
  end;

var
  Form1: TForm1;
  i: integer=0;
  x: integer=0;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 ListBox1.Clear;
 Listbox1.Items.Assign(FilelistBox1.Items);
 Listbox1.Items.Add('---------------------------------');
 Listbox1.Items.Add('Files = '+IntToStr(FileListBox1.Items.Count));
 Listbox1.Items.Add('---------------------------------'); 
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if SaveDialog1.Execute
 then ListBox1.Items.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Form1.Caption:=Form1.Caption+' - '+IntToStr(FilelistBox1.Items.Count)+' files';
 DriveComboBox1.Drive:='c';
 SendMessage(ListBox1.Handle,LB_SetHorizontalExtent,1000,0);
 SendMessage(FileListBox1.Handle,LB_SetHorizontalExtent,1000,0);
 SendMessage(DirectoryListBox1.Handle,LB_SetHorizontalExtent,1000,0); 
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 ListBox1.Clear;
 FindFile(DirectoryListBox1.Directory);
 Listbox1.Items.Add('Files = '+IntTostr(i));
 Listbox1.Items.Add('--------------------------------');
 i:=0;
end;

procedure TForm1.FindFile(Dir:String);
var
 SR:TSearchRec;
 FindRes:Integer;
 Dir1: string;
begin
 Dir1:=Dir;
 Dir:=Dir+'\';
 FindRes:=FindFirst(Dir+'*.*',faAnyFile,SR);
 while FindRes=0 do
  begin
   if ((SR.Attr and faDirectory)=faDirectory) and
   ((SR.Name='.')or(SR.Name='..')) then
     begin
      FindRes:=FindNext(SR);
      Continue;
     end;
   // если найден каталог, то
   if ((SR.Attr and faDirectory)=faDirectory) then
    begin
     // входим в процедуру поиска с параметрами текущего каталога +
     // каталог, что мы нашли
     FindFile(Dir+SR.Name+'\');
     FindRes:=FindNext(SR);
     // после осмотра вложенного каталога мы продолжаем поиск
     // в этом каталоге
     Continue; // продолжить цикл
    end;
   i:=i+1;
   Listbox1.Items.Add(Dir1+' - '+Sr.Name);
   if Application.Terminated then Break;
   Application.ProcessMessages;
   FindRes:=FindNext(SR);    
  end;
 Listbox1.Items.Add('--------------------------------');  
 FindClose(SR);
end;

procedure TForm1.DirectoryListBox1Change(Sender: TObject);
begin
 Form1.Caption:='Assign files/directories - '+IntToStr(FilelistBox1.Items.Count)+' files';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 ListBox1.Clear;
 FindDir(DirectoryListBox1.Directory);
 Listbox1.Items.Add('--------------------------------'); 
 Listbox1.Items.Add('Directories = '+IntTostr(i));
 Listbox1.Items.Add('--------------------------------');
 i:=0;
 x:=0;
end;

procedure TForm1.FindDir(Dirs:String);
var
 SR:TSearchRec;
 FindRes,j:Integer;
 Dir1: string;
begin
 j:=0;
 Dir1:=Dirs;
 Dirs:=Dirs+'\';
 FindRes:=FindFirst(Dirs+'*.*',faAnyFile,SR);
 while FindRes=0 do
  begin
   if ((SR.Attr and faDirectory)=faDirectory) and
   ((SR.Name='.')or(SR.Name='..')) then
     begin
      FindRes:=FindNext(SR);
      if (j=0) and (x=1) then
       begin
        Listbox1.Items.Add(Dir1);
        i:=i+1;
        j:=1;
        x:=1;
       end
      else
       begin
        j:=1;
        x:=1;
       end;
      Continue;
     end;
   // если найден каталог, то
   if ((SR.Attr and faDirectory)=faDirectory) then
    begin
     // входим в процедуру поиска с параметрами текущего каталога
     // + каталог, что мы нашли
     FindDir(Dirs+SR.Name+'\');
     FindRes:=FindNext(SR);
     // после осмотра вложенного каталога мы продолжаем поиск
     // в этом каталоге
     Continue; // продолжить цикл
    end;
   if Application.Terminated then Break;
   Application.ProcessMessages;
   FindRes:=FindNext(SR);
   j:=0;
  end;
 FindClose(SR);
end;

end.
