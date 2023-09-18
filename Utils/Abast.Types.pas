unit Abast.Types;

interface

type
  TAbastIntegerProc = procedure(AValue: Integer) of object;
  TAbastIntegerFunc = function(AValue: Integer): Boolean of object;

  TAbastFormState = (fsAInsert, fsAEdit, fsAView);

implementation

end.
