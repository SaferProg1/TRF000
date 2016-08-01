unit Unt00106;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RxSplit, Vcl.Imaging.pngimage,
  Vcl.Buttons, RzSpnEdt, RzPanel, RzRadGrp, RzDBRGrp, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, DB;

type
  Tfrm00106 = class(TForm)
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
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RFBvoltarClick(Sender: TObject);
    procedure RFBfinalizarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm00106: Tfrm00106;

implementation

{$R *.dfm}

uses Unt00100, Unt00101, Unt00102, Unt00103, Unt00104, Unt00105, UntDOC, Unt_Util;

procedure Tfrm00106.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frm00100.CDS_FAB.CancelUpdates;
  Action := caFree;
end;

procedure Tfrm00106.FormCreate(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
  CarregarImagem(Image1, 'T');
end;

procedure Tfrm00106.FormResize(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
end;

procedure Tfrm00106.FormShow(Sender: TObject);
begin
  DBRGstatus.Value := 'A';
end;

procedure Tfrm00106.RFBfinalizarClick(Sender: TObject);
begin
  RzPanel1.SetFocus;

  if (DBEdit1.Text <> '') then
  begin

    if (frm00100.CDS_FAB.State in [dsInsert]) then
    begin

      with frm00100.SQLQryLOC do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) QT');
        SQL.Add('FROM CADFABRIC');
        SQL.Add('WHERE CODFABRIC = :CODFABRIC');

        Params.ParamByName('CODFABRIC').AsString := DBEdit1.Text;

        Open;

        if FieldByName('QT').AsCurrency > 0 then
        begin
          Mensagem('Já existe um Fabricante cadastrado com esse código!', 'W');
          DBEdit1.SetFocus;
          Abort;
        end;
      end;
    end;

    if DBEdit2.Text = '' then
    begin
      Mensagem('Favor informar o nome do Fabricante!', 'W');
      DBEdit2.SetFocus;
      Abort;
    end;

    frm00100.CDS_FAB.Post;
    Close;
  end
  else
  begin
    Mensagem('Informe o código!', 'W');
  end;
end;

procedure Tfrm00106.RFBvoltarClick(Sender: TObject);
begin
  Close;
end;

end.
