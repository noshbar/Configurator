unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, ExtDlgs, fields, propertyarray, IniFiles, drumpart, utils, types, spritepicker;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    cmdLaneSprite: TButton;
    chkNotes3D: TCheckBox;
    cmdSongCoverBrowser: TButton;
    cmdSave: TButton;
    cmdAddMapping: TButton;
    cmdRemoveMapping: TButton;
    chkMeshUsesColour: TCheckBox;
    cmdSideBarImageBrowse: TButton;
    cmdSongTextColour: TButton;
    cmdSongHighlighted: TButton;
    cmdSideBarColour: TButton;
    cmdSongBackBrowse: TButton;
    cmdBrowseDisplayPath: TButton;
    chkFullscreen: TCheckBox;
    chkLaneDisabled: TCheckBox;
    chkAllowCustomMeshes: TCheckBox;
    chkAllowCustomTextures: TCheckBox;
    chkAllowCustomSounds: TCheckBox;
    chkAllowCustomLayouts: TCheckBox;
    cmdDrumpsterBrowse: TButton;
    cmdPathBrowse: TButton;
    cdSongScreen: TColorDialog;
    cboLanes: TComboBox;
    cmdLaneColour: TButton;
    cdLane: TColorDialog;
    cboMappingLane: TComboBox;
    opSongCover: TOpenPictureDialog;
    strSongName: TEdit;
    strSongArtist: TEdit;
    strSongAlbum: TEdit;
    strSongYear: TEdit;
    strSongAlbumCover: TEdit;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    strMidiNote: TEdit;
    grpMidiOut: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    lblLaneAlphaValue: TLabel;
    lblLaneColour: TLabel;
    lstMappings: TListBox;
    strMidiChannelOut: TEdit;
    strMidiNoteOut: TEdit;
    strMidiPortIn: TEdit;
    strMidiChannelIn: TEdit;
    strMidiNoteIn: TEdit;
    grpMidiIn: TGroupBox;
    Label46: TLabel;
    strLaneWidth: TEdit;
    Label45: TLabel;
    strLanePosition: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    lblTextAlphaValue: TLabel;
    lblHighlightedAlphaValue: TLabel;
    lblSideBarAlphaValue: TLabel;
    lblSideBarColour: TLabel;
    Label43: TLabel;
    opSongScreen: TOpenPictureDialog;
    strMidiPortOut: TEdit;
    strSongBackImage: TEdit;
    strTextLeft: TEdit;
    strTextSpacing: TEdit;
    strSideBarImage: TEdit;
    strSidebarDelay: TEdit;
    grpText: TGroupBox;
    grpSideBar: TGroupBox;
    grpNeck: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    lblTextColour: TLabel;
    lblHighlightedColour: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    strNeckLength: TEdit;
    strNeckWidth: TEdit;
    strNoteLife: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    strNeckMoveX: TEdit;
    strNeckMoveY: TEdit;
    strNeckMoveZ: TEdit;
    strNeckRotX: TEdit;
    strNeckRotY: TEdit;
    strNeckRotZ: TEdit;
    strNeckScaleX: TEdit;
    strNeckScaleY: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    strNeckScaleZ: TEdit;
    strWidth: TEdit;
    strHeight: TEdit;
    strLeft: TEdit;
    strTop: TEdit;
    strDisplayPath: TEdit;
    strResume: TEdit;
    strMedium: TEdit;
    strHard: TEdit;
    strExpert: TEdit;
    strNoSongInfo: TEdit;
    strNoArtistInfo: TEdit;
    strNoAlbumInfo: TEdit;
    strNoYearInfo: TEdit;
    strRestart: TEdit;
    strNewSong: TEdit;
    strQuit: TEdit;
    strOpen: TEdit;
    strBack: TEdit;
    strPlay: TEdit;
    strFinished: TEdit;
    strEasy: TEdit;
    grpLane: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    odDrumpster: TOpenDialog;
    strDrumpsterPath: TEdit;
    strSongsPath: TEdit;
    pages: TPageControl;
    pageSongs: TTabSheet;
    pageLanes: TTabSheet;
    pageStrings: TTabSheet;
    pageDisplay: TTabSheet;
    pageSongScreen: TTabSheet;
    pageGameScreen: TTabSheet;
    pageMapping: TTabSheet;
    pageSongInfo: TTabSheet;
    trkSideAlpha: TTrackBar;
    trkHighlightedAlpha: TTrackBar;
    trkTextAlpha: TTrackBar;
    trkLaneAlpha: TTrackBar;
    procedure cboLanesChange(Sender: TObject);
    procedure cboMappingLaneChange(Sender: TObject);
    procedure chkFullscreenChange(Sender: TObject);
    procedure chkLaneDisabledChange(Sender: TObject);
    procedure chkMeshUsesColourChange(Sender: TObject);
    procedure cmdAddMappingClick(Sender: TObject);
    procedure cmdBrowseDisplayPathClick(Sender: TObject);
    procedure cmdDrumpsterBrowseClick(Sender: TObject);
    procedure cmdLaneColourClick(Sender: TObject);
    procedure cmdLaneSpriteClick(Sender: TObject);
    procedure cmdRemoveMappingClick(Sender: TObject);
    procedure cmdSaveClick(Sender: TObject);
    procedure cmdSideBarImageBrowseClick(Sender: TObject);
    procedure cmdSongBackBrowseClick(Sender: TObject);
    procedure cmdSongCoverBrowserClick(Sender: TObject);
    procedure cmdSongTextColourClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lblHighlightedColourClick(Sender: TObject);
    procedure lstMappingsSelectionChange(Sender: TObject; User: boolean);
    procedure pageLanesContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure pagesChange(Sender: TObject);
    procedure strLanePositionChange(Sender: TObject);
    procedure strLaneWidthChange(Sender: TObject);
    procedure strMidiChannelInChange(Sender: TObject);
    procedure strMidiChannelOutChange(Sender: TObject);
    procedure strMidiNoteChange(Sender: TObject);
    procedure strMidiNoteInChange(Sender: TObject);
    procedure strMidiNoteOutChange(Sender: TObject);
    procedure strMidiPortInChange(Sender: TObject);
    procedure strMidiPortOutChange(Sender: TObject);
    procedure trkHighlightedAlphaChange(Sender: TObject);
    procedure trkLaneAlphaChange(Sender: TObject);
    procedure trkSideAlphaChange(Sender: TObject);
    procedure trkTextAlphaChange(Sender: TObject);
  private
    { private declarations }
    properties : TPropertyArray;
    iniPath : String;
    drumParts : TList;
    configPath : string;
    songConfig : boolean;
    procedure clearDrumParts;
    procedure setLaneColour;
    procedure setDrumPartInt(Field : TFields; Value : string);
  protected
    procedure loadConfiguration(FilePath : String);
    procedure updateUI;
    function getSongScreenImage : string;
  public
    { public declarations }
  end; 

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.clearDrumParts;
var
  i : integer;
