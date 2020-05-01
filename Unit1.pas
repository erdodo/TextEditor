unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Dosya1: TMenuItem;
    Edit1: TMenuItem;
    Biim1: TMenuItem;
    Yardm1: TMenuItem;
    Yeni1: TMenuItem;
    A1: TMenuItem;
    Kaydet1: TMenuItem;
    FarklKaydet1: TMenuItem;
    Kapatl1: TMenuItem;
    Kes1: TMenuItem;
    Kopyala1: TMenuItem;
    Yaptr1: TMenuItem;
    Bul1: TMenuItem;
    Deitir1: TMenuItem;
    Font1: TMenuItem;
    Hakknda1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    FontDialog1: TFontDialog;
    Yazdr1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Kes2: TMenuItem;
    Kopyala2: TMenuItem;
    Yaptr2: TMenuItem;
    ColorDialog1: TColorDialog;
    Renk1: TMenuItem;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    FindDialog1: TFindDialog;
    ReplaceDialog1: TReplaceDialog;
    N1: TMenuItem;
    Sil1: TMenuItem;
    Ara1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    procedure Hakknda1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure FarklKaydet1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Kapatl1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure Renk1Click(Sender: TObject);
    procedure Yazdr1Click(Sender: TObject);
    procedure Bul1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
    procedure Deitir1Click(Sender: TObject);
    procedure Kes2Click(Sender: TObject);
    procedure Kopyala2Click(Sender: TObject);
    procedure Yaptr2Click(Sender: TObject);
    procedure Sil1Click(Sender: TObject);
    procedure Yeni1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sayfa_sayisi,satir_sayisi,ilk,son:Integer;
  Sayfa,Satir,i:Integer;
   adet:Integer;
      yer:Integer;
implementation

uses Unit2,printers,math,ClipBrd;

{$R *.dfm}

procedure TForm1.Hakknda1Click(Sender: TObject);
begin
             Form2.show;
end;

procedure TForm1.A1Click(Sender: TObject);
begin
  if  OpenDialog1.Execute then
  memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.FarklKaydet1Click(Sender: TObject);
begin
       if  SaveDialog1.Execute then
       Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
     close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
      Form2.Show;
end;

procedure TForm1.Kapatl1Click(Sender: TObject);
begin
                 close;
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
       if FontDialog1.Execute then
       Memo1.Font:=FontDialog1.Font;
end;

procedure TForm1.Renk1Click(Sender: TObject);
begin
         if ColorDialog1.Execute then
             Memo1.Font.Color:=ColorDialog1.Color;
end;

procedure TForm1.Yazdr1Click(Sender: TObject);
begin
     PrintDialog1.Options:=[poPageNums];//sayfa numaralarý
     PrintDialog1.FromPage:=1;
     PrintDialog1.MinPage:=1;


     Printer.Canvas.Font:=Memo1.Font;//yazýcý ile yazýnýn fontunu eþitler
     satir_sayisi:= floor((Printer.PageHeight)/(Printer.Canvas.TextHeight('X')));
     sayfa_sayisi:=ceil(Memo1.Lines.Count/satir_sayisi);
     PrintDialog1.ToPage:=sayfa_sayisi;
     PrintDialog1.MaxPage:=sayfa_sayisi;
     if PrintDialog1.Execute then
      Begin
        with PrintDialog1 do
          begin
          if  PrintRange = prAllPages then
          begin
            ilk:=MinPage;
            son:=MaxPage;
          end
        else
        begin
          ilk:=FromPage;
          son:=ToPage;
        end;
      end;
      Printer.BeginDoc;
        for sayfa:= ilk to son do
        begin
          Caption:='Yazdýrýlan Sayfa : ' + IntToStr(Printer.PageNumber);
          satir:=(sayfa-1)*(satir_sayisi);
          for i:=satir to satir+satir_sayisi-1 do
          begin
            if i<Memo1.Lines.Count then
              Printer.Canvas.TextOut(50,(i mod satir_sayisi)* Printer.Canvas.TextHeight('X'), Memo1.Lines[i]);
            end;
            if sayfa <> son then
              Printer.NewPage;
            end;
            Printer.EndDoc;
            Caption:='Yazdýrma Bitti';
          end;



end;

procedure TForm1.Bul1Click(Sender: TObject);
begin
  with FindDialog1 do
  begin
    Options:=Options+[frHideUpDown,frHideWholeWord];
    FindText:=Memo1.SelText;
    execute;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Memo1.HideSelection:=false;
end;

procedure TForm1.FindDialog1Find(Sender: TObject);


var
    s,f:String;
        b:Integer;

