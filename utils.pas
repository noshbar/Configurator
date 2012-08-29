unit utils;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics;

function ForwardSlash(Path : String) : string;
function GetAlpha(colour : string) : byte;
function HexToTColor(colour : string) : TColor;
function TColorToString(colour : TColor; alpha : byte) : String;

implementation

function ForwardSlash(Path : String) : string;
var
  i : integer;
begin
  for i := 1 to Length(Path) do
  begin
    if (Path[i] = '\') then
      Path[i] := '/';
  end;
  result := Path;
end;

function GetAlpha(colour : string) : byte;
begin
  if (colour[1] <> '#') or (length(colour) <> 9) then
  begin
    Result := 255;
  end else
  begin
    Result := StrToInt('$' + Copy(colour, 2, 2));
  end;
end;

function HexToTColor(colour : string) : TColor;
var
  start : integer;
begin
  if (colour[1] <> '#') or ((length(colour) <> 7) and (length(colour) <> 9)) then
  begin
    Result := 0;
  end else
  begin
    if (length(colour) = 7) then
      start := 2
    else
      start := 4;

    Result := StrToInt('$' + Copy(colour, start, 2)) +
              StrToInt('$' + Copy(colour, start + 2, 2)) shl 8 +
              StrToInt('$' + Copy(colour, start + 4, 2)) shl 16;
  end;
end;

function TColorToString(colour : TColor; alpha : byte) : String;
var
  r,g,b : byte;
begin
  r := colour shr 16;
  g := colour shr 8;
  b := colour;
  Result := '#' + IntToHex(alpha, 2) + IntToHex(r, 2) + IntToHex(g, 2) + IntToHex(b, 2);
end;

end.