begin
  for i := 0 to drumParts.Count - 1 do
  begin
    TDrumPart(drumParts.Items[i]).Destroy;
  end;
  drumParts.Clear;
end;

procedure TfrmMain.pagesChange(Sender: TObject);
begin

end;

procedure TfrmMain.strLanePositionChange(Sender: TObject);
begin
  setDrumPartInt(Lane_Position, strLanePosition.Text);
end;

procedure TfrmMain.setDrumPartInt(Field : TFields; Value : string);
var
  drumPart : TDrumPart;
begin
  drumPart := TDrumPart(cboLanes.Items.Objects[cboLanes.ItemIndex]);
  if (drumPart = nil) then
    exit;

  try
    drumPart.Properties.Field[Field].Value := StrToInt(Value);
  except
  end;
end;

procedure TfrmMain.strLaneWidthChange(Sender: TObject);
var
  drumPart : TDrumPart;
begin
  drumPart := TDrumPart(cboLanes.Items.Objects[cboLanes.ItemIndex]);
  if (drumPart = nil) then
    exit;

  try
    drumPart.Properties.Field[Lane_Width].Value := StrToFloat(strLaneWidth.Text);
  except
  end;
end;

procedure TfrmMain.strMidiChannelInChange(Sender: TObject);
begin
  setDrumPartInt(Lane_MidiInChannel, strMidiChannelIn.Text);
end;

procedure TfrmMain.strMidiChannelOutChange(Sender: TObject);
begin
  setDrumPartInt(Lane_MidiOutChannel, strMidiChannelOut.Text);
end;

procedure TfrmMain.strMidiNoteChange(Sender: TObject);
var
  i : integer;
begin
  try
    i := StrToInt(strMidiNote.Text);
    cmdAddMapping.Enabled := true;
  except
    on Exception : EConvertError do
      cmdAddMapping.Enabled := false;
  end;
end;

procedure TfrmMain.strMidiNoteInChange(Sender: TObject);
begin
  setDrumPartInt(Lane_MidiInNote, strMidiNoteIn.Text);
end;

