unit uBomba;

interface

uses
  System.SysUtils, System.Classes, uClasseBase, uTanque;

type
  TBomba = class(TClasseBase)
  private
    FNumeroBomba: string;
    FDescricao: string;
    FTanque: TTanque;
  public
    constructor Create; override;
    property NumeroBomba: string read FNumeroBomba write FNumeroBomba;
    property Descricao: string read FDescricao write FDescricao;
    property Tanque: TTanque read FTanque write FTanque;
  end;

implementation

{ TBomba }

constructor TBomba.Create;
begin
  inherited;
  FTanque := TTanque.Create;
end;

end.
