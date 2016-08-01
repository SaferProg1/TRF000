unit Unt00100;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, DB, DBTables, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, RzDBNav, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppVar, ppCtrls, ppPrnabl, ppBands,
  ppCache, ppStrtch, ppSubRpt, FMTBcd, SqlExpr, RzPanel, RzSpnEdt, jpeg,
  RzLabel, RzRadGrp, RzDBRGrp, RzTabs, ppParameter, Datasnap.Provider,
  Datasnap.DBClient, RxSplit, Vcl.Imaging.pngimage, ppDesignLayer;

type
  Tfrm00100 = class(TForm)
    pBDPlnDEPTO: TppBDEPipeline;
    pRprtDEPTO: TppReport;
    pBDPlnSECAO: TppBDEPipeline;
    pBDPlnCATEG: TppBDEPipeline;
    pBDPlnSUBCATEG: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pLblFILIAL: TppLabel;
    pLblROTINA: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel12: TppLabel;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine2: TppLine;
    SQLQryLOC: TSQLQuery;
    Image1: TImage;
    DS_SUBCATEG: TDataSource;
    CDS_SUBCATEG: TClientDataSet;
    DSP_SUBCATEG: TDataSetProvider;
    SQL_SUBCATEG: TSQLQuery;
    SQL_CATEG: TSQLQuery;
    DSP_CATEG: TDataSetProvider;
    CDS_CATEG: TClientDataSet;
    DS_CATEG: TDataSource;
    SQL_SEC: TSQLQuery;
    DSP_SEC: TDataSetProvider;
    CDS_SEC: TClientDataSet;
    DS_SEC: TDataSource;
    SQL_DEPTO: TSQLQuery;
    DSP_DEPTO: TDataSetProvider;
    CDS_DEPTO: TClientDataSet;
    DS_DEPTO: TDataSource;
    P_MENUINFERIOR: TRzPanel;
    RFBimprimir: TRzRapidFireButton;
    RFBsair: TRzRapidFireButton;
    imgCobranca: TImage;
    imgPlanoPagto: TImage;
    RxSplitter7: TRxSplitter;
    CDS_DEPTOCODEPTO: TWideStringField;
    CDS_DEPTODEPARTAMENTO: TWideStringField;
    CDS_DEPTOTIPO: TWideStringField;
    CDS_SECCODSEC: TWideStringField;
    CDS_SECCODEPTO: TWideStringField;
    CDS_SECSECAO: TWideStringField;
    CDS_CATEGCODCATEG: TWideStringField;
    CDS_CATEGCODSEC: TWideStringField;
    CDS_CATEGCODEPTO: TWideStringField;
    CDS_CATEGCATEGORIA: TWideStringField;
    CDS_SUBCATEGCODSUBCATEG: TWideStringField;
    CDS_SUBCATEGCODCATEG: TWideStringField;
    CDS_SUBCATEGCODSEC: TWideStringField;
    CDS_SUBCATEGCODEPTO: TWideStringField;
    CDS_SUBCATEGSUBCATEGORIA: TWideStringField;
    P1_DEPTO: TRzPanel;
    RzRapidFireButton13: TRzRapidFireButton;
    RzRapidFireButton14: TRzRapidFireButton;
    P_PRINCIPAL: TRzPanel;
    P_MENUSUPERIOR: TRzPanel;
    RFBdepto: TRzRapidFireButton;
    RFBsec: TRzRapidFireButton;
    imgDepto: TImage;
    imgSec: TImage;
    LABEL_PRINCIPAL: TLabel;
    RxSplitter3: TRxSplitter;
    RxSplitter4: TRxSplitter;
    RxSplitter6: TRxSplitter;
    RxSplitter8: TRxSplitter;
    RzPanel2: TRzPanel;
    RFBnovoDepto: TRzRapidFireButton;
    RFBexcluirDepto: TRzRapidFireButton;
    Image4: TImage;
    Image5: TImage;
    RxSplitter1: TRxSplitter;
    DBGrid2: TDBGrid;
    RFBalterarDepto: TRzRapidFireButton;
    Image6: TImage;
    P2_SEC: TRzPanel;
    RzPanel1: TRzPanel;
    RFBmovoSec: TRzRapidFireButton;
    RFBexcluirSec: TRzRapidFireButton;
    Image2: TImage;
    Image3: TImage;
    RFBalterarSec: TRzRapidFireButton;
    Image7: TImage;
    RxSplitter2: TRxSplitter;
    DBGrid3: TDBGrid;
    RFBcateg: TRzRapidFireButton;
    RFBsubcateg: TRzRapidFireButton;
    imgCateg: TImage;
    imgSubCateg: TImage;
    RxSplitter5: TRxSplitter;
    RxSplitter9: TRxSplitter;
    P3_CATEG: TRzPanel;
    P4_SUBCATEG: TRzPanel;
    DBGrid4: TDBGrid;
    RzPanel3: TRzPanel;
    RFBnovoCateg: TRzRapidFireButton;
    RFBexcluirCateg: TRzRapidFireButton;
    Image8: TImage;
    Image9: TImage;
    RFBalterarCateg: TRzRapidFireButton;
    Image10: TImage;
    RxSplitter10: TRxSplitter;
    RzPanel4: TRzPanel;
    RFBnovoSubCateg: TRzRapidFireButton;
    RFBexcluirSubCateg: TRzRapidFireButton;
    Image11: TImage;
    Image12: TImage;
    RFBalterarSubCateg: TRzRapidFireButton;
    Image13: TImage;
    RxSplitter11: TRxSplitter;
    DBGrid6: TDBGrid;
    CDS_DEPTOTIPOPROD: TWideStringField;
    P_MARCAFAB: TRzPanel;
    RFBmarca: TRzRapidFireButton;
    RFBfabricante: TRzRapidFireButton;
    imgMarca: TImage;
    imgFabricante: TImage;
    RxSplitter12: TRxSplitter;
    RxSplitter13: TRxSplitter;
    RxSplitter14: TRxSplitter;
    RxSplitter15: TRxSplitter;
    LABEL_CAMINHO: TLabel;
    P5_MARCA: TRzPanel;
    RzPanel6: TRzPanel;
    RFBnovoMarca: TRzRapidFireButton;
    Image16: TImage;
    RFBalterarMarca: TRzRapidFireButton;
    Image18: TImage;
    RxSplitter16: TRxSplitter;
    P6_FABRICANTE: TRzPanel;
    RzPanel7: TRzPanel;
    RFBnovoFab: TRzRapidFireButton;
    Image19: TImage;
    RFBalterarFab: TRzRapidFireButton;
    Image21: TImage;
    RxSplitter17: TRxSplitter;
    DBGrid5: TDBGrid;
    DS_MARCA: TDataSource;
    CDS_MARCA: TClientDataSet;
    DSP_MARCA: TDataSetProvider;
    SQL_MARCA: TSQLQuery;
    CDS_MARCACODIGO: TFMTBCDField;
    CDS_MARCADESCRICAO: TWideStringField;
    CDS_MARCASTATUS: TWideStringField;
    DBGrid1: TDBGrid;
    DS_FAB: TDataSource;
    CDS_FAB: TClientDataSet;
    DSP_FAB: TDataSetProvider;
    SQL_FAB: TSQLQuery;
    CDS_FABCODFABRIC: TFMTBCDField;
    CDS_FABFABRICANTE: TWideStringField;
    CDS_FABFANTASIA: TWideStringField;
    CDS_FABTELEFONE: TWideStringField;
    CDS_FABSTATUS: TWideStringField;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    PPRmarca: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppDesignLayers8: TppDesignLayers;
    ppDesignLayer8: TppDesignLayer;
    ppParameterList2: TppParameterList;
    BDEPLmarca: TppBDEPipeline;
    ppBDEPfab: TppBDEPipeline;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel15: TppLabel;
    ppDBCalc1: TppDBCalc;
    PPRfab: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine4: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel26: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppLabel27: TppLabel;
    ppDBText14: TppDBText;
    ppLabel28: TppLabel;
    ppDBText15: TppDBText;
    RFBSERVICO: TRzRapidFireButton;
    imgServico: TImage;
    RxSplitter18: TRxSplitter;
    P7_SERVICO: TRzPanel;
    RzPanel5: TRzPanel;
    RzRpdFrBtnNOVO_SERV: TRzRapidFireButton;
    Image15: TImage;
    RzRpdFrBtnEDIT_SERV: TRzRapidFireButton;
    Image20: TImage;
    RxSplitter19: TRxSplitter;
    DBGrid7: TDBGrid;
    SQL_SERVICO: TSQLQuery;
    DSP_SERVICO: TDataSetProvider;
    CDS_SERVICO: TClientDataSet;
    DS_SERVICO: TDataSource;
    CDS_SERVICOCODSERVICO: TFMTBCDField;
    CDS_SERVICODESCRICAO: TWideStringField;
    CDS_SERVICOUNIDADE: TWideStringField;
    CDS_SERVICOINDICE: TFMTBCDField;
    CDS_SERVICOOP: TWideStringField;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure RzRpdFrBttnNOVOClick(Sender: TObject);
    procedure RzRpdFrBttnALTERARClick(Sender: TObject);
    procedure RzRpdFrBttnIMPRIMIRClick(Sender: TObject);
    procedure RzRpdFrBttnCANCELARClick(Sender: TObject);
    procedure RzRpdFrBttnSAIRClick(Sender: TObject);
    procedure RFBnovoDeptoClick(Sender: TObject);
    procedure RFBexcluirDeptoClick(Sender: TObject);
    procedure RFBalterarDeptoClick(Sender: TObject);
    procedure DS_DEPTOStateChange(Sender: TObject);
    procedure CDS_DEPTOAfterPost(DataSet: TDataSet);
    procedure CDS_DEPTOAfterScroll(DataSet: TDataSet);
    procedure CDS_SECAfterPost(DataSet: TDataSet);
    procedure CDS_SECAfterScroll(DataSet: TDataSet);
    procedure CDS_SECBeforePost(DataSet: TDataSet);
    procedure CDS_CATEGAfterPost(DataSet: TDataSet);
    procedure CDS_CATEGAfterScroll(DataSet: TDataSet);
    procedure CDS_CATEGBeforePost(DataSet: TDataSet);
    procedure CDS_SUBCATEGAfterPost(DataSet: TDataSet);
    procedure CDS_SUBCATEGBeforePost(DataSet: TDataSet);
    procedure AtivarTela(viTela: integer);
    procedure RFBdeptoClick(Sender: TObject);
    procedure RFBsecClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function Verificar_Item_Cadastrado(Const vsTABELA,
      vsCODIGO: String): Boolean;
    procedure RFBsairClick(Sender: TObject);
    procedure RFBmovoSecClick(Sender: TObject);
    procedure RFBalterarSecClick(Sender: TObject);
    procedure RFBexcluirSecClick(Sender: TObject);
    procedure RFBcategClick(Sender: TObject);
    procedure RFBsubcategClick(Sender: TObject);
    procedure RFBnovoCategClick(Sender: TObject);
    procedure RFBalterarCategClick(Sender: TObject);
    procedure RFBexcluirCategClick(Sender: TObject);
    procedure RFBexcluirSubCategClick(Sender: TObject);
    procedure RFBnovoSubCategClick(Sender: TObject);
    procedure RFBalterarSubCategClick(Sender: TObject);
    procedure RFBnovoMarcaClick(Sender: TObject);
    procedure RFBalterarMarcaClick(Sender: TObject);
    procedure RFBmarcaClick(Sender: TObject);
    procedure CDS_MARCAAfterPost(DataSet: TDataSet);
    procedure RFBnovoFabClick(Sender: TObject);
    procedure RFBalterarFabClick(Sender: TObject);
    procedure RFBfabricanteClick(Sender: TObject);
    procedure CDS_FABAfterPost(DataSet: TDataSet);
    procedure RFBimprimirClick(Sender: TObject);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure ppHeaderBand3BeforePrint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RzRpdFrBtnNOVO_SERVClick(Sender: TObject);
    procedure CDS_SERVICOAfterPost(DataSet: TDataSet);
    procedure RzRpdFrBtnEDIT_SERVClick(Sender: TObject);
    procedure RFBSERVICOClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm00100: Tfrm00100;
  viTelaAtual: integer;