procedure TfrmMain.strMidiNoteOutChange(Sender: TObject);
begin
  setDrumPartInt(Lane_MidiOutNote, strMidiNoteOut.Text);
end;

procedure TfrmMain.strMidiPortInChange(Sender: TObject);
begin
  setDrumPartInt(Lane_MidiInPort, strMidiPortIn.Text);
end;

procedure TfrmMain.strMidiPortOutChange(Sender: TObject);
begin
  setDrumPartInt(Lane_MidiOutPort, strMidiPortOut.Text);
end;

procedure TfrmMain.trkHighlightedAlphaChange(Sender: TObject);
begin
  lblHighlightedAlphaValue.Caption := IntToStr(trkHighlightedAlpha.Position);
end;

procedure TfrmMain.trkLaneAlphaChange(Sender: TObject);
begin
  lblLaneAlphaValue.Caption := IntToStr(trkLaneAlpha.Position);
  setLaneColour;
end;

procedure TfrmMain.trkSideAlphaChange(Sender: TObject);
begin
  lblSideBarAlphaValue.Caption := IntToStr(trkSideAlpha.Position);
end;

procedure TfrmMain.trkTextAlphaChange(Sender: TObject);
begin
  lblTextAlphaValue.Caption := IntToStr(trkTextAlpha.Position);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  properties := TPropertyArray.Create;
  drumParts := TList.Create;
  pages.ActivePageIndex := 4;
  Left := Screen.Width div 2 - (Width div 2);
  Top := Screen.Height div 2 - (Height div 2);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  clearDrumParts;
end;

procedure TfrmMain.lblHighlightedColourClick(Sender: TObject);
begin

end;

procedure TfrmMain.lstMappingsSelectionChange(Sender: TObject; User: boolean);
begin
  cmdRemoveMapping.Enabled := (lstMappings.ItemIndex >= 0);
end;

procedure TfrmMain.pageLanesContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TfrmMain.loadConfiguration(FilePath : String);
var
  iniFile : TIniFile;
  drumPart : TDrumPart;
  i : integer;
