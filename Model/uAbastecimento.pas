unit uAbastecimento;

interface

uses
  System.SysUtils, System.Classes, uClasseBase, uBomba, uCombustivel, uTanque;

type
  TAbastecimento = class(TClasseBase)
  private
    FBomba: TBomba;
    FHora: TTime;
    FData: TDate;
    FTanque: TTanque;
    FCombustivel: TCombustivel;
    FTaxaImposto: Real;
    FValorImposto: Real;
    FValorUnitario: Real;
    FQuantidade: Real;
    FValorTotal: Real;
  public
    constructor Create; override;
    property Data: TDate read FData write FData;
    property Hora: TTime read FHora write FHora;
    property Bomba: TBomba read FBomba write FBomba;
    property Tanque: TTanque read FTanque write FTanque;
    property Combustivel: TCombustivel read FCombustivel write FCombustivel;
    property Quantidade: Real read FQuantidade write FQuantidade;
    property ValorUnitario: Real read FValorUnitario write FValorUnitario;
    property ValorTotal: Real read FValorTotal write FValorTotal;
    property TaxaImposto: Real read FTaxaImposto write FTaxaImposto;
    property ValorImposto: Real read FValorImposto write FValorImposto;
  end;

implementation

{ TBomba }

constructor TAbastecimento.Create;
begin
  inherited;
  FBomba := TBomba.Create;
  FTanque := TTanque.Create;
  FCombustivel := TCombustivel.Create;
end;

end.
