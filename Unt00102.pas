unit Unt00102;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB, RzPanel,
  RzSpnEdt, RxSplit, Vcl.Imaging.pngimage;

type
  Tfrm00102 = class(TForm)
    RzPanel1: TRzPanel;
    DBEdtCODIGO: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label3: TLabel;
    Image1: TImage;
    RzPanel2: TRzPanel;
    RFBexcluirDepto: TRzRapidFireButton;
    Image5: TImage;
    RFBvoltar: TRzRapidFireButton;
    Image6: TImage;
    RFBfinalizar: TRzRapidFireButton;
    Image2: TImage;
    RxSplitter1: TRxSplitter;
    RzPanel3: TRzPanel;
    LABEL_CAMINHO: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure RFBfinalizarClick(Sender: TObject);
    procedure RFBvoltarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm00102: Tfrm00102;

implementation

uses Unt00100, Unt00101, Unt00103, Unt00104, Unt00105, UntDOC, Unt_Util;

{$R *.dfm}

procedure Tfrm00102.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm00100.CDS_SEC.CancelUpdates;
  Action := CaFree;
end;

procedure Tfrm00102.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    PostMessage(Handle, wm_NextDlgCtl, 0, 0);
end;

procedure Tfrm00102.FormResize(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
end;

procedure Tfrm00102.RFBfinalizarClick(Sender: TObject);
begin
  if (DBEdtCODIGO.Text <> '') then
  begin

    if (frm00100.CDS_SEC.State in [dsInsert]) then
    begin
      DBEdtCODIGO.SetFocus;

      with frm00100.SQLQryLOC do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) QT');
        SQL.Add('FROM SECAO');
        SQL.Add('WHERE CODSEC = :CODSEC');

        Params.ParamByName('CODSEC').AsString := DBEdtCODIGO.Text;

        Open;

        if FieldByName('QT').AsCurrency > 0 then
        begin
          Mensagem('Já existe uma Seção cadastrada com esse código!', 'W');
          DBEdtCODIGO.SetFocus;
          Abort;
        end;
      end;
    end;

    if DBEdit3.Text = '' then
    begin
      Mensagem('Favor informar um nome para a Seção!', 'W');
      DBEdit3.SetFocus;
      Abort;
    end;

    frm00100.CDS_SEC.Post;
    Close;
  end
  else
  begin
    Mensagem('Informe o código!', 'W');
  end;
end;

procedure Tfrm00102.RFBvoltarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm00102.FormCreate(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
  CarregarImagem(Image1, 'T');

  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString
end;

end.
