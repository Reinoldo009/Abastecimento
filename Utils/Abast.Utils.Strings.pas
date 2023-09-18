unit Abast.Utils.Strings;

interface

uses
  System.Classes, System.SysUtils;

type
  TAbastUtilsStrings = class
  private
    class function RemoverAcento(AValue: Char): Char;
  public
    class function RemoverAcentos(AValue: string): string;

    class function ValidarValorDecimaml( AValue: Char; AText: string ): Char;

    class function ValidarApenasNumeros( AValue: Char ): Char;
  end;


implementation

{ TAbastUtilsStrings }

class function TAbastUtilsStrings.RemoverAcento(AValue: Char): Char;
begin
  case Byte(AValue) of
    192..198 : Result := 'A';
    199      : Result := 'C';
    200..203 : Result := 'E';
    204..207 : Result := 'I';
    208      : Result := 'D';
    209      : Result := 'N';
    210..214 : Result := 'O';
    215      : Result := 'x';
    216,248  : Result := '0';
    217..220 : Result := 'U';
    221      : Result := 'Y';
    222,254  : Result := 'b';
    223      : Result := 'B';
    224..230 : Result := 'a';
    231      : Result := 'c';
    232..235 : Result := 'e';
    236..239 : Result := 'i';
    240,242..246 : Result := 'o';
    247      : Result := '/';
    241      : Result := 'n';
    249..252 : Result := 'u';
    253,255  : Result := 'y';
  else
    Result := AValue;
  end;

end;

class function TAbastUtilsStrings.RemoverAcentos(AValue: string): string;
Var
  LPosicao: Integer;
  LLetra: Char;
begin
  Result  := '';
  for LPosicao := 1 to Length( AValue ) do
  begin
     LLetra := RemoverAcento( AValue[LPosicao] );
     if not (Byte(LLetra) in [32..126,13,10,8]) then    {Letras / numeros / pontos / sinais}
        LLetra := ' ' ;
     Result := Result + LLetra;
  end;
end;

class function TAbastUtilsStrings.ValidarApenasNumeros(AValue: Char): Char;
begin
  if CharInSet(AValue, [ '0'..'9', #8 ]) then
    Result := AValue
  else
    Result := #0;
end;

class function TAbastUtilsStrings.ValidarValorDecimaml(AValue: Char;
  AText: string): Char;
begin
  Result := AValue;

  if AValue = ',' then
    if AText.Contains(AValue) then
      Result := #0;
end;

end.
