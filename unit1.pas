unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LazUtf8, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls, ExtCtrls, BCButton, SynHighlighterCss, SynEdit,
  SynHighlighterJScript, SynHighlighterHTML;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label_JS: TLabel;
    Label_CSS: TLabel;
    Label_HTML: TLabel;
    MenuItem1: TMenuItem;
    Spec_JS_1: TMenuItem;
    Menu_JS: TMenuItem;
    Save1_JS: TBCButton;
    Save1_CSS: TBCButton;
    Save1_HTML: TBCButton;
    Formatt_CSS: TBCButton;
    Formatt_JS: TBCButton;
    Open_CSS: TBCButton;
    Open_JS: TBCButton;
    Save_HTML: TBCButton;
    Open_HTML: TBCButton;
    Formatt_HTML: TBCButton;
    ch_ClearAll: TMenuItem;
    ch_utf16_t: TMenuItem;
    ch_Text_utf16: TMenuItem;
    Panel3: TPanel;
    Save_CSS: TBCButton;
    Save_JS: TBCButton;
    sl_Ukraine: TMenuItem;
    select_Lang: TMenuItem;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Syn_HTML: TSynEdit;
    Syn_JS: TSynEdit;
    MainMenu1: TMainMenu;
    Menu_Change: TMenuItem;
    Menu_Appearance: TMenuItem;
    Menu_About: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    SaveDialog1: TSaveDialog;
    SynCssSyn1: TSynCssSyn;
    Syn_CSS: TSynEdit;
    SynHTMLSyn1: TSynHTMLSyn;
    SynJScriptSyn1: TSynJScriptSyn;
    procedure ch_ClearAllClick(Sender: TObject);
    procedure ch_Text_utf16Click(Sender: TObject);
    procedure Formatt_CSSClick(Sender: TObject);
    procedure Formatt_HTMLClick(Sender: TObject);
    procedure Formatt_JSClick(Sender: TObject);
    procedure F_CSS1();
    procedure F_CSS2();
    procedure F_CSS3();
    procedure F_CSS4();
    procedure F_CSS5();
    procedure F_XML1();
    procedure F_XML2();
    procedure F_XML3();
    procedure F_XML4();
    procedure F_XML5();
    procedure F_JS1();
    procedure F_JS2();
    procedure F_JS3();
    procedure F_JS4();
    procedure F_JS5();
    procedure Menu_AboutClick(Sender: TObject);
    procedure Open_CSSClick(Sender: TObject);
    procedure Open_HTMLClick(Sender: TObject);
    procedure Open_JSClick(Sender: TObject);
    procedure Save1_CSSClick(Sender: TObject);
    procedure Save1_HTMLClick(Sender: TObject);
    procedure Save1_JSClick(Sender: TObject);
    procedure Save_CSSClick(Sender: TObject);
    procedure Save_HTMLClick(Sender: TObject);
    procedure Save_JSClick(Sender: TObject);
    procedure sl_UkraineClick(Sender: TObject);
    procedure ch_utf16_tClick(Sender: TObject);

  private

  public

  end;
type    Tutf16conv=record
    case byte of
    0:(C:UnicodeChar);
    1:(W:word);
    end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
var
 file_name_css, file_name_html, file_name_js,
      s1,s2,s3, ts, name_syn, name_format : String;

    lang_Ukr:boolean;


procedure TForm1.ch_ClearAllClick(Sender: TObject);
begin
    Syn_CSS.Clear;
    Syn_HTML.Clear;
    Syn_JS.Clear;
    if lang_Ukr=true then begin name_format:=' Поля очищені'; end else
                          begin name_format:=' Cleared';   end;

end;

procedure TForm1.ch_Text_utf16Click(Sender: TObject);
  var  T:Tutf16conv;  i1, l_m : integer;   mem0_copy : string;
begin
 mem0_copy:='';
 l_m:=0;
while  (l_m<=(Length(Syn_HTML.Text))) do begin
    s1 :=Syn_HTML.Text[l_m];   //!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
    inc(l_m);
    for i1:=33 to 126 do begin
           T.w:=i1;
           if (UTF16ToUTF8(T.c))=s1 then
           mem0_copy:=mem0_copy+'\u00'+IntToHex(i1,2);
                         end;
     end;
Syn_HTML.Text:=mem0_copy;
end;

procedure TForm1.Formatt_CSSClick(Sender: TObject);
begin
    F_CSS1();  F_CSS2();  F_CSS3();  F_CSS4();  F_CSS5();
end;

procedure TForm1.Formatt_HTMLClick(Sender: TObject);
begin
     F_XML1();       F_XML2();     F_XML3();
end;

procedure TForm1.Formatt_JSClick(Sender: TObject);
begin
   F_JS1();    F_JS2();    F_JS3();    F_JS4();    F_JS5();
end;


procedure TForm1.F_XML1();
begin
    s1 := Syn_HTML.Text;
   s2 := '><';
   s3 := '>'+#10+#$9+'<';
   ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
   Syn_HTML.Text:=ts;
end;

procedure TForm1.F_XML2();
begin
   s1 := Syn_HTML.Text;
  s2 := '" ';
  s3 := '"'+#10+#$9;
  ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
  Syn_HTML.Text:=ts;
end;

procedure TForm1.F_XML3();
begin
     s1 := Syn_HTML.Text;
   s2 := '<div';
   s3 := #10+#$9+#$9+'<div';
   ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
   Syn_HTML.Text:=ts;
end;

procedure TForm1.F_XML4();
begin
end;

procedure TForm1.F_XML5();
begin
end;