begin
  configPath := forwardSlash(ExtractFilePath(FilePath));

  if (UpperCase(ExtractFileName(FilePath)) = 'DRUMPSTER.EXE') then
    iniPath := configPath + 'drumpster.cfg'
  else
    iniPath := FilePath;
  iniFile := nil;
  if (FileExists(iniPath)) then
  begin
    try
      iniFile := TIniFile.Create(iniPath);
    except
      iniFile := nil;
    end;
  end;

  FilePath := forwardSlash(FilePath);

  //songs
  properties.Init(IniFile, Songs_Path, 'songs', 'path', configPath + 'songs/');
  properties.Init(IniFile, Songs_IgnoreCustomLayouts, 'songs', 'ignore_custom_layouts', false);
  properties.Init(IniFile, Songs_IgnoreCustomTextures, 'songs', 'ignore_custom_textures', false);
  properties.Init(IniFile, Songs_IgnoreCustomSounds, 'songs', 'ignore_custom_sounds', false);
  properties.Init(IniFile, Songs_IgnoreCustomMeshes, 'songs', 'ignore_custom_meshes', false);

  //song information
  properties.Init(IniFile, SongInformation_Name, 'song', 'name', 'Unknown');
  properties.Init(IniFile, SongInformation_Artist, 'song', 'artist', 'Unknown');
  properties.Init(IniFile, SongInformation_Album, 'song', 'album', 'Unknown');
  properties.Init(IniFile, SongInformation_Year, 'song', 'year', 'Unknown');
  properties.Init(IniFile, SongInformation_Cover, 'song', 'cover', 'label.png');

  //display
  properties.Init(IniFile, Display_Width, 'display', 'width', 800);
  properties.Init(IniFile, Display_Height, 'display', 'height', 480);
  properties.Init(IniFile, Display_Left, 'display', 'left', 0);
  properties.Init(IniFile, Display_Top, 'display', 'top', 0);
  properties.Init(IniFile, Display_Fullscreen, 'display', 'fullscreen', false);
  properties.Init(IniFile, Display_Path, 'display', 'path', configPath + 'display/');
  properties.Init(IniFile, Display_Notes3D, 'display', '3d_notes', true);

  //screen_songs
  properties.Init(IniFile, SongsScreen_TextLeft, 'screen_songs', 'text_left', 100.0);
  properties.Init(IniFile, SongsScreen_TextSpacing, 'screen_songs', 'text_space', 40.0);
  properties.Init(IniFile, SongsScreen_TextColour, 'screen_songs', 'text_colour', '#FFFFFFFF');
  properties.Init(IniFile, SongsScreen_HighlightedTextColour, 'screen_songs', 'text_colour_highlighted', '#FF00FFFF');
  properties.Init(IniFile, SongsScreen_SideBarDelay, 'screen_songs', 'sidebar_delay', 500);
  properties.Init(IniFile, SongsScreen_SideBarColour, 'screen_songs', 'sidebar_colour', '#AAAAAAAA');
  properties.Init(IniFile, SongsScreen_BackgroundImage, 'screen_songs', 'background_image', 'background_songs.png');
  properties.Init(IniFile, SongsScreen_SideBarImage, 'screen_songs', 'sidebar_image', 'sidebar_songs.png');

  //screen_game
  properties.Init(IniFile, GameScreen_RotateX, 'screen_game', 'neck_rotate_x', 15.0);
  properties.Init(IniFile, GameScreen_RotateY, 'screen_game', 'neck_rotate_y', 0.0);
  properties.Init(IniFile, GameScreen_RotateZ, 'screen_game', 'neck_rotate_z', 0.0);
  properties.Init(IniFile, GameScreen_TranslateX, 'screen_game', 'neck_translate_x', 0.0);
  properties.Init(IniFile, GameScreen_TranslateY, 'screen_game', 'neck_translate_y', 10.0);
  properties.Init(IniFile, GameScreen_TranslateZ, 'screen_game', 'neck_translate_z', -100.0);
  properties.Init(IniFile, GameScreen_ScaleX, 'screen_game', 'neck_scale_x', 1.0);
  properties.Init(IniFile, GameScreen_ScaleY, 'screen_game', 'neck_scale_y', 1.0);
  properties.Init(IniFile, GameScreen_ScaleZ, 'screen_game', 'neck_scale_z', 1.0);
  properties.Init(IniFile, GameScreen_NoteLife, 'screen_game', 'note_life', 1400);
  properties.Init(IniFile, GameScreen_NeckLength, 'screen_game', 'neck_length', 70.0);
  properties.Init(IniFile, GameScreen_NeckWidth, 'screen_game', 'neck_width', 14.0);

  //strings
  properties.Init(IniFile, Strings_Resume, 'strings', 'resume', 'Resume');
  properties.Init(IniFile, Strings_Restart, 'strings', 'restart', 'Restart');
  properties.Init(IniFile, Strings_NewSong, 'strings', 'new_song', 'New Song');
  properties.Init(IniFile, Strings_Quit, 'strings', 'quit', 'Quit');
  properties.Init(IniFile, Strings_Open, 'strings', 'open', 'Open');
  properties.Init(IniFile, Strings_Back, 'strings', 'back', 'Back');
  properties.Init(IniFile, Strings_Play, 'strings', 'play', 'Play');
  properties.Init(IniFile, Strings_Finished, 'strings', 'finished', 'Finished');
  properties.Init(IniFile, Strings_Easy, 'strings', 'easy', 'Easy');
  properties.Init(IniFile, Strings_Medium, 'strings', 'medium', 'Medium');
  properties.Init(IniFile, Strings_Hard, 'strings', 'hard', 'Hard');
  properties.Init(IniFile, Strings_Expert, 'strings', 'expert', 'Expert');
  properties.Init(IniFile, Strings_NoSongInfo, 'strings', 'no_song_info', 'No song info');
  properties.Init(IniFile, Strings_NoArtistInfo, 'strings', 'no_artist_info', 'No artist info');
  properties.Init(IniFile, Strings_NoAlbumInfo, 'strings', 'no_album_info', 'No album info');
  properties.Init(IniFile, Strings_NoYearInfo, 'strings', 'no_year_info', 'No year info');

  //lanes
  clearDrumParts;
  drumParts.Add(TDrumPart.Create(IniFile, 'Snare', 'snare'));
  drumParts.Add(TDrumPart.Create(IniFile, 'Hi-hat cymbal (open)', 'hihat_open'));
  drumParts.Add(TDrumPart.Create(IniFile, 'Hi-hat cymbal (closed)', 'hihat_closed'));
  drumParts.Add(TDrumPart.Create(IniFile, 'Bass drum', 'bass'));
  drumParts.Add(TDrumPart.Create(IniFile, 'Crash cymbal', 'crash'));
  drumParts.Add(TDrumPart.Create(IniFile, 'Ride cymbal', 'ride'));
  drumParts.Add(TDrumPart.Create(IniFile, 'High tom', 'tom_high'));
  drumParts.Add(TDrumPart.Create(IniFile, 'Medium tom', 'tom_medium'));
  drumParts.Add(TDrumPart.Create(IniFile, 'Low tom', 'tom_low'));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 1', ''));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 2', ''));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 3', ''));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 4', ''));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 5', ''));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 6', ''));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 7', ''));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 8', ''));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 9', ''));
  drumParts.Add(TDrumPart.Create(IniFile, 'General Purpose 10', ''));

  cboLanes.Clear;
  cboMappingLane.Clear;
  for i := 0 to drumParts.Count - 1 do
  begin
    drumPart := TDrumPart(drumParts.Items[i]);
    cboLanes.AddItem(drumPart.FriendlyName, drumPart);
    cboMappingLane.AddItem(drumPart.FriendlyName, drumPart);
  end;
  cboLanes.ItemIndex := 0;
  cboMappingLane.ItemIndex := 0;

  iniFile.Free;
