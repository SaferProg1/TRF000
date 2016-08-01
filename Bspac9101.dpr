program Bspac9101;

uses
  Forms,
  Unt00100 in 'Unt00100.pas' {frm00100},
  Unt00104 in 'Unt00104.pas' {frm00104},
  Unt00101 in 'Unt00101.pas' {frm00101},
  Unt00102 in 'Unt00102.pas' {frm00102},
  Unt00103 in 'Unt00103.pas' {frm00103},
  Vcl.Themes,
  Vcl.Styles,
  UntDOC in 'UntDOC.pas',
  Unt00105 in 'Unt00105.pas' {Frm00105},
  Unt00106 in 'Unt00106.pas' {frm00106},
  Unt_Conexao in '..\..\Bspac0000_Util\XE5\Unt_Conexao.pas' {DM_CONEXAO: TDataModule},
  Unt_Util in '..\..\Bspac0000_Util\XE5\Unt_Util.pas',
  Unt00107 in 'Unt00107.pas' {frm00107};

{$R *.res}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Belt Sistemas');
  Application.CreateForm(TDM_CONEXAO, DM_CONEXAO);
  Application.CreateForm(Tfrm00100, frm00100);
  Application.CreateForm(Tfrm00107, frm00107);
  Application.Run;
end.
