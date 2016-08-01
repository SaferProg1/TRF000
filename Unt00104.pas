unit Unt00104;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB, RzPanel,
  RzSpnEdt, RxSplit, Vcl.Imaging.pngimage;

type
  Tfrm00104 = class(TForm)
    RzPanel1: TRzPanel;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
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
  frm00104: Tfrm00104;

implementation

uses Unt00100, Unt00101, Unt00102, Unt00103, Unt00105, UntDOC, Unt_Util;

{$R *.dfm}

procedure Tfrm00104.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm00100.CDS_SUBCATEG.CancelUpdates;
  Action := CaFree;
end;

procedure Tfrm00104.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    PostMessage(Handle, wm_NextDlgCtl, 0, 0);
end;

procedure Tfrm00104.FormResize(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
end;

procedure Tfrm00104.RFBfinalizarClick(Sender: TObject);
begin
  RzPanel1.SetFocus;

  if (DBEdit6.Text <> '') then
  begin
    if (frm00100.CDS_SUBCATEG.State in [dsInsert]) then
    begin
      with frm00100.SQLQryLOC do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) QT');
        SQL.Add('FROM SUBCATEG');
        SQL.Add('WHERE CODSUBCATEG = :CODSUBCATEG');

        Params.ParamByName('CODSUBCATEG').AsString := DBEdit6.Text;

        Open;

        if FieldByName('QT').AsCurrency > 0 then
        begin
          Mensagem('Já existe uma SubCategoria cadastrada com esse Código!',
            'W');
          DBEdit6.SetFocus;
          Abort;
        end;
      end;
    end;

    if DBEdit7.Text = '' then
    begin
      Mensagem('Favor informar um nome para a SubCategoria!', 'W');
      DBEdit7.SetFocus;
      Abort;
    end;

    frm00100.CDS_SUBCATEG.Post;
    Close;
  end
  else
  begin
    Mensagem('Informe o código!', 'w');
  end;
end;

procedure Tfrm00104.RFBvoltarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm00104.FormCreate(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
  CarregarImagem(Image1, 'T');

  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString + ' > ' +
    frm00100.CDS_SECSECAO.AsString + ' > ' +
    frm00100.CDS_CATEGCATEGORIA.AsString;
end;

end.