end;

procedure TfrmMain.updateUI;
begin
  //songs pane
  strSongsPath.Text := properties[Songs_Path];
  chkAllowCustomLayouts.Checked := not properties[Songs_IgnoreCustomLayouts];
  chkAllowCustomSounds.Checked := not properties[Songs_IgnoreCustomSounds];
  chkAllowCustomTextures.Checked := not properties[Songs_IgnoreCustomTextures];
  chkAllowCustomMeshes.Checked := not properties[Songs_IgnoreCustomMeshes];

  //song information
  strSongName.Text := properties[SongInformation_Name];
  strSongAlbum.Text := properties[SongInformation_Album];
  strSongArtist.Text := properties[SongInformation_Artist];
  strSongYear.Text := properties[SongInformation_Year];
  strSongAlbumCover.Text := properties[SongInformation_Cover];

  //strings pane
  strResume.Text := properties[Strings_Resume];
  strRestart.Text := properties[Strings_Restart];
  strNewSong.Text := properties[Strings_NewSong];
  strQuit.Text := properties[Strings_Quit];
  strOpen.Text := properties[Strings_Open];
  strBack.Text := properties[Strings_Back];
  strPlay.Text := properties[Strings_Play];
  strFinished.Text := properties[Strings_Finished];
  strEasy.Text := properties[Strings_Easy];
  strMedium.Text := properties[Strings_Medium];
  strHard.Text := properties[Strings_Hard];
  strExpert.Text := properties[Strings_Expert];
  strNoSongInfo.Text := properties[Strings_NoSongInfo];
  strNoArtistInfo.Text := properties[Strings_NoArtistInfo];
  strNoAlbumInfo.Text := properties[Strings_NoAlbumInfo];
  strNoYearInfo.Text := properties[Strings_NoYearInfo];

  //display pane
  chkFullscreen.Checked := properties[Display_Fullscreen];
  strWidth.Text := properties[Display_Width];
  strHeight.Text := properties[Display_Height];
  strLeft.Text := properties[Display_Left];
  strTop.Text := properties[Display_Top];
  strDisplayPath.Text := properties[Display_Path];
  chkNotes3D.Checked := properties[Display_Notes3D];

  //song screen pane
  strSongBackImage.Text := properties[SongsScreen_BackgroundImage];
  strTextLeft.Text := properties[SongsScreen_TextLeft];
  strTextSpacing.Text := properties[SongsScreen_TextSpacing];
  strSideBarImage.Text := properties[SongsScreen_SideBarImage];
  strSideBarDelay.Text := properties[SongsScreen_SideBarDelay];
  lblTextColour.Color := hexToTColor(properties[SongsScreen_TextColour]);
  trkTextAlpha.Position := getAlpha(properties[SongsScreen_TextColour]);
  lblHighlightedColour.Color := hexToTColor(properties[SongsScreen_HighlightedTextColour]);
  trkHighlightedAlpha.Position := getAlpha(properties[SongsScreen_HighlightedTextColour]);
  lblSideBarColour.Color := hexToTColor(properties[SongsScreen_SideBarColour]);
  trkSideAlpha.Position := getAlpha(properties[SongsScreen_SideBarColour]);

  //game screen pane
  strNeckRotX.Text := properties[GameScreen_RotateX];
  strNeckRotY.Text := properties[GameScreen_RotateY];
  strNeckRotZ.Text := properties[GameScreen_RotateZ];
  strNeckMoveX.Text := properties[GameScreen_TranslateX];
  strNeckMoveY.Text := properties[GameScreen_TranslateY];
  strNeckMoveZ.Text := properties[GameScreen_TranslateZ];
  strNeckScaleX.Text := properties[GameScreen_ScaleX];
  strNeckScaleY.Text := properties[GameScreen_ScaleY];
  strNeckScaleZ.Text := properties[GameScreen_ScaleZ];
  strNeckLength.Text := properties[GameScreen_NeckLength];
  strNeckWidth.Text := properties[GameScreen_NeckWidth];
  strNoteLife.Text := properties[GameScreen_NoteLife];

  cboMappingLaneChange(nil);
  cboLanesChange(nil);

  pageSongs.Enabled := not songConfig;
  pageStrings.Enabled := not songConfig;
  pageSongScreen.Enabled := not songConfig;
  pageDisplay.Enabled := not songConfig;
  strDisplayPath.Enabled := not songConfig;
  pageSongInfo.Enabled := songConfig;
  if (songConfig) then
  begin
    pages.ActivePageIndex := 3;
    pages.Pages[0].TabVisible := true;
    pages.Pages[1].TabVisible := true;
    pages.Pages[2].TabVisible := true;
    pages.Pages[3].TabVisible := true;
    pages.Pages[4].TabVisible := false;
    pages.Pages[5].TabVisible := false;
    pages.Pages[6].TabVisible := false;
    pages.Pages[7].TabVisible := false;
  end else
  begin
    pages.Pages[0].TabVisible := true;
    pages.Pages[1].TabVisible := true;
    pages.Pages[2].TabVisible := true;
    pages.Pages[3].TabVisible := false;
    pages.Pages[4].TabVisible := true;
    pages.Pages[5].TabVisible := true;
    pages.Pages[6].TabVisible := true;
    pages.Pages[7].TabVisible := true;
    pages.ActivePageIndex := 4;
  end;

