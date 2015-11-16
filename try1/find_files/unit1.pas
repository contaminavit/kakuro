unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    procedure ButtonClick(Sender: TObject);
  private
    { private declarations }
      bp:array[1..10] of TPanel;
      bl,bb,bi:array[1..10] of TLabel;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.ButtonClick(Sender: TObject);

var a:string;Info : TSearchRec;
    i:integer;


    cp:TPanel;
    Cl:TLabel;
    cb:TLabel;
begin
  case    TButton(Sender).Tag of
   1:Form1.Label1.Caption:='easy';
   2:Form1.Label1.Caption:='normal';
   3:Form1.Label1.Caption:='hard';
  end;
  a:='levels'+Form1.Label1.Caption;
  for i:= 1 to  10 do begin
      if form1.bp[i]<>nil then begin form1.bp[i].Free; form1.Bp[i]:=nil; end;
      if form1.bl[i]<>nil then begin form1.bl[i].Free; form1.Bl[i]:=nil; end;
      if form1.bb[i]<>nil then begin form1.bb[i].Free; form1.Bb[i]:=nil; end;
      if form1.bi[i]<>nil then begin form1.bi[i].Free; form1.Bi[i]:=nil; end;
  end;
  i:=1;
  If  FindFirst(a+'\*.*', faAnyFile, Info) = 0  then
  begin

          Repeat
              If (Info.Attr and faAnyFile)=32 then  begin
               cp:=TPanel.Create(self);
               with cp do begin
                   align:=altop;
                   height:=50;
                   color:=clwhite;
                   parent:=Form1.scrollbox1;
               end;
                  form1.bp[i]:=cp;

               cl:=Tlabel.Create(self);
               with cl do begin
                   left:=10;
                   width:=80;
                   caption:=info.Name[1];
                   parent:=form1.bp[i];
               end;
               form1.bl[i]:=cl;

               cb:=Tlabel.create(self);
               with cb do begin
                 left:=100;
                 width:=100;
                 caption:='play';
                 autosize:=false;
                 alignment:=taCenter;
                 parent:=form1.bp[i];
               end;
                form1.bb[i]:=cb;

              cb:=Tlabel.create(self);
               with cb do begin
                 left:=205;
                 width:=100;
                 caption:='info';
                 autosize:=false;    //add information / best time
                 alignment:=taCenter;
                 parent:=form1.bp[i];
               end;
                form1.bi[i]:=cb;

                  i+=1;
              end;
          Until (FindNext(info)<>0);
          FindClose(Info);
      end
  else showmessage('error');



end;







end.