procedure TForm1.F_JS1();
 begin
   s1 := Syn_JS.Text;
   s2 := '{"';
   s3 := '{ "';
   ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
   Syn_JS.Text:=ts;
end;

procedure TForm1.F_JS2();
 begin
    s1 := Syn_JS.Text;
    s2 := ';';
    s3 := ';'+#10+#$9;
    ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
    Syn_JS.Text:=ts;
 end;

procedure TForm1.F_JS3();
 begin
    s1 := Syn_JS.Text;
    s2 := '}';
    s3 := '}'+' ';
    ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
    Syn_JS.Text:=ts;
 end;

procedure TForm1.F_JS4();
 begin
    s1 := Syn_JS.Text;
    s2 := ',';
    s3 := ','+' ';
    ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
    Syn_JS.Text:=ts;
 end;

procedure TForm1.F_JS5();
 begin
 end;

procedure TForm1.Menu_AboutClick(Sender: TObject);
begin
   if lang_Ukr=true then begin ShowMessage('Створив Володимир Недоляк https://github.com/VovcheKuss'); end else  begin
  ShowMessage('Autor Volodymyr Nedoljak https://github.com/VovcheKuss');   end;

end;

procedure TForm1.F_CSS1();
begin
    s1 := Syn_CSS.Text;
   s2 := ';';
   s3 := ';'+#10+#$9;
   ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
   Syn_CSS.Text:=ts;
end;

procedure TForm1.F_CSS2();
begin
   s1 := Syn_CSS.Text;
   s2 := '{';
   s3 := {#10+}'{'+#10+#$9;
      ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
   Syn_CSS.Text:=ts;
end;

procedure TForm1.F_CSS3();
begin
    s1 := Syn_CSS.Text;
   s2 := '}';
   s3 := #10+'}'+#10+#10+#$9;
   ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
   Syn_CSS.Text:=ts;
end;

procedure TForm1.F_CSS4();
begin
     s1 := Syn_CSS.Text;
   s2 := '*/';
   s3 := '*/'+#10;
   ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
   Syn_CSS.Text:=ts;
end;

procedure TForm1.F_CSS5();
begin
   s1 := Syn_CSS.Text;
   s2 := '/*';
   s3 := #10+'/*';
  ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
   Syn_CSS.Text:=ts;
end;

procedure TForm1.Open_CSSClick(Sender: TObject);      //-------- IMPORT CSS CODE
begin
    if OpenDialog1.Execute then begin
  Syn_CSS.Lines.LoadFromFile(OpenDialog1.FileName);
  file_name_css:= OpenDialog1.Filename;
  Label_CSS.Caption:=ExtractFileName(file_name_css);
  end;
end;

procedure TForm1.Open_HTMLClick(Sender: TObject);        //---- IMPORT HTML CODE
begin
       if OpenDialog1.Execute then begin
  Syn_HTML.Lines.LoadFromFile(OpenDialog1.FileName);
  file_name_html:= OpenDialog1.Filename;
   Label_HTML.Caption:=ExtractFileName(file_name_html);
  end;
end;

procedure TForm1.Open_JSClick(Sender: TObject);       //--------- IMPORT JS CODE
begin
    if OpenDialog1.Execute then begin
  Syn_JS.Lines.LoadFromFile(OpenDialog1.FileName);
  file_name_js:= OpenDialog1.Filename;
  Label_JS.Caption:=ExtractFileName(file_name_js);
  end;
end;

procedure TForm1.Save1_CSSClick(Sender: TObject);
begin
    Syn_CSS.Lines.SaveToFile(file_name_css);
end;

procedure TForm1.Save1_HTMLClick(Sender: TObject);
begin
    Syn_HTML.Lines.SaveToFile(file_name_html);
end;

procedure TForm1.Save1_JSClick(Sender: TObject);
begin
    Syn_JS.Lines.SaveToFile(file_name_js);
end;

procedure TForm1.Save_CSSClick(Sender: TObject);   //--------- EXXXPORT CSS CODE
begin
    if SaveDialog1.Execute then begin
    SaveDialog1.FileName:=file_name_css;
    Syn_CSS.Lines.SaveToFile(SaveDialog1.FileName);
 end;
end;

procedure TForm1.Save_HTMLClick(Sender: TObject);  //-------- EXXXPORT HTML CODE
begin
       if SaveDialog1.Execute then begin
     SaveDialog1.FileName:=file_name_html;
     Syn_HTML.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TForm1.Save_JSClick(Sender: TObject);     //--------- EXXXPORT JS CODE
begin
        if SaveDialog1.Execute then begin
     SaveDialog1.FileName:=file_name_js;
     Syn_JS.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TForm1.sl_UkraineClick(Sender: TObject);
begin
  lang_Ukr:=true;
    ch_ClearAll.Caption:='Очистити всі поля';
    sl_Ukraine.Caption:='Українська';
    select_Lang.Caption:='Вибрати мову';
    ch_utf16_t.Caption:='номер UTF16 у символ UTF16';
    Menu_Change.Caption:='Зміни';
    Menu_Appearance.Caption:='Вигляд';
    Menu_About.Caption:='Про';

end;

procedure TForm1.ch_utf16_tClick(Sender: TObject);
 var  s16 :string;
  T:Tutf16conv;
  i1 : integer;
begin
 //          \u000a
 i1:=0;
    for i1:=0 to 65535 do begin
              s1 := Syn_HTML.Text;
              s2 := '\u'+IntToHex(i1,4);
             T.w:=i1;
             s16:=UTF16ToUTF8(T.c);
             s3:= s16;
              ts := StringReplace(s1, s2, s3, [RFReplaceAll, rfIgnoreCase]);
              Syn_HTML.Text:=ts;
              end;
end;



end.

