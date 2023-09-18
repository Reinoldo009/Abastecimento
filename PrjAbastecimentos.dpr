program PrjAbastecimentos;

uses
  Vcl.Forms,
  FireDAC.DApt,
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  DMConexao in 'DMConexao.pas' {frmDMConexao: TDataModule},
  uCombustivel in 'Model\uCombustivel.pas',
  uBomba in 'Model\uBomba.pas',
  uTanque in 'Model\uTanque.pas',
  uClasseBase in 'Model\uClasseBase.pas',
  Abast.Msgs in 'Utils\Abast.Msgs.pas',
  Abast.CutomLog in 'Utils\Abast.CutomLog.pas',
  uModelFormCrud in 'Interface\uModelFormCrud.pas',
  uReposoritory in 'Interface\uReposoritory.pas',
  uCombustivelRepository in 'Repository\uCombustivelRepository.pas',
  Abast.Utils in 'Utils\Abast.Utils.pas',
  Abast.Utils.CSQL in 'Utils\Abast.Utils.CSQL.pas',
  uBombaRepository in 'Repository\uBombaRepository.pas',
  uTanqueRepository in 'Repository\uTanqueRepository.pas',
  FConsulta in 'View\FConsulta.pas' {frmConsulta},
  Abast.Types in 'Utils\Abast.Types.pas',
  Abast.Utils.Forms in 'Utils\Abast.Utils.Forms.pas',
  Abast.Utils.Registro in 'Utils\Abast.Utils.Registro.pas',
  FBaseCadastro in 'View\FBaseCadastro.pas' {frmBaseCadastro},
  FCadastroBomba in 'View\FCadastroBomba.pas' {frmCadastroBomba},
  FCadastroTanque in 'View\FCadastroTanque.pas' {frmCadastroTanque},
  win32titlestyler in 'ThirdParty\win32titlestyler.pas',
  Abast.Utils.Strings in 'Utils\Abast.Utils.Strings.pas',
  FCadastroCombustivel in 'View\FCadastroCombustivel.pas' {frmCadastroCombustivel},
  uAbastecimento in 'Model\uAbastecimento.pas',
  uAbastecimentoRepository in 'Repository\uAbastecimentoRepository.pas',
  FCadastroAbastecimento in 'View\FCadastroAbastecimento.pas' {frmCadastroAbastecimento},
  FRelAbastecimento in 'View\FRelAbastecimento.pas' {frmRelAbastecimento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmDMConexao, frmDMConexao);
  Application.Run;
end.
