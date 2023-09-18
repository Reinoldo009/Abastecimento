unit Abast.CutomLog;

interface

uses
  System.Classes, System.SysUtils, Clipbrd;

type
  TAbastCutomLog = class
  private
    class var FLog: TStringList;
    class procedure InitAbastCutomLog;
    class procedure FinalizeAbastCutomLog;
  public
    class procedure Log( ALog: string );
    class procedure Clear;
    class procedure SaveToFile( AFileName: TFileName );
    class procedure CopyToClipbrd;
  end;

implementation

{ TAbastCutomLog }

class procedure TAbastCutomLog.Clear;
begin
  FLog.Clear;
end;

class procedure TAbastCutomLog.CopyToClipbrd;
var
  LClipbrd: TClipboard;
begin
  LClipbrd := TClipboard.Create;
  try
    LClipbrd.AsText := FLog.ToString;
  finally
    FreeAndNil(LClipbrd);
  end;
end;

class procedure TAbastCutomLog.FinalizeAbastCutomLog;
begin
  FLog.Clear;
  FreeAndNil(FLog)
end;

class procedure TAbastCutomLog.InitAbastCutomLog;
begin
  FLog := TStringList.Create;
  TAbastCutomLog.Clear;
end;

class procedure TAbastCutomLog.Log(ALog: string);
begin
  FLog.Add( FormatDateTime( 'dd/mm/yyyy hh:nn:ss:zzzz', Now ) + ' : ' + ALog );
end;

class procedure TAbastCutomLog.SaveToFile(AFileName: TFileName);
begin
  FLog.SaveToFile( AFileName );
end;

initialization
  TAbastCutomLog.InitAbastCutomLog;

finalization
  TAbastCutomLog.FinalizeAbastCutomLog;

end.
