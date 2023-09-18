unit uReposoritory;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections, Data.DB,
  FireDAC.Comp.Client;

type
  IReposoritory<T> = interface
  ['{EF755A55-41D4-4587-8C3D-D9784161692A}']

    procedure CopiarInstancia( AOrigem, ADestino: T );
    procedure LimparInstancia( AObjeto: T );

    procedure QueryParaObjeto( AQuery: TDataset; AObjeto: T );
    procedure ObjetoParaQuery( AObjeto: T; AQuery: TDataset );
    procedure ObjetoParaQueryParams( AObjeto: T; AQuery: TFDQuery );

    function BuscarPorId(AId: Integer): T;
    function BuscarPorFiltro(AFiltro: string): T;

    function Validar(AValue: T): Boolean;
    function Salvar(AValue: T): Boolean;

    function ValidarExclusao( AValue: Integer ): Boolean;
    function Excluir(AValue: Integer): Boolean;

    function GetSqlConsulta: string;
    function GetTabela: string;

    procedure ShowFormulario( AValue: Integer );
  end;

implementation

end.
