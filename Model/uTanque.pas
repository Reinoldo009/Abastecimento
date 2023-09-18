unit uTanque;

interface

uses
  System.SysUtils, System.Classes, uClasseBase, uCombustivel;

type
  TTanque = class(TClasseBase)
  private
    FDescricao: string;
    FCapacidade: Real;
    FCombustivel: TCombustivel;
    FLimiteBombas: Integer;
  public
    constructor Create; override;
    property Descricao: string read FDescricao write FDescricao;
    property Capacidade: Real read FCapacidade write FCapacidade;
    property Combustivel: TCombustivel read FCombustivel write FCombustivel;
    property LimiteBombas: Integer read FLimiteBombas write FLimiteBombas default 2;
  end;

implementation

{ TTanque }

{ TTanque }

constructor TTanque.Create;
begin
  inherited;
  FCombustivel := TCombustivel.Create;
  FLimiteBombas := 2;
end;

end.
