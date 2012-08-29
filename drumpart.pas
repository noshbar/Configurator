unit drumpart;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IniFiles, propertyarray, fields;

type
  TDrumPart = class(TObject)
    protected
      _friendly : String;
      _ini : String;
      _properties : TPropertyArray;
      _mappings : array of integer;
      _mappingSize : integer;
      _mappingCount : integer;
      _mappingList : TStringList;
    public
      constructor Create(IniFile : TIniFile; FriendlyName : String; IniName : String);
      function AddMapping(MidiNote : integer) : boolean;
      procedure RemoveMapping(MidiNote : integer);
      function Write(IniFile : TIniFile) : boolean;

    property
      FriendlyName : String read _friendly;
    property
      IniName : String read _ini;
    property
      Properties : TPropertyArray read _properties;
    property
      Mappings : TStringList read _mappingList;
  end;

implementation

constructor TDrumPart.Create(IniFile : TIniFile; FriendlyName : String; IniName : String);
var
  position : integer;
  colour : string;
  i : integer;
  note : integer;
begin
  _mappingList := TStringList.Create;
  _friendly := FriendlyName;
  _ini := IniName;

  _mappingSize := 10;
  _mappingCount := 0;
  SetLength(_mappings, _mappingSize);

  position := -10;
  colour := '#FFFFFFFF';

  if (IniName = 'bass') then
  begin
    position := 0;
    colour := '#FFFFFFFF';
    AddMapping(-35);
    AddMapping(-36);
  end else
  if (IniName = 'snare') then
  begin
    position := 0;
    colour := '#FFFF0000';
    AddMapping(-38);
    AddMapping(-40);
  end else
  if (IniName = 'hihat_closed') then
  begin
    position := 1;
    colour := '#FFFFFF00';
    AddMapping(-42);
  end else
  if (IniName = 'hihat_open') then
  begin
    position := 1;
    colour := '#FFFFC23B';
    AddMapping(-46);
  end else
  if (IniName = 'tom_high') then
  begin
    position := 1;
    colour := '#FFFFFF00';
    AddMapping(-43);
    AddMapping(-50);
  end else
  if (IniName = 'tom_medium') then
  begin
    position := 2;
    colour := '#FF0000FF';
    AddMapping(-47);
    AddMapping(-48);
  end else
  if (IniName = 'crash') then
  begin
    position := 2;
    colour := '#FF0000FF';
    AddMapping(-49);
    AddMapping(-57);
  end else
  if (IniName = 'tom_low') then
  begin
    position := 3;
    colour := '#FFFF00FF';
    AddMapping(-41);
    AddMapping(-45);
  end else
  if (IniName = 'ride') then
  begin
    position := 3;
    colour := '#FFFF00FF';
    AddMapping(-51);
    AddMapping(-59);
  end;

  _properties := TPropertyArray.Create;
  _properties.Init(IniFile, Lane_Disabled, IniName, 'disabled', false);
  _properties.Init(IniFile, Lane_Note3D, IniName, 'note_3d', true);
  _properties.Init(IniFile, Lane_MeshUseColour, IniName, 'mesh_use_colour', false);
  _properties.Init(IniFile, Lane_NoteTextureIndex, IniName, 'note_texture_index', -1);
  _properties.Init(IniFile, Lane_Position, IniName, 'lane_position', position);
  _properties.Init(IniFile, Lane_Width, IniName, 'width', 3.5);
  _properties.Init(IniFile, Lane_Colour, IniName, 'lane_colour', colour);
  _properties.Init(IniFile, Lane_PlaySound, IniName, 'play_sound_out', false);
  _properties.Init(IniFile, Lane_MidiOutPort, IniName, 'midi_out_port', -1);
  _properties.Init(IniFile, Lane_MidiOutChannel, IniName, 'midi_out_channel', -1);
  _properties.Init(IniFile, Lane_MidiOutNote, IniName, 'midi_out_note', -1);
  _properties.Init(IniFile, Lane_MidiInPort, IniName, 'midi_in_port', -1);
  _properties.Init(IniFile, Lane_MidiInChannel, IniName, 'midi_in_channel', -1);
  _properties.Init(IniFile, Lane_MidiInNote, IniName, 'midi_in_note', -1);
  _properties.Init(IniFile, Lane_KeyboardKey, IniName, 'keyboard_key', -1);
  _properties.Init(IniFile, Lane_JoystickName, IniName, 'joystick_name', -1);
  _properties.Init(IniFile, Lane_JoystickButton, IniName, 'joystick_button', -1);
  _properties.Init(IniFile, Lane_MouseButton, IniName, 'mouse_button', -1);

  { so, the deal is, whenever there are possibly multiple instances of a value,
    such as value, value_0, value_1 ... value_N, account for stoopid's like me
    who might want to enter only one, such as "value", or may not start counting
    at "value_0", but instead "value_1" }
  if (IniFile <> nil) and
     ((IniFile.ValueExists('song_mapping', IniName)) or
     (IniFile.ValueExists('song_mapping', IniName + '_0')) or
     (IniFile.ValueExists('song_mapping', IniName + '_1'))) then
     begin
       SetLength(_mappings, 0);
       _mappingCount := 0;
       _mappingSize := 0;
       _mappingList.Clear;

       if (IniFile.ValueExists('song_mapping', IniName)) then
       begin
         note := IniFile.ReadInteger('song_mapping', IniName, -1);
         if (note <> -1) then
           AddMapping(note);
       end;

       for i := 0 to 255 do
       begin
         note := IniFile.ReadInteger('song_mapping', IniName + '_' + IntToStr(i), -1);
         if (note <> -1) then
         begin
           AddMapping(note);
         end else
         begin
           if (i > 0) then
             break;
         end;
       end;
     end;
end;

{ could be smart and just use 32 bytes and use bits, instead of a resizable array, but meh }
function TDrumPart.AddMapping(MidiNote : integer) : boolean;
var
  i : integer;
begin
  for i := 0 to _mappingCount-1 do
  begin
    if (abs(_mappings[i]) = MidiNote) then
    begin
      result := false;
      exit;
    end;
  end;

  _mappingCount := _mappingCount + 1;
  if (_mappingCount >= _mappingSize) then
  begin
    _mappingSize := _mappingSize + 10;
    SetLength(_mappings, _mappingSize);
  end;
  _mappings[_mappingCount-1] := MidiNote;
  _mappingList.Add(IntToStr(Abs(MidiNote)));

  result := true;
end;

procedure TDrumPart.RemoveMapping(MidiNote : integer);
var
  i : integer;
begin
  for i := 0 to _mappingCount-1 do
  begin
    if (abs(_mappings[i]) = MidiNote) then
    begin
      _mappings[i] := _mappings[_mappingCount-1];
      _mappingCount := _mappingCount - 1;
      _mappingList.Delete(_mappingList.IndexOf(IntToStr(MidiNote)));
      exit;
    end;
  end;
end;

function TDrumPart.Write(IniFile : TIniFile) : boolean;
var
  i : integer;
  s : String;
  added : boolean;
begin
  _properties.Write(IniFile);

  added := false;
  for i := 0 to _mappingCount-1 do
  begin
    if (_mappings[i] > 0) then
    begin
      added := true;
      break;
    end;
  end;

  for i := 0 to _mappingCount-1 do
  begin
    s := _ini + '_' + IntToStr(i);
    if (_mappings[i] > 0) or (added) then
      IniFile.WriteString('song_mapping', s, IntToStr(abs(_mappings[i])));
  end;
  result := true;
end;

end.