implementation

uses Unt00101, Unt00102, Unt00103, Unt00104, Unt00105, UntDOC, Unt00106,
  Unt_Conexao, Unt_Util, Unt00107;

{$R *.dfm}

procedure Tfrm00100.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm00100.FormCreate(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
  Caption := CaptionTela('v.09.1.06.16');
  CarregarImagem(Image1, 'L');
end;

procedure Tfrm00100.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CDS_DEPTO.Close;
  CDS_SEC.Close;
  CDS_CATEG.Close;
  CDS_SUBCATEG.Close;
  CDS_MARCA.Close;
  CDS_FAB.Close;
  CDS_SERVICO.Close;

  Action := CaFree;
end;

procedure Tfrm00100.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    PostMessage(Handle, wm_NextDlgCtl, 0, 0);
end;

procedure Tfrm00100.FormResize(Sender: TObject);
begin
  AjustarTela(Self, Monitor.Width, Monitor.Height);
end;

procedure Tfrm00100.FormShow(Sender: TObject);
begin
  RFBdeptoClick(Self);
end;

procedure Tfrm00100.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  // Empresa
  pLblFILIAL.Caption := DM_CONEXAO.SQL_PARAMETROCODFILIAL.AsString + '-' +
    DM_CONEXAO.SQL_PARAMETROFILIAL.AsString;
  // Rotina
  pLblROTINA.Caption := Caption;
end;

procedure Tfrm00100.ppHeaderBand2BeforePrint(Sender: TObject);
begin
  // Empresa
  ppLabel18.Caption := DM_CONEXAO.SQL_PARAMETROCODFILIAL.AsString + '-' +
    DM_CONEXAO.SQL_PARAMETROFILIAL.AsString;
  // Rotina
  ppLabel19.Caption := Caption;
end;

procedure Tfrm00100.ppHeaderBand3BeforePrint(Sender: TObject);
begin
  // Empresa
  ppLabel23.Caption := DM_CONEXAO.SQL_PARAMETROCODFILIAL.AsString + '-' +
    DM_CONEXAO.SQL_PARAMETROFILIAL.AsString;
  // Rotina
  ppLabel24.Caption := Caption;
end;

procedure Tfrm00100.ppDetailBand1BeforePrint(Sender: TObject);
begin
  // Selecionar Seções desse Departamento
  with SQL_SEC do
  begin
    Close;
    ParamByName('CODEPTO').AsString := CDS_DEPTOCODEPTO.AsString;
    Open;
  end;
end;

procedure Tfrm00100.ppDetailBand2BeforePrint(Sender: TObject);
begin
  // Categoria
  with SQL_CATEG do
  begin
    Close;
    ParamByName('CODEPTO').AsString := CDS_DEPTOCODEPTO.AsString;
    ParamByName('CODSEC').AsString := CDS_SECCODSEC.AsString;
    Open;
  end;
end;

procedure Tfrm00100.ppDetailBand3BeforePrint(Sender: TObject);
begin
  // SubCategoria
  with SQL_SUBCATEG do
  begin
    Close;
    ParamByName('CODEPTO').AsString := CDS_DEPTOCODEPTO.AsString;
    ParamByName('CODSEC').AsString := CDS_SECCODSEC.AsString;
    ParamByName('CODCATEG').AsString := CDS_CATEGCODCATEG.AsString;
    Open;
  end;
end;

procedure Tfrm00100.ppDetailBand6BeforePrint(Sender: TObject);
begin
  // Empresa
  pLblFILIAL.Caption := DM_CONEXAO.SQL_PARAMETROCODFILIAL.AsString + '-' +
    DM_CONEXAO.SQL_PARAMETROFILIAL.AsString;
  // Rotina
  pLblROTINA.Caption := Caption;
end;

function Tfrm00100.Verificar_Item_Cadastrado(const vsTABELA,
  vsCODIGO: String): Boolean;
var
  vbQTENCONTRADA: Boolean;
begin
  //
  vbQTENCONTRADA := False;

  //
  if vsTABELA = 'SECAO' then
  begin
    with SQLQryLOC do
    begin
      Close;
      SQL.Clear;

      SQL.Add('SELECT COUNT(CODSEC) QUT');
      SQL.Add('FROM SECAO');
      SQL.Add('WHERE CODEPTO = :CODEPTO');

      Params.ParamByName('CODEPTO').AsString := vsCODIGO;

      Open;

      if FieldByName('QUT').AsCurrency <> 0 then
        vbQTENCONTRADA := True;
    end;
  end;

  //
  if vsTABELA = 'CATEG' then
  begin
    with SQLQryLOC do
    begin
      Close;
      SQL.Clear;

      SQL.Add('SELECT COUNT(CODSEC) QUT');
      SQL.Add('FROM CATEG');
      SQL.Add('WHERE CODSEC = :CODSEC');

      Params.ParamByName('CODSEC').AsString := vsCODIGO;

      Open;

      if FieldByName('QUT').AsCurrency <> 0 then
        vbQTENCONTRADA := True;
    end;
  end;

  //
  if vsTABELA = 'SUBCATEG' then
  begin
    with SQLQryLOC do
    begin
      Close;
      SQL.Clear;

      SQL.Add('SELECT COUNT(CODCATEG) QUT');
      SQL.Add('FROM SUBCATEG');
      SQL.Add('WHERE CODCATEG = :CODCATEG');

      Params.ParamByName('CODCATEG').AsString := vsCODIGO;

      Open;

      if FieldByName('QUT').AsCurrency <> 0 then
        vbQTENCONTRADA := True;
    end;
  end;

  //
  if vsTABELA = 'SERVICO' then
  begin
    with SQLQryLOC do
    begin
      Close;
      SQL.Clear;

      SQL.Add('SELECT COUNT(CODSERVICO) AS QUT');
      SQL.Add('  FROM CADSERVICO');
      SQL.Add(' WHERE CODSERVICO = :CODSERVICO');

      Params.ParamByName('CODSERVICO').AsString := vsCODIGO;

      Open;

      if FieldByName('QUT').AsCurrency <> 0 then
        vbQTENCONTRADA := True;
    end;
  end;

  Result := vbQTENCONTRADA;
end;

procedure Tfrm00100.RzRpdFrBttnNOVOClick(Sender: TObject);
begin
  // Insere Departamento
  CDS_DEPTO.Insert;
  // Insere Seção
  CDS_SEC.Insert;
  // Insere Categoria
  CDS_CATEG.Insert;
  // Insere SubCategoria
  CDS_SUBCATEG.Insert;
  // Insere Serviço
  CDS_SERVICO.Insert;
end;

procedure Tfrm00100.RzRpdFrBtnEDIT_SERVClick(Sender: TObject);
begin
  if CDS_SERVICOCODSERVICO.AsCurrency = 0 then
  begin
    Mensagem('Nenhum Serviço selecionado!', 'W');
    Abort;
  end;

  Frm00107 := TFrm00107.Create(Application);

  if Verificar_Item_Cadastrado('SERVICO', CDS_SERVICOCODSERVICO.AsString) then
  begin
    Frm00107.DBEdit1.Enabled := False;
  end;

  CDS_SERVICO.Edit;
  Frm00107.Caption := 'Alterar Serviço  ';
  Frm00107.ShowModal;
end;

procedure Tfrm00100.RzRpdFrBtnNOVO_SERVClick(Sender: TObject);
begin
  CDS_SERVICO.Insert;

  Frm00107 := TFrm00107.Create(Application);
  Frm00107.Caption := 'Cadastrar Novo Serviço  ';
  Frm00107.ShowModal;
end;

procedure Tfrm00100.RzRpdFrBttnALTERARClick(Sender: TObject);
begin
  // Edita departamento
  // if vnGride = 1 then
  CDS_DEPTO.Edit;
  // Edita seção
  // if vnGride = 2 then
  CDS_SEC.Edit;
  // Edita categoria
  // if vnGride = 3 then
  CDS_CATEG.Edit;
  // Edita Subcategoria
  // if vnGride = 4 then
  CDS_SUBCATEG.Edit;

  CDS_SERVICO.Edit;
end;

procedure Tfrm00100.RzRpdFrBttnIMPRIMIRClick(Sender: TObject);
begin
  pRprtDEPTO.Print;
end;

procedure Tfrm00100.RzRpdFrBttnCANCELARClick(Sender: TObject);
begin

  CDS_DEPTO.CancelUpdates;

  CDS_SEC.CancelUpdates;

  CDS_CATEG.CancelUpdates;

  CDS_SUBCATEG.CancelUpdates;

  CDS_SERVICO.CancelUpdates;

end;

procedure Tfrm00100.DS_DEPTOStateChange(Sender: TObject);
begin
  RFBimprimir.Enabled := (Sender as TDataSource).State in [dsBrowse];
  RFBsair.Enabled := (Sender as TDataSource).State in [dsBrowse];
end;

procedure Tfrm00100.RzRpdFrBttnSAIRClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm00100.CDS_CATEGAfterPost(DataSet: TDataSet);
begin
  CDS_CATEG.ApplyUpdates(-1);
end;

procedure Tfrm00100.CDS_CATEGAfterScroll(DataSet: TDataSet);
begin
  // SubCategoria
  CDS_SUBCATEG.Close;

  with SQL_SUBCATEG do
  begin
    Close;
    ParamByName('CODEPTO').AsString := CDS_DEPTOCODEPTO.AsString;
    ParamByName('CODSEC').AsString := CDS_SECCODSEC.AsString;
    ParamByName('CODCATEG').AsString := CDS_CATEGCODCATEG.AsString;
  end;

  CDS_SUBCATEG.Open;

  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString + ' > ' +
    frm00100.CDS_SECSECAO.AsString + ' > ' +
    frm00100.CDS_CATEGCATEGORIA.AsString;
end;

procedure Tfrm00100.CDS_CATEGBeforePost(DataSet: TDataSet);
begin
  if DS_CATEG.State = dsINSERT then
  begin
    CDS_CATEGCODEPTO.Value := CDS_DEPTOCODEPTO.AsString;
    CDS_CATEGCODSEC.Value := CDS_SECCODSEC.AsString;
  end;
end;

procedure Tfrm00100.CDS_DEPTOAfterPost(DataSet: TDataSet);
begin
  CDS_DEPTO.ApplyUpdates(-1);
end;

procedure Tfrm00100.CDS_DEPTOAfterScroll(DataSet: TDataSet);
begin
  CDS_SEC.Close;

  with SQL_SEC do
  begin
    Close;
    ParamByName('CODEPTO').AsString := CDS_DEPTOCODEPTO.AsString;
  end;

  CDS_SEC.Open;

  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString;
end;

procedure Tfrm00100.CDS_FABAfterPost(DataSet: TDataSet);
begin
  CDS_FAB.ApplyUpdates(-1);
end;

procedure Tfrm00100.CDS_MARCAAfterPost(DataSet: TDataSet);
begin
  CDS_MARCA.ApplyUpdates(-1);
end;

procedure Tfrm00100.CDS_SECAfterPost(DataSet: TDataSet);
begin
  CDS_SEC.ApplyUpdates(-1);
end;

procedure Tfrm00100.CDS_SECAfterScroll(DataSet: TDataSet);
begin
  CDS_CATEG.Close;

  with SQL_CATEG do
  begin
    Close;
    ParamByName('CODEPTO').AsString := CDS_DEPTOCODEPTO.AsString;
    ParamByName('CODSEC').AsString := CDS_SECCODSEC.AsString;
  end;

  CDS_CATEG.Open;

  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString + ' > ' +
    frm00100.CDS_SECSECAO.AsString;
end;

procedure Tfrm00100.CDS_SECBeforePost(DataSet: TDataSet);
begin
  if DS_SEC.State = dsINSERT then
    CDS_SECCODEPTO.Value := CDS_DEPTOCODEPTO.AsString;
end;

procedure Tfrm00100.CDS_SERVICOAfterPost(DataSet: TDataSet);
begin
  CDS_SERVICO.ApplyUpdates(-1);
end;

procedure Tfrm00100.CDS_SUBCATEGAfterPost(DataSet: TDataSet);
begin
  CDS_SUBCATEG.ApplyUpdates(-1);
end;

procedure Tfrm00100.CDS_SUBCATEGBeforePost(DataSet: TDataSet);
begin
  if DS_SUBCATEG.State = dsINSERT then
  begin
    CDS_SUBCATEGCODEPTO.Value := CDS_DEPTOCODEPTO.AsString;
    CDS_SUBCATEGCODSEC.Value := CDS_SECCODSEC.AsString;
    CDS_SUBCATEGCODCATEG.Value := CDS_CATEGCODCATEG.AsString;
  end;
end;

procedure Tfrm00100.RFBnovoDeptoClick(Sender: TObject);
begin
  CDS_DEPTO.Insert;

  Frm00101 := TFrm00101.Create(Application);
  Frm00101.Caption := 'Cadastrar Novo Departamento  ';
  Frm00101.ShowModal;
end;

procedure Tfrm00100.RFBnovoFabClick(Sender: TObject);
begin
  CDS_FAB.Insert;

  Frm00106 := TFrm00106.Create(Application);
  Frm00106.Caption := 'Cadastrar Novo Fabricante  ';
  Frm00106.ShowModal;
end;

procedure Tfrm00100.RFBnovoMarcaClick(Sender: TObject);
begin
  CDS_MARCA.Insert;

  Frm00105 := TFrm00105.Create(Application);
  Frm00105.Caption := 'Cadastrar Nova Marca  ';
  Frm00105.ShowModal;
end;

procedure Tfrm00100.RFBnovoSubCategClick(Sender: TObject);
begin
  if CDS_CATEGCODCATEG.AsString = '' then
  begin
    Mensagem('Localize uma Categoria antes de cadastrar uma SubCategoria!',
      'W');
    Abort;
  end;

  CDS_SUBCATEG.Insert;

  Frm00104 := TFrm00104.Create(Application);
  Frm00104.Caption := 'Cadastrar Nova SubCategoria  ';
  Frm00104.ShowModal;
end;

procedure Tfrm00100.RFBsairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm00100.RFBsecClick(Sender: TObject);
begin
  if CDS_DEPTOCODEPTO.AsString = '' then
  begin
    Mensagem('Nenhum departamento Selecionado!', 'W');
    Abort;
  end;

  AtivarTela(2);

  CDS_SEC.Open;
  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString + ' > ' +
    frm00100.CDS_SECSECAO.AsString;
end;

procedure Tfrm00100.RFBSERVICOClick(Sender: TObject);
begin
  AtivarTela(7);
  CDS_SERVICO.Open;

  LABEL_CAMINHO.Caption := '';
end;

procedure Tfrm00100.RFBsubcategClick(Sender: TObject);
begin
  if CDS_CATEGCODCATEG.AsString = '' then
  begin
    Mensagem('Nenhuma Categoria Selecionada!', 'W');
    Abort;
  end;

  AtivarTela(4);
  CDS_SUBCATEG.Open;

  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString + ' > ' +
    frm00100.CDS_SECSECAO.AsString + ' > ' +
    frm00100.CDS_CATEGCATEGORIA.AsString;
end;

procedure Tfrm00100.RFBexcluirCategClick(Sender: TObject);
begin
  // Categoria
  if not Verificar_Item_Cadastrado('SUBCATEG', CDS_CATEGCODCATEG.AsString) then
  begin
    if Mensagem('Confirma a remoção da Categoria?', 'C') then
      CDS_CATEG.Delete;
  end
  else
  begin
    Mensagem('A Categoria não pode ser excluida, pois possui SubCategorias cadastradas',
      'W');
    Abort;
  end;
end;

procedure Tfrm00100.RFBexcluirDeptoClick(Sender: TObject);
begin
  // Depto
  if not Verificar_Item_Cadastrado('SECAO', CDS_DEPTOCODEPTO.AsString) then
  begin
    if Mensagem('Confirma remoção do departamento?', 'C') then
      CDS_DEPTO.Delete;
  end
  else
  begin
    Mensagem('A seção não pode ser excluida, pois possui Categorias cadastradas',
      'W');
    Abort;
  end;
end;

procedure Tfrm00100.RFBexcluirSecClick(Sender: TObject);
begin
  // Seção

  if not Verificar_Item_Cadastrado('CATEG', CDS_SECCODSEC.AsString) then
  begin
    if Mensagem('Confirma a remoção da Seção?', 'C') then
      CDS_SEC.Delete;
  end
  else
  begin
    Mensagem('A seção não pode ser excluida, pois possui Categorias cadastradas',
      'W');
    Abort;
  end;
end;

procedure Tfrm00100.RFBexcluirSubCategClick(Sender: TObject);
begin
  // SubCategoria
  if Mensagem('Confirma a remoção da SubCategoria?', 'C') then
    CDS_SUBCATEG.Delete;
end;

procedure Tfrm00100.RFBfabricanteClick(Sender: TObject);
begin
  AtivarTela(6);
  CDS_FAB.Open;

  LABEL_CAMINHO.Caption := '';
end;

procedure Tfrm00100.RFBimprimirClick(Sender: TObject);
begin
  case viTelaAtual of
    1 .. 4:
      pRprtDEPTO.Print;

    5:
      begin
        CDS_MARCA.Close;
        with SQL_MARCA do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT CODIGO, DESCRICAO, STATUS');
          SQL.Add(' FROM MARCAS WHERE STATUS = ''A''');
          SQL.Add(' ORDER BY CODIGO');
        end;
        CDS_MARCA.Open;

        PPRmarca.Print;

        CDS_MARCA.Close;
        with SQL_MARCA do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT CODIGO, DESCRICAO, STATUS');
          SQL.Add(' FROM MARCAS ORDER BY CODIGO');
        end;
        CDS_MARCA.Open;
      end;
    6:
      Begin
        CDS_FAB.Close;
        with SQL_FAB do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT CODFABRIC, FABRICANTE, FANTASIA, TELEFONE, STATUS');
          SQL.Add('  FROM CADFABRIC WHERE STATUS = ''A''');
          SQL.Add('  ORDER BY CODFABRIC');
        end;
        CDS_FAB.Open;

        PPRfab.Print;

        CDS_FAB.Close;
        with SQL_FAB do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT CODFABRIC, FABRICANTE, FANTASIA, TELEFONE, STATUS');
          SQL.Add('FROM CADFABRIC ORDER BY CODFABRIC');
        end;
        CDS_FAB.Open;




      End;
  end;
end;

procedure Tfrm00100.RFBmarcaClick(Sender: TObject);
begin
  AtivarTela(5);
  CDS_MARCA.Open;

  LABEL_CAMINHO.Caption := '';
end;

procedure Tfrm00100.RFBmovoSecClick(Sender: TObject);
begin
  if CDS_DEPTOCODEPTO.AsString = '' then
  begin
    Mensagem('Localize primeiro um Departamento antes de cadstrar uma seção!',
      'W');
    Abort;
  end;

  CDS_SEC.Insert;

  Frm00102 := TFrm00102.Create(Application);
  Frm00102.Caption := 'Cadastrar Nova Seção  ';
  Frm00102.ShowModal;
end;

procedure Tfrm00100.RFBalterarDeptoClick(Sender: TObject);
begin

  if CDS_DEPTOCODEPTO.AsString = '' then
  begin
    Mensagem('Nenhum Departamento selecionado!', 'W');
    Abort;
  end;

  Frm00101 := TFrm00101.Create(Application);

  if Verificar_Item_Cadastrado('SECAO', CDS_DEPTOCODEPTO.AsString) then
  begin
    Frm00101.DBEdit1.Enabled := False;
  end;

  CDS_DEPTO.Edit;
  Frm00101.Caption := 'Alterar Departamento  ';
  Frm00101.ShowModal;
end;

procedure Tfrm00100.RFBalterarFabClick(Sender: TObject);
begin

  if CDS_FABCODFABRIC.AsString = '' then
  begin
    Mensagem('Nenum Fabricante selecionado!', 'W');
    Abort;
  end;

  Frm00106 := TFrm00106.Create(Application);

  with frm00100.SQLQryLOC do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) QT');
    SQL.Add('FROM PRODUTO');
    SQL.Add('WHERE CODFABRIC = :CODFABRIC');

    Params.ParamByName('CODFABRIC').AsString := CDS_FABCODFABRIC.AsString;

    Open;

    if FieldByName('QT').AsCurrency > 0 then
    begin
      Mensagem('Existem Produtos vinculados a esse fabricante', 'W');
      Frm00106.DBEdit1.Enabled := False;
      Frm00106.DBRGstatus.Enabled := False;
    end;
  end;

  CDS_FAB.Edit;
  Frm00106.Caption := 'Alterar Fabricante  ';
  Frm00106.ShowModal;
