unit baseproperty;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Variants, IniFiles;

type
  TProperty = class(TObject)
    protected
      d : Variant; //default
      v : Variant; //value
      s : String;  //section
      k : String;  //key;
    protected
      function getValue : Variant;
      procedure setValue(NewValue : Variant);
      function isDefault : boolean;

    public
      constructor Create(Section : String; Key : String; DefaultVal : Variant);
      procedure Write(IniFile : TIniFile);
      procedure Assign(NewValue : Variant);

    property
      Value : Variant read getValue write setValue;
  end;

implementation

constructor TProperty.Create(Section : String; Key : String; DefaultVal : Variant);
begin
  d := DefaultVal;
  s := Section;
  k := Key;
end;

function TProperty.getValue : Variant;
begin
  if (VarIsEmpty(v)) then
     result := d
  else
     result := v;
end;

procedure TProperty.setValue(NewValue : Variant);
begin
  v := NewValue;
end;

procedure TProperty.Assign(NewValue : Variant);
begin
  v := NewValue;
end;

function TProperty.isDefault : boolean;
begin
  if (VarIsEmpty(v)) then
     result := true
  else
     result := d = v;
end;

procedure TProperty.Write(IniFile : TIniFile);
begin
  if (IniFile = nil) then
    exit;

  if (not isDefault) then
     IniFile.WriteString(s, k, v);
end;

end.

