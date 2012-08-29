unit propertyarray;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fields, baseproperty, IniFiles, Variants;

type
  TPropertyArray = class(TObject)
    protected
      properties : array of TProperty;

    protected
      function getField(Index : TFields) : TProperty;
      function getValue(Index : TFields) : Variant;

    public
      constructor Create;
      function Init(IniFile : TIniFile; Index : TFields; Section : String; Key : String; DefaultValue : Variant) : TProperty;
      function Write(IniFile : TIniFile) : boolean;

    property
      Field[Index : TFields] : TProperty read getField;
    property
      Value[Index : TFields] : Variant read getValue; default;
  end;

implementation

constructor TPropertyArray.Create;
var
  l : integer;
begin
  l := integer(FieldCount);
  SetLength(properties, l);
end;

function TPropertyArray.getField(Index : TFields) : TProperty;
begin
  result := properties[integer(Index)];
end;

function TPropertyArray.Init(IniFile : TIniFile; Index : TFields; Section : String; Key : String; DefaultValue : Variant) : TProperty;
var
  i : integer;
  tipe : integer;
  s : String;
  v : Variant;
begin
  i := integer(Index);
  properties[i] := TProperty.Create(Section, Key, DefaultValue);
  if (IniFile <> nil) then
  begin
    if (IniFile.ValueExists(Section, Key)) then
    begin
      s := IniFile.ReadString(Section, Key, '');
      if (s <> '') then
      begin
        tipe := VarType(DefaultValue) and VarTypeMask;
        case tipe of
          varByte, varWord, varSmallInt, varInteger, varLongWord, varInt64: v := StrToInt(s);
          varSingle, varDouble, varCurrency: v := StrToFloat(s);
          varBoolean: v := (UpperCase(s) = 'TRUE');
          varString: v := s;
        end;
        properties[i].Assign(v);
      end;
    end;
  end;
  result := properties[i];
end;

function TPropertyArray.getValue(Index : TFields) : Variant;
begin
  result := properties[integer(Index)].Value;
end;

function TPropertyArray.Write(IniFile : TIniFile) : boolean;
var
  i : integer;
  p : TProperty;
begin
  for i := 0 to Length(properties)-1 do
  begin
    p := properties[i];
    if (p <> nil) then
    begin
      p.Write(IniFile);
    end;
  end;
end;

end.

