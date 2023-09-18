unit uModelFormCrud;

interface

uses
  System.Classes, System.SysUtils;

type
  IModelFormCrud = interface
  ['{278459AB-BCC1-47E8-B7EB-66EDB9D8A69D}']

    procedure InicializarObjeto;
    procedure Carregar;
    function Validar: Boolean;
    function Salvar: Boolean;
    procedure Apagar;
    procedure HabilitarDesabilitarCampos;
  end;

implementation

end.
