unit Abast.Utils.Forms;

interface

uses
  Vcl.Forms, System.Classes, FConsulta;

type
  TAbastUtilsForms = class
  private
    class function GetFormularioConsulta( ATabela: string ): TfrmConsulta;

  public
    class procedure ShowConsultaCombustivel;
    class procedure ShowConsultaTanque;
    class procedure ShowConsultaBomba;
    class procedure ShowConsultaAbastecimento;

    class procedure ShowRelatorioAbastecimento;
  end;

implementation

uses
  uCombustivelRepository, uTanqueRepository, uBombaRepository, uAbastecimentoRepository, FRelAbastecimento;

{ TAbastUtilsForms }

class function TAbastUtilsForms.GetFormularioConsulta(ATabela: string): TfrmConsulta;
var
  LComponent: TComponent;
begin
  Result := nil;

  LComponent := Application.FindComponent( 'frmConsulta_' + ATabela );

  if Assigned(LComponent) and (LComponent is TfrmConsulta) then
    Result := (LComponent as TfrmConsulta);
end;

class procedure TAbastUtilsForms.ShowConsultaAbastecimento;
var
  LForm: TfrmConsulta;
begin
  LForm := GetFormularioConsulta( TAbastecimentoRepository.GetInstance.GetTabela );

  if LForm = nil then
  begin
    LForm := TfrmConsulta.Create(Application);
    LForm.ConfigurarFormulario( TAbastecimentoRepository.GetInstance.GetTabela, 'Consulta de Abastecimentos' );
    LForm.OnIncluir := TAbastecimentoRepository.GetInstance.ShowFormulario;
    LForm.OnEditar := TAbastecimentoRepository.GetInstance.ShowFormulario;
    LForm.OnExcluir := TAbastecimentoRepository.GetInstance.Excluir;
  end;

  LForm.CarregarDados( TAbastecimentoRepository.GetInstance.GetSqlConsulta );

  LForm.Show;
end;

class procedure TAbastUtilsForms.ShowConsultaBomba;
var
  LForm: TfrmConsulta;
begin
  LForm := GetFormularioConsulta( TBombaRepository.GetInstance.GetTabela );

  if LForm = nil then
  begin
    LForm := TfrmConsulta.Create(Application);
    LForm.ConfigurarFormulario( TBombaRepository.GetInstance.GetTabela, 'Consulta de Bombas' );
    LForm.OnIncluir := TBombaRepository.GetInstance.ShowFormulario;
    LForm.OnEditar := TBombaRepository.GetInstance.ShowFormulario;
    LForm.OnExcluir := TBombaRepository.GetInstance.Excluir;
  end;

  LForm.CarregarDados( TBombaRepository.GetInstance.GetSqlConsulta );

  LForm.Show;
end;

class procedure TAbastUtilsForms.ShowConsultaCombustivel;
var
  LForm: TfrmConsulta;
begin
  LForm := GetFormularioConsulta( TCombustivelRepository.GetInstance.GetTabela );

  if LForm = nil then
  begin
    LForm := TfrmConsulta.Create(Application);
    LForm.ConfigurarFormulario( TCombustivelRepository.GetInstance.GetTabela, 'Consulta de Combustíveis' );
    LForm.OnIncluir := TCombustivelRepository.GetInstance.ShowFormulario;
    LForm.OnEditar := TCombustivelRepository.GetInstance.ShowFormulario;
    LForm.OnExcluir := TCombustivelRepository.GetInstance.Excluir;
  end;

  LForm.CarregarDados( TCombustivelRepository.GetInstance.GetSqlConsulta );
  LForm.Show;
end;

class procedure TAbastUtilsForms.ShowConsultaTanque;
var
  LForm: TfrmConsulta;
begin
  LForm := GetFormularioConsulta( TTanqueRepository.GetInstance.GetTabela );

  if LForm = nil then
  begin
    LForm := TfrmConsulta.Create(Application);
    LForm.ConfigurarFormulario( TTanqueRepository.GetInstance.GetTabela, 'Consulta de Tanques' );
    LForm.OnIncluir := TTanqueRepository.GetInstance.ShowFormulario;
    LForm.OnEditar := TTanqueRepository.GetInstance.ShowFormulario;
    LForm.OnExcluir := TTanqueRepository.GetInstance.Excluir;
  end;

  LForm.CarregarDados( TTanqueRepository.GetInstance.GetSqlConsulta );
  LForm.Show;
end;

class procedure TAbastUtilsForms.ShowRelatorioAbastecimento;
begin
  if frmRelAbastecimento = nil then
    frmRelAbastecimento := TfrmRelAbastecimento.Create(Application);

  frmRelAbastecimento.ShowModal;
end;

end.