end;

procedure Tfrm00100.RFBalterarMarcaClick(Sender: TObject);
begin
  if CDS_MARCACODIGO.AsString = '' then
  begin
    Mensagem('Nenuma Marca selecionada!', 'W');
    Abort;
  end;

  Frm00105 := TFrm00105.Create(Application);

  with frm00100.SQLQryLOC do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) QT');
    SQL.Add('FROM PRODUTO');
    SQL.Add('WHERE CODMARCA = :CODMARCA');

    Params.ParamByName('CODMARCA').AsString := CDS_MARCACODIGO.AsString;

    Open;

    if FieldByName('QT').AsCurrency > 0 then
    begin
      Mensagem('Existem Produtos vinculados a essa Marca', 'W');
      Frm00105.DBEdit1.Enabled := False;
      Frm00105.DBRGstatus.Enabled := False;
    end;
  end;

  CDS_MARCA.Edit;
  Frm00105.Caption := 'Alterar Marca  ';
  Frm00105.ShowModal;
end;

procedure Tfrm00100.RFBalterarSecClick(Sender: TObject);
begin

  if CDS_SECCODSEC.AsString = '' then
  begin
    Mensagem('Nenhuma seção selecionada!', 'W');
    Abort;
  end;

  Frm00102 := TFrm00102.Create(Application);

  if Verificar_Item_Cadastrado('CATEG', CDS_SECCODSEC.AsString) then
  begin
    Frm00102.DBEdtCODIGO.Enabled := False;
  end;

  CDS_SEC.Edit;
  Frm00102.Caption := 'Alterar Seção  ';
  Frm00102.ShowModal;
