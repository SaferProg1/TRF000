unit Unt00103;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB, RzPanel,
  RzSpnEdt, RxSplit, Vcl.Imaging.pngimage;

type
  Tfrm00103 = class(TForm)
    RzPanel1: TRzPanel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label5: TLabel;
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
  frm00103: Tfrm00103;

implementation

uses Unt00100, Unt00101, Unt00102, Unt00104, Unt00105, UntDOC, Unt_Util;

{$R *.dfm}

procedure Tfrm00103.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm00100.CDS_CATEG.CancelUpdates;
  Action := CaFree;
end;

procedure Tfrm00103.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    PostMessage(Handle, wm_NextDlgCtl, 0, 0);
end;

procedure Tfrm00103.FormResize(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
end;

procedure Tfrm00103.RFBfinalizarClick(Sender: TObject);
begin
  RzPanel1.SetFocus;

  if (DBEdit4.Text <> '') then
  begin
    if (frm00100.CDS_CATEG.State in [dsInsert]) then
    begin
      with frm00100.SQLQryLOC do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) QT');
        SQL.Add('FROM CATEG');
        SQL.Add('WHERE CODCATEG = :CODCATEG');

        Params.ParamByName('CODCATEG').AsString := DBEdit4.Text;

        Open;

        if FieldByName('QT').AsCurrency > 0 then
        begin
          Mensagem('Já existe uma Categoria cadastrada com esse código!','W');
          DBEdit4.SetFocus;
          Abort;
        end;
      end;
    end;

    if DBEdit5.Text = '' then
    begin
      Mensagem('Favor informar um nome para a Categoria!', 'W');
      DBEdit5.SetFocus;
      Abort;
    end;

    frm00100.CDS_CATEG.Post;
    Close;
  end
  else
  begin
    Mensagem('Informe o código!','W');
  end;
end;

procedure Tfrm00103.RFBvoltarClick(Sender: TObject);
begin
  frm00100.CDS_CATEG.CancelUpdates;
  Close;
end;

procedure Tfrm00103.FormCreate(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
  CarregarImagem(Image1, 'T');

  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString + ' > ' +
    frm00100.CDS_SECSECAO.AsString;
end;

end.
