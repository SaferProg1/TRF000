unit Unt00107;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RxSplit, Vcl.Imaging.pngimage,
  Vcl.Buttons, RzSpnEdt, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  RzPanel, DB;

type
  Tfrm00107 = class(TForm)
    Image1: TImage;
    RzPanel1: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    RzPanel2: TRzPanel;
    RFBexcluirDepto: TRzRapidFireButton;
    Image5: TImage;
    RFBvoltar: TRzRapidFireButton;
    Image6: TImage;
    RFBfinalizar: TRzRapidFireButton;
    Image2: TImage;
    RxSplitter1: TRxSplitter;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RFBfinalizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RFBvoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm00107: Tfrm00107;

implementation

{$R *.dfm}

uses Unt_Util, Unt00100;

procedure Tfrm00107.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm00100.CDS_SERVICO.CancelUpdates;
  Action := caFree;
end;

procedure Tfrm00107.FormCreate(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
  CarregarImagem(Image1, 'T');
end;

procedure Tfrm00107.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    PostMessage(Handle, wm_NextDlgCtl, 0, 0);
end;

procedure Tfrm00107.FormResize(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
end;

procedure Tfrm00107.RFBfinalizarClick(Sender: TObject);
begin
  RzPanel1.SetFocus;

  if (DBEdit1.Text <> '') then
  begin

    if (frm00100.CDS_SERVICO.State in [dsInsert]) then
    begin

      with frm00100.SQLQryLOC do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) QT');
        SQL.Add('FROM CADSERVICO');
        SQL.Add('WHERE CODSERVICO = :CODSERVICO');

        Params.ParamByName('CODSERVICO').AsString := DBEdit1.Text;

        Open;

        if FieldByName('QT').AsCurrency > 0 then
        begin
          Mensagem('Já existe um Serviço cadastrado com esse código!', 'W');
          DBEdit1.SetFocus;
          Abort;
        end;
      end;
    end;

    if DBEdit2.Text = '' then
    begin
      Mensagem('Favor informar o nome do Serviço!', 'W');
      DBEdit2.SetFocus;
      Abort;
    end;

    frm00100.CDS_SERVICO.Post;
    Close;
  end
  else
  begin
    Mensagem('Informe o Código!', 'W');
  end;
end;

procedure Tfrm00107.RFBvoltarClick(Sender: TObject);
begin
  Close;
end;

end.
