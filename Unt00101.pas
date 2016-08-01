unit Unt00101;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, DBCtrls, ExtCtrls, RzRadGrp, RzDBRGrp,
  RzPanel, DB, RzSpnEdt, RxSplit, Vcl.Imaging.pngimage;

type
  Tfrm00101 = class(TForm)
    RzPanel1: TRzPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    RzDBRadioGroup1: TRzDBRadioGroup;
    Image1: TImage;
    RzPanel2: TRzPanel;
    RFBexcluirDepto: TRzRapidFireButton;
    Image5: TImage;
    RxSplitter1: TRxSplitter;
    RFBvoltar: TRzRapidFireButton;
    Image6: TImage;
    RFBfinalizar: TRzRapidFireButton;
    Image2: TImage;
    RzDBRadioGroup2: TRzDBRadioGroup;
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
  frm00101: Tfrm00101;

implementation

uses Unt00100, Unt00102, Unt00103, Unt00104, Unt00105,
  UntDOC, Unt_Util;

{$R *.dfm}

procedure Tfrm00101.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm00100.CDS_DEPTO.CancelUpdates;

  Action := CaFree;
end;

procedure Tfrm00101.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    PostMessage(Handle, wm_NextDlgCtl, 0, 0);
end;

procedure Tfrm00101.FormResize(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
end;

procedure Tfrm00101.RFBfinalizarClick(Sender: TObject);
begin
  RzPanel1.SetFocus;

  if (DBEdit1.Text <> '') then
  begin

    if (frm00100.CDS_DEPTO.State in [dsInsert]) then
    begin

      with frm00100.SQLQryLOC do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) QT');
        SQL.Add('FROM DEPTO');
        SQL.Add('WHERE CODEPTO = :CODEPTO');

        Params.ParamByName('CODEPTO').AsString := DBEdit1.Text;

        Open;

        if FieldByName('QT').AsCurrency > 0 then
        begin
          Mensagem('Já existe um Departamento cadastrado com esse código!',
            'W');
          DBEdit1.SetFocus;
          Abort;
        end;
      end;
    end;

    if DBEdit2.Text = '' then
    begin
      Mensagem('Favor informar um nome para o Departamento!', 'W');
      DBEdit2.SetFocus;
      Abort;
    end;

    frm00100.CDS_DEPTO.Post;
    Close;

  end
  else
  begin
    ShowMessage('Informe o código!');
  end;
end;

procedure Tfrm00101.RFBvoltarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm00101.FormCreate(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
  CarregarImagem(Image1, 'T');
end;

end.
