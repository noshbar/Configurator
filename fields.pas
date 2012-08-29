unit fields;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils; 

type
  TFields =
  (
    //songs
    Songs_Path,
    Songs_IgnoreCustomLayouts,
    Songs_IgnoreCustomTextures,
    Songs_IgnoreCustomSounds,
    Songs_IgnoreCustomMeshes,

    //song information
    SongInformation_Name,
    SongInformation_Artist,
    SongInformation_Album,
    SongInformation_Year,
    SongInformation_Cover, {the album cover picture filename }

    //display
    Display_Width,
    Display_Height,
    Display_Left,
    Display_Top,
    Display_Fullscreen,
    Display_Path,
    Display_Notes3D,

    //screen_songs
    SongsScreen_TextLeft,
    SongsScreen_TextSpacing,
    SongsScreen_TextColour,
    SongsScreen_HighlightedTextColour,
    SongsScreen_SideBarDelay,
    SongsScreen_SideBarColour,
    SongsScreen_BackgroundImage,
    SongsScreen_SideBarImage,

    //screen_game
    GameScreen_RotateX,
    GameScreen_RotateY,
    GameScreen_RotateZ,
    GameScreen_TranslateX,
    GameScreen_TranslateY,
    GameScreen_TranslateZ,
    GameScreen_ScaleX,
    GameScreen_ScaleY,
    GameScreen_ScaleZ,
    GameScreen_NoteLife,
    GameScreen_NeckLength,
    GameScreen_NeckWidth,

    //strings
    Strings_Resume,
    Strings_Restart,
    Strings_NewSong,
    Strings_Quit,
    Strings_Open,
    Strings_Back,
    Strings_Play,
    Strings_Finished,
    Strings_Easy,
    Strings_Medium,
    Strings_Hard,
    Strings_Expert,
    Strings_NoSongInfo,
    Strings_NoArtistInfo,
    Strings_NoAlbumInfo,
    Strings_NoYearInfo,

    //lanes
    Lane_Disabled,
    Lane_Note3D,
    Lane_MeshUseColour,
    Lane_NoteTextureIndex,
    Lane_Position,
    Lane_Width,
    Lane_Colour,
    Lane_PlaySound,
    Lane_MidiOutPort,
    Lane_MidiOutChannel,
    Lane_MidiOutNote,
    Lane_MidiInPort,
    Lane_MidiInChannel,
    Lane_MidiInNote,
    Lane_KeyboardKey,
    Lane_JoystickName,
    Lane_JoystickButton,
    Lane_MouseButton,


    FieldCount
  );

implementation

end.

