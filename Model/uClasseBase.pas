unit uClasseBase;

interface

type
  TClasseBase = class
  private
    FId: Integer;
    procedure SetId(const Value: Integer);
  public
    constructor Create; virtual;
    property Id: Integer read FId write SetId;
  end;
implementation

{ TClasseBase }

constructor TClasseBase.Create;
begin

end;

procedure TClasseBase.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
