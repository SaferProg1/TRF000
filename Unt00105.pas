unit Unt00105;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RxSplit, Vcl.Imaging.pngimage,
  Vcl.Buttons, RzSpnEdt, RzPanel, RzRadGrp, RzDBRGrp, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, DB;

type
  TFrm00105 = class(TForm)
    Image1: TImage;
    RzPanel1: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBRGstatus: TRzDBRadioGroup;
    RzPanel2: TRzPanel;
    RFBexcluirDepto: TRzRapidFireButton;
    Image5: TImage;
    RFBvoltar: TRzRapidFireButton;
    Image6: TImage;
    RFBfinalizar: TRzRapidFireButton;
    Image2: TImage;
    RxSplitter1: TRxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure RFBfinalizarClick(Sender: TObject);
    procedure RFBvoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm00105: TFrm00105;

implementation

{$R *.dfm}

uses Unt00100, Unt00101, Unt00102, Unt00103, Unt00104, UntDOC, Unt_Util;

procedure TFrm00105.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm00100.CDS_MARCA.CancelUpdates;
  Action := caFree;
end;

procedure TFrm00105.FormCreate(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
  CarregarImagem(Image1, 'T');
end;

procedure TFrm00105.FormResize(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
end;

procedure TFrm00105.FormShow(Sender: TObject);
begin
  DBRGstatus.Value := 'A';
end;

procedure TFrm00105.RFBfinalizarClick(Sender: TObject);
begin
  RzPanel1.SetFocus;

  if (DBEdit1.Text <> '') then
  begin

    if (frm00100.CDS_MARCA.State in [dsInsert]) then
    begin

      with frm00100.SQLQryLOC do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) QT');
        SQL.Add('FROM MARCAS');
        SQL.Add('WHERE CODIGO = :CODMARCA');

        Params.ParamByName('CODMARCA').AsString := DBEdit1.Text;

        Open;

        if FieldByName('QT').AsCurrency > 0 then
        begin
          Mensagem('Já existe uma Marca cadastrada com esse código!', 'W');
          DBEdit1.SetFocus;
          Abort;
        end;
      end;
    end;

    if DBEdit2.Text = '' then
    begin
      Mensagem('Favor informar o nome da Marca!', 'W');
      DBEdit2.SetFocus;
      Abort;
    end;

    frm00100.CDS_MARCA.Post;
    Close;
  end
  else
  begin
    Mensagem('Informe o código!', 'W');
  end;
end;

procedure TFrm00105.RFBvoltarClick(Sender: TObject);
begin
  Close;
end;

end.