end;

procedure Tfrm00100.RFBalterarSubCategClick(Sender: TObject);
begin
  if CDS_SUBCATEGCODSUBCATEG.AsString = '' then
  begin
    Mensagem('Nenhuma SubCategoria selecionada!', 'W');
    Abort;
  end;

  CDS_SUBCATEG.Edit;
  Frm00104 := TFrm00104.Create(Application);
  Frm00104.Caption := 'Alterar SubCategoria  ';
  Frm00104.ShowModal;
end;

procedure Tfrm00100.RFBcategClick(Sender: TObject);
begin
  if CDS_SECCODSEC.AsString = '' then
  begin
    Mensagem('Nenhuma Seção selecionada!', 'W');
    Abort;
  end;

  AtivarTela(3);
  CDS_CATEG.Open;

  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString + ' > ' +
    frm00100.CDS_SECSECAO.AsString + ' > ' +
    frm00100.CDS_CATEGCATEGORIA.AsString;
end;

procedure Tfrm00100.RFBdeptoClick(Sender: TObject);
begin
  AtivarTela(1);
  CDS_DEPTO.Open;

  LABEL_CAMINHO.Caption := frm00100.CDS_DEPTODEPARTAMENTO.AsString;
end;

procedure Tfrm00100.RFBnovoCategClick(Sender: TObject);
begin
  if CDS_SECCODSEC.AsString = '' then
  begin
    Mensagem('Localize primeiro uma Seção antes de cadstrar uma Categoria!',
      'W');
    Abort;
  end;

  CDS_CATEG.Insert;

  Frm00103 := TFrm00103.Create(Application);
  Frm00103.Caption := Caption;
  Frm00103.ShowModal;