end;

procedure TfrmMain.cmdDrumpsterBrowseClick(Sender: TObject);
var
  extension : String;
begin
  if (odDrumpster.Execute) then
  begin
    strDrumpsterPath.Text := odDrumpster.FileName;
    pages.Enabled := true;
    cmdSave.Enabled := true;
    extension := UpperCase(RightStr(strDrumpsterPath.Text, 4));
    songConfig := (extension = '.MID') or (extension = '.GP3') or (extension = '.GP4');

    loadConfiguration(odDrumpster.FileName);
    updateUI;
  end;
end;

procedure TfrmMain.setLaneColour;
var
  drumPart : TDrumPart;
begin
  drumPart := TDrumPart(cboLanes.Items.Objects[cboLanes.ItemIndex]);
  if (drumPart = nil) then
    exit;

  drumPart.Properties.Field[Lane_Colour].Value := TColorToString(lblLaneColour.Color, trkLaneAlpha.Position);
end;

procedure TfrmMain.cmdLaneColourClick(Sender: TObject);
begin
  if (cdLane.Execute) then
  begin
    lblLaneColour.Color := cdLane.Color;
    setLaneColour;
  end;
end;

procedure TfrmMain.cmdLaneSpriteClick(Sender: TObject);
var
  pickSprite : TfrmSpritePicker;
begin
  pickSprite := TfrmSpritePicker.Create(self);
  pickSprite.Load('d:\dirk\Downloads\protest.png');
  pickSprite.ShowModal;
  pickSprite.Free;
end;

procedure TfrmMain.cmdRemoveMappingClick(Sender: TObject);
var
  drumPart : TDrumPart;
begin
  drumPart := TDrumPart(cboMappingLane.Items.Objects[cboMappingLane.ItemIndex]);
  if (drumPart = nil) then
    exit;

  drumPart.RemoveMapping(StrToInt(lstMappings.Items[lstMappings.ItemIndex]));
  lstMappings.Items.Delete(lstMappings.ItemIndex);
  cmdRemoveMapping.Enabled := false;
end;

procedure TfrmMain.cmdSaveClick(Sender: TObject);
var
  IniFile : TIniFile;
  drumPart : TDrumPart;
  i : integer;
