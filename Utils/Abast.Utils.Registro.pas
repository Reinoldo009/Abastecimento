unit Abast.Utils.Registro;

interface

uses
  System.Classes, System.SysUtils, System.Win.Registry, Winapi.Windows;

type
  TRegistroUtils = class
  private
    class var FRegistro: TRegistry;
    class var FKey: String;

    class procedure Initalize;
  public
    class function LerRegistroInteiro( AName: String ): Integer;

    class procedure GravarRegistroInteiro( AName: String; AValue: Integer );

    class function LerRegistroBoolean( AName: String ): Boolean;

    class procedure GravarRegistroBoolean( AName: String; AValue: Boolean );

    class function LerRegistroTexto( AName: String ): String;

    class procedure GravarRegistroTexto( AName, AValue: String );

    class function LerRegistroDecimal( AName: String ): Double;

    class procedure GravarRegistroDecimal( AName: String; AValue: Double );
  end;

implementation

{ TRegistroUtils }

class procedure TRegistroUtils.GravarRegistroBoolean(AName: String;
  AValue: Boolean);
begin
  FRegistro.RootKey := HKEY_CURRENT_USER;

  if not FRegistro.KeyExists(FKey) then
    FRegistro.CreateKey(FKey);

  FRegistro.OpenKey(FKey, True);

  FRegistro.WriteBool( AName, AValue );
  FRegistro.CloseKey;
end;

class procedure TRegistroUtils.GravarRegistroDecimal(AName: String; AValue: Double);
begin
  FRegistro.RootKey := HKEY_CURRENT_USER;

  if not FRegistro.KeyExists(FKey) then
    FRegistro.CreateKey(FKey);

  FRegistro.OpenKey(FKey, True);

  FRegistro.WriteFloat( AName, AValue );
  FRegistro.CloseKey;
end;

class procedure TRegistroUtils.GravarRegistroInteiro(AName: String; AValue: Integer);
begin
  FRegistro.RootKey := HKEY_CURRENT_USER;

  if not FRegistro.KeyExists(FKey) then
    FRegistro.CreateKey(FKey);

  FRegistro.OpenKey(FKey, True);

  FRegistro.WriteInteger( AName, AValue );
  FRegistro.CloseKey;
end;

class procedure TRegistroUtils.GravarRegistroTexto(AName, AValue: String);
begin
  FRegistro.RootKey := HKEY_CURRENT_USER;

  if not FRegistro.KeyExists(FKey) then
    FRegistro.CreateKey(FKey);

  FRegistro.OpenKey(FKey, True);

  FRegistro.WriteString( AName, AValue );
  FRegistro.CloseKey;
end;

class procedure TRegistroUtils.Initalize;
begin
  FRegistro := TRegistry.Create;
  FKey := 'SOFTWARE\AbastABC';
end;

class function TRegistroUtils.LerRegistroBoolean(AName: String): Boolean;
begin
  Result := False;
  FRegistro.RootKey := HKEY_CURRENT_USER;

  if not FRegistro.KeyExists(FKey) then
    FRegistro.CreateKey(FKey);

  FRegistro.OpenKey(FKey, True);

  if FRegistro.ValueExists(AName) then
    Result := FRegistro.ReadBool( AName )

  else
    FRegistro.WriteBool( AName, False );

  FRegistro.CloseKey;
end;

class function TRegistroUtils.LerRegistroDecimal(AName: String): Double;
begin
  Result := 0;
  FRegistro.RootKey := HKEY_CURRENT_USER;

  if not FRegistro.KeyExists(FKey) then
    FRegistro.CreateKey(FKey);

  FRegistro.OpenKey(FKey, True);

  if FRegistro.ValueExists(AName) then
    Result := FRegistro.ReadFloat( AName )

  else
    FRegistro.WriteFloat( AName, 0 );

  FRegistro.CloseKey;
end;

class function TRegistroUtils.LerRegistroInteiro(AName: String): Integer;
begin
  Result := 0;
  FRegistro.RootKey := HKEY_CURRENT_USER;

  if not FRegistro.KeyExists(FKey) then
    FRegistro.CreateKey(FKey);

  FRegistro.OpenKey(FKey, True);

  if FRegistro.ValueExists(AName) then
    Result := FRegistro.ReadInteger( AName )

  else
    FRegistro.WriteInteger( AName, 0 );

  FRegistro.CloseKey;
end;

class function TRegistroUtils.LerRegistroTexto(AName: String): String;
begin
  Result := EmptyStr;
  FRegistro.RootKey := HKEY_CURRENT_USER;

  if not FRegistro.KeyExists(FKey) then
    FRegistro.CreateKey(FKey);

  FRegistro.OpenKey(FKey, True);

  if FRegistro.ValueExists(AName) then
    Result := FRegistro.ReadString( AName )

  else
    FRegistro.WriteString( AName, EmptyStr );

  FRegistro.CloseKey;
end;

initialization
   TRegistroUtils.Initalize;

end.
