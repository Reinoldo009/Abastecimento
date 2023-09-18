unit uCombustivel;

interface

uses
  System.SysUtils, System.Classes, uClasseBase;

type
  TCombustivel = class(TClasseBase)
  private
    FDescricao: string;
    FValorUnitario: Real;
    FTaxaImposto: Real;
  public
    property Descricao: string read FDescricao write FDescricao;
    property ValorUnitario: Real read FValorUnitario write FValorUnitario;
    property TaxaImposto: Real read FTaxaImposto write FTaxaImposto;
  end;

implementation

{ TCombustivel }

end.