begin

  //songs pane
  properties.Field[Songs_Path].Value := strSongsPath.Text;
  properties.Field[Songs_IgnoreCustomLayouts].Value := not chkAllowCustomLayouts.Checked;
  properties.Field[Songs_IgnoreCustomSounds].Value := not chkAllowCustomSounds.Checked;
  properties.Field[Songs_IgnoreCustomTextures].Value := not chkAllowCustomTextures.Checked;
  properties.Field[Songs_IgnoreCustomMeshes].Value := not chkAllowCustomMeshes.Checked;

  //song information
  properties.Field[SongInformation_Name].Value := strSongName.Text;
  properties.Field[SongInformation_Artist].Value := strSongArtist.Text;
  properties.Field[SongInformation_Album].Value := strSongAlbum.Text;
  properties.Field[SongInformation_Year].Value := strSongYear.Text;
  properties.Field[SongInformation_Cover].Value := strSongAlbumCover.Text;

  //strings pane
  properties.Field[Strings_Resume].Value := strResume.Text;
  properties.Field[Strings_Restart].Value := strRestart.Text;
  properties.Field[Strings_NewSong].Value := strNewSong.Text;
  properties.Field[Strings_Quit].Value := strQuit.Text;
  properties.Field[Strings_Open].Value := strOpen.Text;
  properties.Field[Strings_Back].Value := strBack.Text;
  properties.Field[Strings_Play].Value := strPlay.Text;
  properties.Field[Strings_Finished].Value := strFinished.Text;
  properties.Field[Strings_Easy].Value := strEasy.Text;
  properties.Field[Strings_Medium].Value := strMedium.Text;
  properties.Field[Strings_Hard].Value := strHard.Text;
  properties.Field[Strings_Expert].Value := strExpert.Text;
  properties.Field[Strings_NoSongInfo].Value := strNoSongInfo.Text;
  properties.Field[Strings_NoArtistInfo].Value := strNoArtistInfo.Text;
  properties.Field[Strings_NoAlbumInfo].Value := strNoAlbumInfo.Text;
  properties.Field[Strings_NoYearInfo].Value := strNoYearInfo.Text;

  //display pane
  properties.Field[Display_Fullscreen].Value := chkFullscreen.Checked;
  properties.Field[Display_Width].Value := StrToInt(strWidth.Text);
  properties.Field[Display_Height].Value := StrToInt(strHeight.Text);
  properties.Field[Display_Left].Value := StrToInt(strLeft.Text);
  properties.Field[Display_Top].Value := StrToInt(strTop.Text);
  properties.Field[Display_Path].Value := strDisplayPath.Text;
  properties.Field[Display_Notes3D].Value := chkNotes3D.Checked;

  //song screen pane
  properties.Field[SongsScreen_BackgroundImage].Value := strSongBackImage.Text;
  properties.Field[SongsScreen_TextLeft].Value := StrToFloat(strTextLeft.Text);
  properties.Field[SongsScreen_TextSpacing].Value := StrToFloat(strTextSpacing.Text);
  properties.Field[SongsScreen_SideBarImage].Value := strSideBarImage.Text;
  properties.Field[SongsScreen_SideBarDelay].Value := StrToInt(strSideBarDelay.Text);
  properties.Field[SongsScreen_TextColour].Value := TColorToString(lblTextColour.Color, trkTextAlpha.Position);
  properties.Field[SongsScreen_HighlightedTextColour].Value := TColorToString(lblHighlightedColour.Color, trkHighlightedAlpha.Position);
  properties.Field[SongsScreen_SideBarColour].Value := TColorToString(lblSideBarColour.Color, trkSideAlpha.Position);

  //game screen pane
  properties.Field[GameScreen_RotateX].Value := StrToFloat(strNeckRotX.Text);
  properties.Field[GameScreen_RotateY].Value := StrToFloat(strNeckRotY.Text);
  properties.Field[GameScreen_RotateZ].Value := StrToFloat(strNeckRotZ.Text);
  properties.Field[GameScreen_TranslateX].Value := StrToFloat(strNeckMoveX.Text);
  properties.Field[GameScreen_TranslateY].Value := StrToFloat(strNeckMoveY.Text);
  properties.Field[GameScreen_TranslateZ].Value := StrToFloat(strNeckMoveZ.Text);
  properties.Field[GameScreen_ScaleX].Value := StrToFloat(strNeckScaleX.Text);
  properties.Field[GameScreen_ScaleY].Value := StrToFloat(strNeckScaleY.Text);
  properties.Field[GameScreen_ScaleZ].Value := StrToFloat(strNeckScaleZ.Text);
  properties.Field[GameScreen_NeckLength].Value := StrToFloat(strNeckLength.Text);
  properties.Field[GameScreen_NeckWidth].Value := StrToFloat(strNeckWidth.Text);
  properties.Field[GameScreen_NoteLife].Value := StrToInt(strNoteLife.Text);

  DeleteFile(iniPath);
  IniFile := TIniFile.Create(iniPath);
  properties.Write(IniFile);
  for i := 0 to drumParts.Count-1 do
  begin
    drumPart := TDrumPart(drumParts.Items[i]);
    drumPart.Write(IniFile);
  end;
  IniFile.Destroy;