begin
adet:=0;
yer:=0;
  f:=FindDialog1.FindText;
  s:=Copy(Memo1.Text,yer+1,Length(Memo1.Text)-yer+1);

  if Not ((FindDialog1.Options*[frMatchCase])=[frMatchCase]) then
  begin
    f:=AnsiUpperCase(f);
    s:=AnsiUpperCase(s);
  end;
  b:=Pos(f,s);
  yer := yer+b;
  If b=0 then
  begin
    if adet=0 then
      ShowMessage(f+' Bulunamadý')
    else
      showMessage('Arama Tamamlandý');
    FindDialog1.CloseDialog;
    adet:=0;
    yer:=0;
  end
  else
  begin
    Memo1.SelStart:=yer-1;
    Memo1.SelLength:=Length(f);
  end;
  adet:=adet+1;

end;






  procedure TForm1.ReplaceDialog1Find(Sender: TObject);
var f,s:String; b:Integer;
begin
  f:=ReplaceDialog1.FindText;
  s:=Copy(Memo1.Text,yer+1,Length(Memo1.Text)-yer+1);
  if Not ((ReplaceDialog1.Options*[frMatchCase])=[frMatchCase]) then
  begin
    f:=AnsiUpperCase(f);
    s:=AnsiUpperCase(s);
  end;
  b:=Pos(f,s);
  yer := yer+b;
  If b=0 then
  begin
    if adet=0 then
      ShowMessage(f+' Bulunamadý')
    else
      showMessage('Arama Tamamlandý');
    ReplaceDialog1.CloseDialog;
    adet:=0;
    yer:=0;
  end
   else
  begin
    Memo1.SelStart:=yer-1;
    Memo1.SelLength:=Length(f);
  end;
  adet:=adet+1;



 end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
var s,f,r,sec:String;  b:Integer;  d:Boolean;
begin
f:=ReplaceDialog1.FindText;
      r:=ReplaceDialog1.ReplaceText;
      s:= Copy(Memo1.Text,yer+1,Length(Memo1.Text)-yer+1);
       if Not ((ReplaceDialog1.Options*[frMatchCase])=[frMatchCase]) then
  begin
    f:=AnsiUpperCase(f);
    s:=AnsiUpperCase(s);
  end
  else
  d:=Memo1.SelText=f;
  if  (ReplaceDialog1.Options*[frReplace])=[frReplace] then
  begin
    Memo1.Seltext:=r;
    yer:=yer+Length(r)-1;
    s:=Copy(Memo1.Text,yer+1,Length(Memo1.Text)-yer+1);
    if Not ((ReplaceDialog1.Options*[frMatchCase])=[frMatchCase]) then
       begin
          s:=AnsiUpperCase(s);
      end;
    b:=Pos(f,s);
    yer:=yer+b;
     If b=0 then
     begin
        if adet=0 then
          ShowMessage(f+' Bulunamadý')
        else
          showMessage('Arama Tamamlandý');
          ReplaceDialog1.CloseDialog;
        adet:=0;
        yer:=0;
        end
    else
    begin
      Memo1.SelStart:=yer-1;
      Memo1.SelLength:=Length(f);
    end;
  adet:=adet+1;
     end
      else
  begin
      b:=Pos(f,s);
      yer:=yer+b;
      while b<>0 do begin
        adet:=adet+1;
        Memo1.SelStart:=yer-1;
        Memo1.SelLength:=Length(f);
        Memo1.Seltext:=r;
        yer:=yer+Length(r)-1;
         s:= Copy(Memo1.Text,yer+1,Length(Memo1.Text)-yer+1);
         if Not ((ReplaceDialog1.Options *[frMatchCase])=[frMatchCase]) then
          s:=AnsiUpperCase(s);
        b:=Pos(f,s);
          yer:=yer+b;
        end;
        ShowMessage(IntToStr(adet)+' adet deðiþtirildi');
        ReplaceDialog1.CloseDialog;
        adet:=0;
        yer:=0;
        end;
end;

procedure TForm1.Deitir1Click(Sender: TObject);
begin
with ReplaceDialog1 do
begin
  Options:=Options+[frHideUpDown,frHideWholeWord ];
  FindText:=Memo1.SelText;
  execute;
end;
end;

procedure TForm1.Kes2Click(Sender: TObject);
begin
           Memo1.CutToClipboard;
end;

procedure TForm1.Kopyala2Click(Sender: TObject);
begin
              Memo1.CopyToClipboard;
end;

procedure TForm1.Yaptr2Click(Sender: TObject);
begin
Memo1.PasteFromClipboard;
end;

procedure TForm1.Sil1Click(Sender: TObject);
begin
memo1.SelText:='';
end;

procedure TForm1.Yeni1Click(Sender: TObject);
var FullProgPath:AnsiString;
begin
  FullProgPath:=Application.ExeName;
  WinExec(@FullProgPath[1],SW_SHOW);
  Application.Terminate;
end;

end.