end;

procedure Tfrm00100.RFBalterarCategClick(Sender: TObject);
begin

  if CDS_CATEGCODCATEG.AsString = '' then
  begin
    Mensagem('Nenhuma Categoria Selecionada!', 'W');
    Abort;
  end;

  Frm00103 := TFrm00103.Create(Application);

  if Verificar_Item_Cadastrado('SUBCATEG', CDS_CATEGCODCATEG.AsString) then
  begin
    Frm00103.DBEdit4.Enabled := False;
  end;

  CDS_CATEG.Edit;
  Frm00103.Caption := Caption;
  Frm00103.ShowModal;
end;

procedure Tfrm00100.AtivarTela(viTela: integer);
begin
  case viTela of
    1:
      begin
        viTelaAtual := 1;
        LABEL_PRINCIPAL.Caption := 'Cadastrar Departamento';
        RFBdepto.Enabled := False;
        RFBsec.Enabled := True;
        RFBcateg.Enabled := True;
        RFBsubcateg.Enabled := True;
        RFBmarca.Enabled := True;
        RFBfabricante.Enabled := True;
        RFBSERVICO.Enabled := True;

        imgDepto.Enabled := False;
        imgSec.Enabled := True;
        imgCateg.Enabled := True;
        imgSubCateg.Enabled := True;
        imgMarca.Enabled := True;
        imgFabricante.Enabled := True;
        imgServico.Enabled := True;

        P1_DEPTO.Visible := True;
        P2_SEC.Visible := False;
        P3_CATEG.Visible := False;
        P4_SUBCATEG.Visible := False;
        P5_MARCA.Visible := False;
        P6_FABRICANTE.Visible := False;
        P7_SERVICO.Visible := False;
      end;
    2:
      begin
        viTelaAtual := 2;
        LABEL_PRINCIPAL.Caption := 'Cadastrar Seção';
        RFBdepto.Enabled := True;
        RFBsec.Enabled := False;
        RFBcateg.Enabled := True;
        RFBsubcateg.Enabled := True;
        RFBmarca.Enabled := True;
        RFBfabricante.Enabled := True;
        RFBSERVICO.Enabled := True;

        imgDepto.Enabled := True;
        imgSec.Enabled := False;
        imgCateg.Enabled := True;
        imgSubCateg.Enabled := True;
        imgMarca.Enabled := True;
        imgFabricante.Enabled := True;
        imgServico.Enabled := True;

        P1_DEPTO.Visible := False;
        P2_SEC.Visible := True;
        P3_CATEG.Visible := False;
        P4_SUBCATEG.Visible := False;
        P5_MARCA.Visible := False;
        P6_FABRICANTE.Visible := False;
        P7_SERVICO.Visible := False;
      end;
    3:
      begin
        viTelaAtual := 3;
        LABEL_PRINCIPAL.Caption := 'Cadastrar Categoria';
        RFBdepto.Enabled := True;
        RFBsec.Enabled := True;
        RFBcateg.Enabled := False;
        RFBsubcateg.Enabled := True;
        RFBmarca.Enabled := True;
        RFBfabricante.Enabled := True;
        RFBSERVICO.Enabled := True;

        imgDepto.Enabled := True;
        imgSec.Enabled := True;
        imgCateg.Enabled := False;
        imgSubCateg.Enabled := True;
        imgMarca.Enabled := True;
        imgFabricante.Enabled := True;
        imgServico.Enabled := True;

        P1_DEPTO.Visible := False;
        P2_SEC.Visible := False;
        P3_CATEG.Visible := True;
        P4_SUBCATEG.Visible := False;
        P5_MARCA.Visible := False;
        P6_FABRICANTE.Visible := False;
        P7_SERVICO.Visible := False;
      end;
    4:
      begin
        viTelaAtual := 4;
        LABEL_PRINCIPAL.Caption := 'Cadastrar SubCategoria';
        RFBdepto.Enabled := True;
        RFBsec.Enabled := True;
        RFBcateg.Enabled := True;
        RFBsubcateg.Enabled := False;
        RFBmarca.Enabled := True;
        RFBfabricante.Enabled := True;
        RFBSERVICO.Enabled := True;

        imgDepto.Enabled := True;
        imgSec.Enabled := True;
        imgCateg.Enabled := True;
        imgSubCateg.Enabled := False;
        imgMarca.Enabled := True;
        imgFabricante.Enabled := True;
        imgServico.Enabled := True;

        P1_DEPTO.Visible := False;
        P2_SEC.Visible := False;
        P3_CATEG.Visible := False;
        P4_SUBCATEG.Visible := True;
        P5_MARCA.Visible := False;
        P6_FABRICANTE.Visible := False;
        P7_SERVICO.Visible := False;
      end;
    5:
      begin
        viTelaAtual := 5;
        LABEL_CAMINHO.Caption := '';
        LABEL_PRINCIPAL.Caption := 'Cadastrar Marca';
        RFBdepto.Enabled := True;
        RFBsec.Enabled := True;
        RFBcateg.Enabled := True;
        RFBsubcateg.Enabled := True;
        RFBmarca.Enabled := False;
        RFBfabricante.Enabled := True;
        RFBSERVICO.Enabled := True;

        imgDepto.Enabled := True;
        imgSec.Enabled := True;
        imgCateg.Enabled := True;
        imgSubCateg.Enabled := True;
        imgMarca.Enabled := False;
        imgFabricante.Enabled := True;
        imgServico.Enabled := True;

        P1_DEPTO.Visible := False;
        P2_SEC.Visible := False;
        P3_CATEG.Visible := False;
        P4_SUBCATEG.Visible := False;
        P5_MARCA.Visible := True;
        P6_FABRICANTE.Visible := False;
        P7_SERVICO.Visible := False;
      end;
    6:
      begin
        viTelaAtual := 6;
        LABEL_CAMINHO.Caption := '';
        LABEL_PRINCIPAL.Caption := 'Cadastrar Fabricante';
        RFBdepto.Enabled := True;
        RFBsec.Enabled := True;
        RFBcateg.Enabled := True;
        RFBsubcateg.Enabled := True;
        RFBmarca.Enabled := True;
        RFBfabricante.Enabled := False;
        RFBSERVICO.Enabled := True;

        imgDepto.Enabled := True;
        imgSec.Enabled := True;
        imgCateg.Enabled := True;
        imgSubCateg.Enabled := True;
        imgMarca.Enabled := True;
        imgFabricante.Enabled := False;
        imgServico.Enabled := True;

        P1_DEPTO.Visible := False;
        P2_SEC.Visible := False;
        P3_CATEG.Visible := False;
        P4_SUBCATEG.Visible := False;
        P5_MARCA.Visible := False;
        P6_FABRICANTE.Visible := True;
        P7_SERVICO.Visible := False;
      end;
    7:
      begin
        viTelaAtual := 7;
        LABEL_CAMINHO.Caption := '';
        LABEL_PRINCIPAL.Caption := 'Cadastrar Serviço';
        RFBdepto.Enabled := True;
        RFBsec.Enabled := True;
        RFBcateg.Enabled := True;
        RFBsubcateg.Enabled := True;
        RFBmarca.Enabled := True;
        RFBfabricante.Enabled := True;
        RFBSERVICO.Enabled := False;

        imgDepto.Enabled := True;
        imgSec.Enabled := True;
        imgCateg.Enabled := True;
        imgSubCateg.Enabled := True;
        imgMarca.Enabled := True;
        imgFabricante.Enabled := True;
        imgServico.Enabled := False;

        P1_DEPTO.Visible := False;
        P2_SEC.Visible := False;
        P3_CATEG.Visible := False;
        P4_SUBCATEG.Visible := False;
        P5_MARCA.Visible := False;
        P6_FABRICANTE.Visible := False;
        P7_SERVICO.Visible := True;
      end;
  end;
end;

end.