end;

function TfrmMain.getSongScreenImage : string;
var
  path : String;
  displayPath : String;
  message : String;
begin
  result := '';
  opSongScreen.InitialDir := properties[Display_Path];
  if (opSongScreen.Execute) then
  begin
    path := forwardSlash(ExtractFilePath(opSongScreen.Filename));
    displayPath := properties[Display_Path];
    if (path <> displayPath) then
    begin
      message := 'The image is not in the configured display path, it will not be used until it is moved from ' +
                             path + ' to ' + displayPath;
      Application.MessageBox(pchar(message), 'Caution', 0);
    end;
    result := ExtractFileName(opSongScreen.FileName);
  end;
end;

procedure TfrmMain.cmdSideBarImageBrowseClick(Sender: TObject);
var
  image : String;
begin
  image := getSongScreenImage;
  if (image <> '') then
     strSideBarImage.Text := image;
end;

procedure TfrmMain.cmdSongBackBrowseClick(Sender: TObject);
var
  image : String;
begin
  image := getSongScreenImage;
  if (image <> '') then
     strSongBackImage.Text := image;
end;

procedure TfrmMain.cmdSongCoverBrowserClick(Sender: TObject);
begin
  if (opSongCover.Execute) then
  begin
    strSongAlbumCover.Text := opSongCover.FileName;
  end;
end;

procedure TfrmMain.cmdSongTextColourClick(Sender: TObject);
begin
  if (cdSongScreen.Execute) then
  begin
    lblTextColour.Color := cdSongScreen.Color;
  end;
end;

procedure TfrmMain.chkLaneDisabledChange(Sender: TObject);
begin
  grpLane.Enabled := not chkLaneDisabled.Checked;
end;

procedure TfrmMain.chkMeshUsesColourChange(Sender: TObject);
var
  drumPart : TDrumPart;
begin
  drumPart := TDrumPart(cboLanes.Items.Objects[cboLanes.ItemIndex]);
  if (drumPart = nil) then
    exit;

  drumPart.Properties.Field[Lane_MeshUseColour].Value := chkMeshUsesColour.Checked;
end;

procedure TfrmMain.cmdAddMappingClick(Sender: TObject);
var
  drumPart : TDrumPart;
begin
  drumPart := TDrumPart(cboMappingLane.Items.Objects[cboMappingLane.ItemIndex]);
  if (drumPart = nil) then
    exit;

  if drumPart.AddMapping(StrToInt(strMidiNote.Text)) then
    lstMappings.Items.Add(strMidiNote.Text);
end;

procedure TfrmMain.cmdBrowseDisplayPathClick(Sender: TObject);
begin

end;

procedure TfrmMain.chkFullscreenChange(Sender: TObject);
begin
  strLeft.Enabled := not chkFullscreen.Checked;
  strTop.Enabled := not chkFullscreen.Checked;
end;

procedure TfrmMain.cboLanesChange(Sender: TObject);
var
  drumPart : TDrumPart;
begin
  drumPart := TDrumPart(cboLanes.Items.Objects[cboLanes.ItemIndex]);
  if (drumPart = nil) then
    exit;

  strLanePosition.Text := drumPart.Properties[Lane_Position];
  strLaneWidth.Text := drumPart.Properties[Lane_Width];

  strMidiPortIn.Text := drumPart.Properties[Lane_MidiInPort];
  strMidiChannelIn.Text := drumPart.Properties[Lane_MidiInChannel];
  strMidiNoteIn.Text := drumPart.Properties[Lane_MidiInNote];

  strMidiPortOut.Text := drumPart.Properties[Lane_MidiOutPort];
  strMidiChannelOut.Text := drumPart.Properties[Lane_MidiOutChannel];
  strMidiNoteOut.Text := drumPart.Properties[Lane_MidiOutNote];

  chkMeshUsesColour.Checked := drumPart.properties[Lane_MeshUseColour];
  lblLaneColour.Color := hexToTColor(drumPart.properties[Lane_Colour]);
  trkLaneAlpha.Position := getAlpha(drumPart.properties[Lane_Colour]);

end;

procedure TfrmMain.cboMappingLaneChange(Sender: TObject);
var
  drumPart : TDrumPart;
  i : integer;
begin
  drumPart := TDrumPart(cboMappingLane.Items.Objects[cboMappingLane.ItemIndex]);
  if (drumPart = nil) then
    exit;

  lstMappings.Clear;
  for i := 0 to drumPart.Mappings.Count-1 do
    lstMappings.Items.Add(drumPart.Mappings[i]);
end;


end.

