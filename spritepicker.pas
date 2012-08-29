unit spritepicker;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, IntfGraphics;

type

  TMoveMode = ( MoveMode_None, MoveMode_Image, MoveMode_TopLeft, MoveMode_BottomRight );

  { TfrmSpritePicker }

  TfrmSpritePicker = class(TForm)
    cmdOk: TButton;
    cmdCancel: TButton;
    imgTexture: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure imgTextureMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgTextureMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgTextureMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
    offsetX : integer;
    offsetY : integer;
    lastX : integer;
    lastY : integer;
    png : TPortableNetworkGraphic;
    sprite : TRect;
    moveMode : TMoveMode;
    procedure updateImage;
  public
    { public declarations }
    procedure Load(FileName : String);
  property
    CoOrds : TRect read sprite;
  end; 

implementation

{$R *.lfm}

{ TfrmSpritePicker }

procedure TfrmSpritePicker.Load(FileName : String);
begin
  png := TPortableNetworkGraphic.Create;
  png.LoadFromFile(FileName);

  sprite.Left := 0;
  sprite.Top := 0;
  sprite.Right := png.Width;
  sprite.Bottom := png.Height;
  moveMode := MoveMode_None;
end;

procedure TfrmSpritePicker.imgTextureMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  lastX  := X;
  lastY  := Y;

  X := X + offsetX;
  Y := Y + offsetY;
  if (abs(sprite.Left - X) < 5) and (abs(sprite.Top - Y) < 5) then
    moveMode := MoveMode_TopLeft
  else if (abs(sprite.Right - X) < 5) and (abs(sprite.Bottom - Y) < 5) then
    moveMode := MoveMode_BottomRight
  else
    moveMode := MoveMode_Image;
end;

procedure TfrmSpritePicker.updateImage;
var
  source : TRect;
  destination : TRect;
  imageWidth : integer;
  imageHeight : integer;
  movedRect : TRect;
begin
  if (png = nil) then
    exit;

  imageWidth := png.Width;
  imageHeight := png.Height;
  if (imageWidth > imgTexture.Width) then
    imageWidth := imgTexture.Width;
  if (imageHeight > imgTexture.Height) then
    imageHeight := imgTexture.Height;

  if (offsetX + imageWidth > png.Width) then
    offsetX := png.Width - imgTexture.Width;
  if (offsetY + imageHeight > png.Height) then
    offsetY := png.Height - imgTexture.Height;

  if (offsetX < 0) then
    offsetX := 0;
  if (offsetY < 0) then
    offsetY := 0;

  destination := Rect(0, 0, imageWidth, imageHeight);
  source := Rect(offsetX, offsetY, offsetX + imageWidth, offsetY + imageHeight);
  imgTexture.Canvas.CopyRect(destination, png.Canvas, source);
  movedRect.Left := sprite.Left - offsetX;
  movedRect.Top := sprite.Top - offsetY;
  movedRect.Right := sprite.Right - offsetX;
  movedRect.Bottom := sprite.Bottom - offsetY;
  imgTexture.Canvas.DrawFocusRect(movedRect);
end;

procedure TfrmSpritePicker.imgTextureMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  diffX : integer;
  diffY : integer;
begin
  if (abs(X - offsetX - sprite.Left) < 5) and (abs(Y - offsetY - sprite.Top) < 5) then
    imgTexture.Cursor := crSizeNW
  else if (abs(X - offsetX - sprite.Right) < 5) and (abs(Y - offsetY - sprite.Bottom) < 5) then
    imgTexture.Cursor := crSizeSE
  else
    imgTexture.Cursor := crSizeAll;

  if (moveMode <> MoveMode_None) then
  begin
    diffX := lastX - X;
    diffY := lastY - Y;
    lastX := X;
    lastY := Y;

    case moveMode of
      MoveMode_TopLeft:
      begin
        sprite.Left := sprite.Left - diffX;
        sprite.Top := sprite.Top - diffY;
      end;
      MoveMode_BottomRight:
      begin
        sprite.Right := sprite.Right - diffX;
        sprite.Bottom := sprite.Bottom - diffY;
      end;
      MoveMode_Image:
      begin
        offsetX := offsetX + diffX;
        offsetY := offsetY + diffY;
      end;
    end;
    updateImage;
  end;
end;

procedure TfrmSpritePicker.imgTextureMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  moveMode := MoveMode_None;
end;

procedure TfrmSpritePicker.FormCreate(Sender: TObject);
begin
  moveMode := MoveMode_None;
  DoubleBuffered := true;
end;

procedure TfrmSpritePicker.FormResize(Sender: TObject);
begin
// hmm, anchors don't seem to work on the TImage, and doing the stuff below acts the same.
// almost as if the image isn't being resized within the control.
//  imgTexture.Width := ClientWidth - (imgTexture.Left * 2);
//  imgTexture.Height := ClientHeight - (imgTexture.Top * 2);
  updateImage;
end;

end.

