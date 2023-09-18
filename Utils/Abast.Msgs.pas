unit Abast.Msgs;

interface

uses
  Vcl.Forms, Vcl.Consts, Winapi.Windows ;

procedure msgAlert( AMsg: string );

procedure msgInfo( AMsg: string );

procedure msgError( AMsg: string );

function msgConfirm( AMsg: string ): Boolean;

implementation

function msgConfirm( AMsg: string ): Boolean;
begin
  Result := Application.MessageBox( PChar(AMsg), PChar(Application.Title), MB_ICONQUESTION + MB_YESNO ) = IDYES;
end;

procedure msgAlert( AMsg: string );
begin
  Application.MessageBox( PChar(AMsg), PChar(Application.Title), MB_ICONWARNING );
end;

procedure msgInfo( AMsg: string );
begin
  Application.MessageBox( PChar(AMsg), PChar(Application.Title), MB_ICONINFORMATION );
end;

procedure msgError( AMsg: string );
begin
  Application.MessageBox( PChar(AMsg), PChar(Application.Title), MB_ICONERROR );
end;

end.
