UNIT solitaire_unit;

{$mode objfpc}{$H+}

INTERFACE

Uses
  About_unit,
  Classes,
  Controls,
  Dialogs,
  ExtCtrls,         // TImage
  Forms,
  Graphics,
  StdCtrls, Buttons, Menus, ComCtrls,
  SysUtils, Types;

Type

    // FORM TYPES ...

    // TfrmMain

  TfrmMain = class(TForm)
    imgAutoPlay: TImage;
    imgAutoPlayHand: TImage;
    imgAutoPlayCogs: TImage;
    imgTagborder: TImage;

    pnlSolitaire         : TPanel;
    imgNewGame           : TImage;
    imgReplay            : TImage;
    imgUndo              : TImage;
    imgHint              : TImage;
    imgRepaint           : TImage;
    imgAbout             : TImage;
    imgQuit              : TImage;

    imgNewGameNormal     : TImage;
    imgNewGameHighlight  : TImage;
    imgReplayNormal      : TImage;
    imgReplayHighlight   : TImage;
    imgUndoNormal        : TImage;
    imgUndoHighlight     : TImage;
    imgHintNormal        : TImage;
    imgHintHighlight     : TImage;
    tbarSpeed            : TTrackBar;
    imgRepaintNormal     : TImage;     {not use}
    imgRepaintHighlight  : TImage;     {not used}
    imgAboutNormal       : TImage;
    imgAboutHighlight    : TImage;
    imgQuitNormal        : TImage;
    imgQuitHighlight     : TImage;

    shpDrawempty         : TShape;
    shpScore1Empty       : TShape;
    shpScore2empty       : TShape;
    shpScore3empty       : TShape;
    shpScore4empty       : TShape;

    imgTouch             : TImage;
    imgTag               : TImage;
    timAutoPlay: TTimer;
    timFirstGame         : TTimer;

    Card01               : TImage;
    Card02               : TImage;
    Card03               : TImage;
    Card04               : TImage;
    Card05               : TImage;
    Card06               : TImage;
    Card07               : TImage;
    Card08               : TImage;
    Card09               : TImage;
    Card10               : TImage;
    Card11               : TImage;
    Card12               : TImage;
    Card13               : TImage;
    Card14               : TImage;
    Card15               : TImage;
    Card16               : TImage;
    Card17               : TImage;
    Card18               : TImage;
    Card19               : TImage;
    Card20               : TImage;
    Card21               : TImage;
    Card22               : TImage;
    Card23               : TImage;
    Card24               : TImage;
    Card25               : TImage;
    Card26               : TImage;
    Card27               : TImage;
    Card28               : TImage;
    Card29               : TImage;
    Card30               : TImage;
    Card31               : TImage;
    Card32               : TImage;
    Card33               : TImage;
    Card34               : TImage;
    Card35               : TImage;
    Card36               : TImage;
    Card37               : TImage;
    Card38               : TImage;
    Card39               : TImage;
    Card40               : TImage;
    Card41               : TImage;
    Card42               : TImage;
    Card43               : TImage;
    Card44               : TImage;
    Card45               : TImage;
    Card46               : TImage;
    Card47               : TImage;
    Card48               : TImage;
    Card49               : TImage;
    Card50               : TImage;
    Card51               : TImage;
    Card52               : TImage;


    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure imgAutoPlayClick(Sender: TObject);
    procedure imgAutoPlayMouseEnter(Sender: TObject);
    procedure imgAutoPlayMouseLeave(Sender: TObject);

    procedure imgNewGameClick(Sender: TObject);
    procedure imgNewGameMouseEnter(Sender: TObject);
    procedure imgNewGameMouseLeave(Sender: TObject);
    procedure imgQuitNormalClick(Sender: TObject);
    procedure imgRepaintHighlightClick(Sender: TObject);
    procedure imgReplayClick(Sender: TObject);
    procedure imgReplayMouseEnter(Sender: TObject);
    procedure imgReplayMouseLeave(Sender: TObject);
    procedure imgTagborderClick(Sender: TObject);
    procedure imgUndoClick(Sender: TObject);
    procedure imgUndoMouseEnter(Sender: TObject);
    procedure imgUndoMouseLeave(Sender: TObject);
    procedure imgHintMouseEnter(Sender: TObject);
    procedure imgHintMouseLeave(Sender: TObject);
    procedure imgRepaintClick(Sender: TObject);
    procedure imgRepaintMouseEnter(Sender: TObject);
    procedure imgRepaintMouseLeave(Sender: TObject);
    procedure tbarSpeedChange(Sender: TObject);
    procedure imgAboutClick(Sender: TObject);
    procedure imgAboutMouseEnter(Sender: TObject);
    procedure imgAboutMouseLeave(Sender: TObject);
    procedure imgQuitClick(Sender: TObject);
    procedure imgQuitMouseEnter(Sender: TObject);
    procedure imgQuitMouseLeave(Sender: TObject);

    procedure mdown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mmove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure mup(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure sclick(Sender: TObject);

    procedure shpDrawemptyMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure timAutoPlayTimer(Sender: TObject);
    procedure timFirstGameTimer(Sender: TObject);

  private
  public
  end;

    // ENUMERATION TYPES ...

    // "card" is an enumerated type.
    // Just like a "char" etc.
    // So a variable of type "card" is one value from this list, not a set.
    // Note that we use "c2" etc. and not "2c". Why? Because enumeration
    // entries must conform to identifier naming.
    // Note too that they are in the order clubs, diamonds, spades, hearts.
    // And that they run from Ace to King, not 2 to Ace. In solitaire, the
    // Ace acts as a one.

  card = (ca, c2, c3, c4, c5, c6, c7, c8, c9, c10, cj, cq, ck,
          da, d2, d3, d4, d5, d6, d7, d8, d9, d10, dj, dq, dk,
          sa, s2, s3, s4, s5, s6, s7, s8, s9, s10, sj, sq, sk,
          ha, h2, h3, h4, h5, h6, h7, h8, h9, h10, hj, hq, hk);

    // Note that these are just suit *names*.
    // The actual *suits* of cards are in the Const section below, with "s".

  suit = (club, diamond, spade, heart);

    // SET TYPES ...

    // So a variable of type "cardset" is a set containing members of type "card".

  cardset = set of card;

  colour = (black, red);

    // ARRAY TYPES

  cardarray = array [1..52] of card;

Const

    // Could have used functions to calculate these on the fly, but decided to
    // define up front.

  cardnames	: array [card] of shortstring
 		= ('AC',    '2C',    '3C',    '4C',    '5C',    '6C',    '7C',    '8C',    '9C',    'TC',    'JC',    'QC',    'KC',
 		   'AD',    '2D',    '3D',    '4D',    '5D',    '6D',    '7D',    '8D',    '9D',    'TD',    'JD',    'QD',    'KD',
 		   'AS',    '2S',    '3S',    '4S',    '5S',    '6S',    '7S',    '8S',    '9S',    'TS',    'JS',    'QS',    'KS',
                   'AH',    '2H',    '3H',    '4H',    '5H',    '6H',    '7H',    '8H',    '9H',    'TH',    'JH',    'QH',    'KH');

  cardsuit      : array [card] of suit
                = (club,    club,    club,    club,    club,    club,    club,    club,    club,    club,    club,    club,    club,
                   diamond, diamond, diamond, diamond, diamond, diamond, diamond, diamond, diamond, diamond, diamond, diamond, diamond,
                   spade,   spade,   spade,   spade,   spade,   spade,   spade,   spade,   spade,   spade,   spade,   spade,   spade,
                   heart,   heart,   heart,   heart,   heart,   heart,   heart,   heart,   heart,   heart,   heart,   heart,   heart);

  cardcolour    : array [card] of colour
                = (black,   black,   black,   black,   black,   black,   black,   black,   black,   black,   black,   black,   black,
                   red,     red,     red,     red,     red,     red,     red,     red,     red,     red,     red,     red,     red,
                   black,   black,   black,   black,   black,   black,   black,   black,   black,   black,   black,   black,   black,
                   red,     red,     red,     red,     red,     red,     red,     red,     red,     red,     red,     red,     red);

  cardrank      : array [card] of smallint
                = (1,       2,       3,       4,       5,       6,       7,       8,       9,       10,      11,      12,      13,
                   1,       2,       3,       4,       5,       6,       7,       8,       9,       10,      11,      12,      13,
                   1,       2,       3,       4,       5,       6,       7,       8,       9,       10,      11,      12,      13,
                   1,       2,       3,       4,       5,       6,       7,       8,       9,       10,      11,      12,      13);

  CARDWIDTH               : smallint = 72;
  CARDHEIGHT              : smallint = 96;
  deck		          : cardset = [ca..hk];
  clubs                   : cardset = [ca..ck];
  diamonds	          : cardset = [da..dk];
  spades	          : cardset = [sa..sk];
  hearts	          : cardset = [ha..hk];

  FORMWIDTH               : smallint = 600;
  FORMHEIGHT              : smallint = 550;


  DEALTOP                 : smallint = 400;
  DEALLEFT                : smallint = 264;

  DISCARDTOP              : smallint = 60;
  DISCARDLEFT             : smallint = 102;              {20 + 72 + 10 to line up with pile 2}

  DRAWTOP                 : smallint = 60;
  DRAWLEFT                : smallint = 20;

  PILESPACING             : smallint = 10;
  PILE1TOP                : smallint = 170;
  PILE1LEFT               : smallint = 20;

  SCORE1TOP               : smallint = 60;
  SCORE1LEFT              : smallint = 20 + 3*(72 + 10); {over the 4th. pile. note: would like to use CARDWIDTH instead of 72
                                                          in this expression, but cannot use defined constants in another
                                                          defined contant definition}

  SPACEFACEDOWN           : smallint = 10;               {vertical spacing between overlapping face down cards}
  SPACEFACEUP             : smallint = 20;               {between face up cards - need more space to show suit/rank}

Var

    // These are global variables.

  frmMain                 : TfrmMain;

  actioncard              : card;
  actionchaincard         : array [1..20]       of card;
  actionchaincount        : smallint;
  actionphase             : shortstring;
  actionpile              : smallint;
  actiontype              : shortstring;                      {make it enumerated}

  animatedelay            : smallint = 0;
  animateon               : boolean = True;

  autoplay                : boolean = False;
  autoplaydelay           : smallint = 0;

  backimage               : TImage;                           {back of the card}
  cardimage               : array [card]        of TImage;    {each card's image}

  consecutivedraws        : smallint;
  desperate               : boolean = False;

  discard                 : array [1..52]       of card;
  discardcount            : smallint = 0;

  draginitialcardtop      : smallint;
  draginitialcardleft     : smallint;
  draginitialmousex       : smallint;
  draginitialmousey       : smallint;
  dragoffsetx             : smallint;
  dragoffsety             : smallint;

  draw                    : array [1..52]       of card;
  drawcount               : smallint = 0;

  facedown                : array [1..7, 1..13] of card;
  facedowncount           : array [1..7]        of smallint;
  faceup                  : array [1..7, 1..13] of card;
  faceupcount             : array [1..7]        of smallint;
  faceuplanding           : array [1..7]        of smallint;
  faceuplandingcount      : smallint;
  gamedeck                : array [1..52]       of card;      {array, not a set, because in order}

  lastmouse               : shortstring;

  movecount               : smallint = 0;
  movecountmax            : smallint = 10000;                 {10,000 possible moves}
  movelogok               : Boolean;
  move                    : array [1..10000, 1..4] of smallint;
                                                    {columns:
                                                     1                2              3            4
                                                     Move type:
                                                     1 draw           #              -            -
                                                     2 redraw         -              -            -
                                                     3 discard up     -              toscorepile  -
                                                     4 faceup  up     frompile       toscorepile  -
                                                     5 discard down   -              topile       -
                                                     6 score   down   fromscorepile  topile       -
                                                     7 faceup  shift  frompile       topile       count
                                                     8 turnover       pile

                                                     Note that in this game, we only provide for 1 card to be drawn,
                                                     and we do not provide for a move from the score pile down (#6)
                                                     }

  ordereddeck             : array [1..52]       of card = (ca, c2, c3, c4, c5, c6, c7, c8, c9, c10, cj, cq, ck,
                                                           da, d2, d3, d4, d5, d6, d7, d8, d9, d10, dj, dq, dk,
                                                           sa, s2, s3, s4, s5, s6, s7, s8, s9, s10, sj, sq, sk,
                                                           ha, h2, h3, h4, h5, h6, h7, h8, h9, h10, hj, hq, hk);

  overlapfound            : boolean;
  overlapleft             : smallint;
  overlappile             : smallint;
  overlaptop              : smallint;
  overlaptype             : shortstring;

  pcard                   : array [card]        of TImage;    {deck of cards for game}

  previousoverlapfound    : boolean;
  previousoverlappile     : smallint;
  previousoverlaptype     : shortstring;

  score                   : array [1..4, 1..13] of card;
  scorecount              : array [1..4]        of smallint;
  scorelanding            : array [1..4]        of smallint;
  scorelandingcount       : smallint;
  scoresuit               : array [suit]        of smallint;     {suit tells which score pile}
  // not sure this is best way - reverse of lua, but seems easier to know where to put card up to

  selectmovecard          : card;
  selectmoveaction        : shortstring;
  selectmovefrompile      : smallint;
  selectmovescorepile     : smallint;
  selectmovetopile        : smallint;

IMPLEMENTATION

  // We declare all our procedures/functions "forward".
  // It allows us to use them in any order without worrying whether they have
  // been defined lexically first. And provides a nice reference list.

  // Set up
procedure setupotherimages;                                            forward;
procedure setuppanelimages;                                            forward;
procedure loadcardimagesfromresources;                                 forward;
procedure setupdeck;                                                   forward;
procedure setuptiming;                                                 forward;

  // Game flow
procedure startgame;                                                   forward;

procedure drawacard;                                                   forward;
procedure remakedrawpile;                                              forward;

procedure analyzediscard;                                              forward;
procedure analyzebottom (cardpile : smallint);                         forward;
procedure analyzeinterior (cardpile : smallint; topcard : card);       forward;

procedure movediscardtoscore (scorepile : smallint);                   forward;
procedure movediscardtofaceup (topile : smallint);                     forward;
procedure movebottomtoscore (frompile : smallint; scorepile : smallint); forward;
procedure movebottomtofaceup (frompile : smallint; topile : smallint); forward;
procedure moveinteriortofaceup (chaintopcard : card; frompile : smallint; topile : smallint); forward;
procedure turnoverfacedown (pile : smallint);                          forward;

  // Game help
procedure wherecanmove (cmove : card; cardposition : shortstring);     forward;
function balanced (targetcard : card)                     : boolean;   forward;
procedure overlaptarget;                                               forward;
procedure selectmove;                                                  forward;
procedure displayhint;                                                 forward;
procedure removehint;                                                  forward;

  // Undo routines
procedure undo_draw;                                                   forward;
procedure undo_redraw;                                                 forward;
procedure undo_discardtoscore;                                         forward;
procedure undo_faceuptoscore;                                          forward;
procedure undo_discardtofaceup;                                        forward;
procedure undo_scoretofaceup;                                          forward;
procedure undo_faceupshift;                                            forward;
procedure undo_turnoverfacedown;                                       forward;

  // Auto play
procedure doautoplaymove;                                              forward;

  // Card display
procedure layoutthegame;                                               forward;
procedure repaint;                                                     forward;
procedure tagdraw;                                                     forward;
procedure tagon (hintcard: card; targetpile: smallint; piletype: shortstring); forward;
procedure postscoreablecards;                                          forward;
procedure reward;                                                      forward;
procedure animate (c: card; endtop: smallint; endleft: smallint; frompile: smallint); forward;

  // Utility
function countcards (xcards : cardset)                    : smallint;  forward;
function cardpos_to_card (n : smallint; xcards : cardset) : card;      forward;
function pickarandomcard (xcards : cardset)               : card;      forward;
function shuffledeck ()                                   : cardarray; forward;

{$R *.lfm}
{$GOTO ON}


//###################################################################
// SET UP PROCEDURES
//###################################################################


//===================================================================
// Load the form
// The last thing it does is start the first game.
//==================================================================

procedure TfrmMain.FormCreate(Sender: TObject);

begin
  randomize;
  setuppanelimages;
  setupotherimages;
  loadcardimagesfromresources;
  setupdeck;
  setuptiming;

  timFirstGame.Enabled := True;
  //startgame;
end;

//===================================================================
// Set up other images.
//===================================================================

procedure setuppanelimages;

begin

  frmMain.imgNewGame.Picture  := frmMain.imgNewGameNormal.Picture;
  frmMain.imgReplay.Picture   := frmMain.imgReplayNormal.Picture;
  frmMain.imgUndo.Picture     := frmMain.imgUndoNormal.Picture;
  frmMain.imgHint.Picture     := frmMain.imgHintNormal.Picture;
  frmMain.imgRepaint.Picture  := frmMain.imgRepaintNormal.Picture;
  frmMain.imgAutoPlay.Picture := frmMain.imgAutoPlayHand.Picture;
  frmMain.imgAbout.Picture    := frmMain.imgAboutNormal.Picture;
  frmMain.imgQuit.Picture     := frmMain.imgQuitNormal.Picture;

  frmMain.imgRepaint.Visible  := False;     {not currently used};

end;

//===================================================================
// Set up other images.
//===================================================================

procedure setupotherimages;

begin

  frmMain.shpDrawempty.Top    := DRAWTOP;
  frmMain.shpDrawempty.LEFT   := DRAWLEFT;

  frmMain.shpScore1empty.Top  := SCORE1TOP;
  frmMain.shpScore1empty.Left := SCORE1LEFT;

  frmMain.shpScore2empty.Top  := SCORE1TOP;
  frmMain.shpScore2empty.Left := SCORE1LEFT + 72 + 10;

  frmMain.shpScore3empty.Top  := SCORE1TOP;
  frmMain.shpScore3empty.Left := SCORE1LEFT + 2*(72 + 10);

  frmMain.shpScore4empty.Top  := SCORE1TOP;
  frmMain.shpScore4empty.Left := SCORE1LEFT + 3*(72 + 10);

end;

//===================================================================
// Load card images from resources.
// This is preferred to loading from files as it allows the app
// to be distributed as a self-contained executable with no other
// files needed.
//===================================================================

procedure loadcardimagesfromresources;

var
  c                       : card;
  i                       : smallint = 0;
  n                       : shortstring;
  pic                     : TPicture;
  resname                 : shortstring;

begin

  pic := TPicture.Create;

    // The card back

  backimage := TImage.Create(frmMain);
  TImage(backimage).Transparent := True;
  TImage(backimage).Parent      := frmMain;
  TImage(backimage).Width       := CARDWIDTH;
  TImage(backimage).Height      := CARDHEIGHT;
  TImage(backimage).Left        := 1;
  TImage(backimage).Top         := 500;
  TImage(backimage).Visible     := False;

  pic.LoadFromResourceName (HInstance, 'BACKLOON');
  TImage(backimage).Picture.Assign(pic);

    // The card fronts

  for c in card do begin

    i := i + 1;

    cardimage[c] := TImage.Create(frmMain);
    TImage(cardimage[c]).Transparent := True;
    TImage(cardimage[c]).Parent      := frmMain;
    TImage(cardimage[c]).Width       := CARDWIDTH;
    TImage(cardimage[c]).Height      := CARDHEIGHT;
    TImage(cardimage[c]).Left        := 15*i;
    TImage(cardimage[c]).Top         := 500;
    TImage(cardimage[c]).Visible     := False;

    n := inttostr(i);
    if length(n) = 1 then begin
      n := '0' + n;
    end;

    resname := 'C' + n;
    pic.LoadFromResourceName (HInstance, resname);
    TImage(cardimage[c]).Picture.Assign(pic);

  end;

  pic.free;

end;

//===================================================================
// Prepare the deck of cards.
//
// We have the deck as an entity separate from the card images.
// That's because a card isn't just its face image. At times, it
// could be turned over, showing the back. We will denote 52 image
// controls, and put the appropriate image on as its use in the game
// dictates.
//===================================================================

procedure setupdeck;

var
  c                       : card;
  i                       : smallint = 0;

begin
       // ca ... ck da, sa ha

  pcard[ca]  := frmMain.Card01;
  pcard[c2]  := frmMain.Card02;
  pcard[c3]  := frmMain.Card03;
  pcard[c4]  := frmMain.Card04;
  pcard[c5]  := frmMain.Card05;
  pcard[c6]  := frmMain.Card06;
  pcard[c7]  := frmMain.Card07;
  pcard[c8]  := frmMain.Card08;
  pcard[c9]  := frmMain.Card09;
  pcard[c10] := frmMain.Card10;
  pcard[cj]  := frmMain.Card11;
  pcard[cq]  := frmMain.Card12;
  pcard[ck]  := frmMain.Card13;

  pcard[da]  := frmMain.Card14;
  pcard[d2]  := frmMain.Card15;
  pcard[d3]  := frmMain.Card16;
  pcard[d4]  := frmMain.Card17;
  pcard[d5]  := frmMain.Card18;
  pcard[d6]  := frmMain.Card19;
  pcard[d7]  := frmMain.Card20;
  pcard[d8]  := frmMain.Card21;
  pcard[d9]  := frmMain.Card22;
  pcard[d10] := frmMain.Card23;
  pcard[dj]  := frmMain.Card24;
  pcard[dq]  := frmMain.Card25;
  pcard[dk]  := frmMain.Card26;

  pcard[sa]  := frmMain.Card27;
  pcard[s2]  := frmMain.Card28;
  pcard[s3]  := frmMain.Card29;
  pcard[s4]  := frmMain.Card30;
  pcard[s5]  := frmMain.Card31;
  pcard[s6]  := frmMain.Card32;
  pcard[s7]  := frmMain.Card33;
  pcard[s8]  := frmMain.Card34;
  pcard[s9]  := frmMain.Card35;
  pcard[s10] := frmMain.Card36;
  pcard[sj]  := frmMain.Card37;
  pcard[sq]  := frmMain.Card38;
  pcard[sk]  := frmMain.Card39;

  pcard[ha]  := frmMain.Card40;
  pcard[h2]  := frmMain.Card41;
  pcard[h3]  := frmMain.Card42;
  pcard[h4]  := frmMain.Card43;
  pcard[h5]  := frmMain.Card44;
  pcard[h6]  := frmMain.Card45;
  pcard[h7]  := frmMain.Card46;
  pcard[h8]  := frmMain.Card47;
  pcard[h9]  := frmMain.Card48;
  pcard[h10] := frmMain.Card49;
  pcard[hj]  := frmMain.Card50;
  pcard[hq]  := frmMain.Card51;
  pcard[hk]  := frmMain.Card52;

  for c in card do begin

    i := i + 1;

    pcard[c].Transparent := True;
    pcard[c].Width := CARDWIDTH;
    pcard[c].Height := CARDHEIGHT;
    pcard[c].Left := DEALLEFT;
    pcard[c].Top := DEALTOP;
    pcard[c].Visible := True;
    pcard[c].Picture.Assign(backimage.Picture);

  end;

end;

//===================================================================
// Set up animation timing.
//
// We will have animations on so that all features of the program
// can be made aware.
//===================================================================

procedure setuptiming;

begin
  frmMain.tbarSpeed.Min := 0;
  frmMain.tbarSpeed.Max := 10;
  frmMain.tbarSpeed.Position := frmMain.tbarSpeed.Max - 1;
  animateon := True;
  animatedelay := 5 * (frmMain.tbarspeed.Max - frmMain.tbarSpeed.Position);
  autoplaydelay := animatedelay;
end;

//===================================================================
// Timer to start first game.
//
// (This timer has nothing to do with the animation timing above.)
//
// Lazarus won't show anything until the form.create event is over.
// That means if you want to show things moving around during the form
// setup, they won't appear. You only get the end result, the state
// when the form.create event finishes.
//
// We want to show some stuff. So we put a timer into the form.create
// event. The form.create event finishes, the timer runs, and when it
// finishes, it starts the first game and we get the effects.
//===================================================================

procedure TfrmMain.timFirstGameTimer(Sender: TObject);
begin
  timFirstGame.Enabled := False;
  startgame;
end;

//===================================================================
// Timer to pause between autplay moves.
//
// When it runs down, do another autplay move, unless the user has
// taken advantage of the intervl to turn autoplay off.
//===================================================================

procedure TfrmMain.timAutoPlayTimer(Sender: TObject);
begin
  timAutoPlay.Enabled := False;
  if autoplay = True then begin
    doautoplaymove;
  end;
end;


//###################################################################
// PANEL EVENTS
//###################################################################

//===================================================================
// New game - click: start game
//          - mouse enter: highlight
//          - mouse leave: normal
//===================================================================

procedure TfrmMain.imgNewGameClick(Sender: TObject);
begin
  startgame;
end;

procedure TfrmMain.imgNewGameMouseEnter(Sender: TObject);
begin
  imgNewGame.Picture := frmMain.imgNewGameHighlight.Picture;
end;

procedure TfrmMain.imgNewGameMouseLeave(Sender: TObject);
begin
  imgNewGame.Picture := frmMain.imgNewGameNormal.Picture;
end;

procedure TfrmMain.imgQuitNormalClick(Sender: TObject);
begin

end;

procedure TfrmMain.imgRepaintHighlightClick(Sender: TObject);
begin

end;

//===================================================================
// Replay - click: restart the same game
//        - mouse enter: highlight
//        - mouse leave: normal
//===================================================================

procedure TfrmMain.imgReplayClick(Sender: TObject);

begin

    // We reuse the gamedeck, which is not changed during the course of a game.

  layoutthegame;
  movecount := 0;
  movelogok := True;

end;

procedure TfrmMain.imgReplayMouseEnter(Sender: TObject);
begin
  imgReplay.Picture := frmMain.imgReplayHighlight.Picture;
end;

procedure TfrmMain.imgReplayMouseLeave(Sender: TObject);
begin
  imgReplay.Picture := frmMain.imgReplayNormal.Picture;
end;

procedure TfrmMain.imgTagborderClick(Sender: TObject);
begin

end;

//===================================================================
// Undo - click: undo most recent move
//      - mouse enter: highlight
//      - mouse leave: normal
//===================================================================

procedure TfrmMain.imgUndoClick(Sender: TObject);

var
  movetype               : smallint;

begin

    // If the log of moves got invalidated, then no undo possible.
    // That should happen only if a game went past the maximum number of
    // moves allowed in the log.

  if movelogok = False then begin
    exit;
  end;

    // If no moves in log of moves, then exit.
    // This is the case when the game first starts, or if they have
    // undo'ed back to the beginning.
    // Note that we do not provide for a redo in this game.

  if movecount = 0 then begin
    exit;
  end;

    // What kind of move are we undo'ing?

  movetype := move[movecount,1];
  case movetype of
    1 : undo_draw;
    2 : undo_redraw;
    3 : undo_discardtoscore;
    4 : undo_faceuptoscore;
    5 : undo_discardtofaceup;
    6 : undo_scoretofaceup;
    7 : undo_faceupshift;
    8 : undo_turnoverfacedown;
  end;

  movecount := movecount - 1;

end;

procedure TfrmMain.imgUndoMouseEnter(Sender: TObject);
begin
  imgUndo.Picture := frmMain.imgUndoHighlight.Picture;
end;

procedure TfrmMain.imgUndoMouseLeave(Sender: TObject);
begin
  imgUndo.Picture := frmMain.imgUndoNormal.Picture;
end;

//===================================================================
// Hint  - click: nothing
//       - mouse enter: highlight
//       - mouse leave: normal
//===================================================================

procedure TfrmMain.imgHintMouseEnter(Sender: TObject);
begin
  imgHint.Picture := frmMain.imgHintHighlight.Picture;
  selectmove;
  displayhint;
end;

procedure TfrmMain.imgHintMouseLeave(Sender: TObject);
begin
  imgHint.Picture := frmMain.imgHintNormal.Picture;
  removehint;
end;


//===================================================================
// Autoplay - click: change state
//          - mouse enter: show opposite state
//          - mouse leave: show current state
//===================================================================

procedure TfrmMain.imgAutoPlayClick(Sender: TObject);
begin
  case autoplay of
    True: begin
      autoplay := False;
      imgAutoPlay.Picture := imgAutoPlayHand.Picture;
    end;
    False: begin
      autoplay := True;
      imgAutoPlay.picture := imgAutoPlayCogs.Picture;
      doautoplaymove;
    end;
  end;
end;

procedure TfrmMain.imgAutoPlayMouseEnter(Sender: TObject);
begin
  case autoplay of
    True: begin
      imgAutoPlay.Picture := imgAutoPlayHand.Picture;
    end;
    False: begin
      imgAutoPlay.picture := imgAutoPlayCogs.Picture;
    end;
  end;
end;

procedure TfrmMain.imgAutoPlayMouseLeave(Sender: TObject);
begin
  case autoplay of
    True: begin
      imgAutoPlay.Picture := imgAutoPlayCogs.Picture;
    end;
    False: begin
      imgAutoPlay.picture := imgAutoPlayHand.Picture;
    end;
  end;
end;

//===================================================================
// Moved the speed slider.
// Reset animation delay.
//===================================================================

procedure TfrmMain.tbarSpeedChange(Sender: TObject);

begin

  if tbarSpeed.Position = tbarSpeed.Max then begin
    animateon := False;
  end
  else begin
    animateon := True;
    animatedelay := 5 * (tbarSpeed.max - tbarSpeed.position);
    autoplaydelay := animatedelay;
  end;

end;

//===================================================================
// Repaint - click: redo the card display in case of a glitch
//         - mouse enter: highlight, show hint
//         - mouse leave: normal, remove hint
//
// Note: not needed any more - see repaint procedure.
//===================================================================

procedure TfrmMain.imgRepaintClick(Sender: TObject);

begin
  repaint;
end;

procedure TfrmMain.imgRepaintMouseEnter(Sender: TObject);
begin
  imgRepaint.Picture := frmMain.imgRepaintHighlight.Picture;
end;

procedure TfrmMain.imgRepaintMouseLeave(Sender: TObject);
begin
  imgRepaint.Picture := frmMain.imgRepaintNormal.Picture;
end;

//===================================================================
// About - click: show about form
//       - mouse enter: highlight
//       - mouse leave: normal
//===================================================================

procedure TfrmMain.imgAboutClick(Sender: TObject);
begin
  frmAbout.ShowModal;
end;

procedure TfrmMain.imgAboutMouseEnter(Sender: TObject);
begin
  imgAbout.Picture := frmMain.imgAboutHighlight.Picture;
end;

procedure TfrmMain.imgAboutMouseLeave(Sender: TObject);
begin
  imgAbout.Picture := frmMain.imgAboutNormal.Picture;
end;

//===================================================================
// Quit - click: exit game
//      - mouse enter: highlight
//      - mouse leave: normal
//===================================================================

procedure TfrmMain.imgQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.imgQuitMouseEnter(Sender: TObject);
begin
  imgQuit.Picture := frmMain.imgQuitHighlight.Picture;
end;

procedure TfrmMain.imgQuitMouseLeave(Sender: TObject);
begin
  imgQuit.Picture := frmMain.imgQuitNormal.Picture;
end;


//###################################################################
// FORM EVENTS
//###################################################################


//===================================================================
// Clicked the empty draw pile.
// Run through it again (if there are any cards in the discard pile).
//===================================================================

procedure TfrmMain.shpDrawemptyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  remakedrawpile;
end;

//===================================================================
// Quick up all scoreable cards.
// Just turn the mousewheel to put up all cards to the score piles
// that won't unbalance them.
// If animate is on, then makes a nice display.
//===================================================================

procedure TfrmMain.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  postscoreablecards;
end;

//===================================================================
// Mouse down.
//
// It's either the start of a normal click, or a drag operation.
// We have to prepare for both eventualties. Later, we will
// distinguish which one it actually is. Note that the mouse events
// are sent to the program in this order:
//   mouse down
//   mouse move (if any)
//   click
//   mouse up
//===================================================================

procedure TfrmMain.mdown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

var
  i                      : smallint;
  j                      : smallint;
  n                      : smallint;
  pile                   : smallint;
  label carryon;

begin

    // Don't respond unless we are finished with the previous action.

  if actionphase <> 'over' then begin
    exit;
  end;

  previousoverlapfound := False;
  overlapfound := False;

    // Which card was it done on?

  if      Sender = Card01 then actioncard := ca
  else if Sender = Card02 then actioncard := c2
  else if Sender = Card03 then actioncard := c3
  else if Sender = Card04 then actioncard := c4
  else if Sender = Card05 then actioncard := c5
  else if Sender = Card06 then actioncard := c6
  else if Sender = Card07 then actioncard := c7
  else if Sender = Card08 then actioncard := c8
  else if Sender = Card09 then actioncard := c9
  else if Sender = Card10 then actioncard := c10
  else if Sender = Card11 then actioncard := cj
  else if Sender = Card12 then actioncard := cq
  else if Sender = Card13 then actioncard := ck
  else if Sender = Card14 then actioncard := da
  else if Sender = Card15 then actioncard := d2
  else if Sender = Card16 then actioncard := d3
  else if Sender = Card17 then actioncard := d4
  else if Sender = Card18 then actioncard := d5
  else if Sender = Card19 then actioncard := d6
  else if Sender = Card20 then actioncard := d7
  else if Sender = Card21 then actioncard := d8
  else if Sender = Card22 then actioncard := d9
  else if Sender = Card23 then actioncard := d10
  else if Sender = Card24 then actioncard := dj
  else if Sender = Card25 then actioncard := dq
  else if Sender = Card26 then actioncard := dk
  else if Sender = Card27 then actioncard := sa
  else if Sender = Card28 then actioncard := s2
  else if Sender = Card29 then actioncard := s3
  else if Sender = Card30 then actioncard := s4
  else if Sender = Card31 then actioncard := s5
  else if Sender = Card32 then actioncard := s6
  else if Sender = Card33 then actioncard := s7
  else if Sender = Card34 then actioncard := s8
  else if Sender = Card35 then actioncard := s9
  else if Sender = Card36 then actioncard := s10
  else if Sender = Card37 then actioncard := sj
  else if Sender = Card38 then actioncard := sq
  else if Sender = Card39 then actioncard := sk
  else if Sender = Card40 then actioncard := ha
  else if Sender = Card41 then actioncard := h2
  else if Sender = Card42 then actioncard := h3
  else if Sender = Card43 then actioncard := h4
  else if Sender = Card44 then actioncard := h5
  else if Sender = Card45 then actioncard := h6
  else if Sender = Card46 then actioncard := h7
  else if Sender = Card47 then actioncard := h8
  else if Sender = Card48 then actioncard := h9
  else if Sender = Card49 then actioncard := h10
  else if Sender = Card50 then actioncard := hj
  else if Sender = Card51 then actioncard := hq
  else if Sender = Card52 then actioncard := hk;

    // Now we know which card has the mouse down. Where was it?
    // We could maintain for each card its current position,
    // and therefore know immediately what to do (or not do).
    // But we don't want to go to that trouble. So we'll
    // just poll all the places where we respond to a clicked
    // card and see if it's one of those.

    // 1 - Is it the top card on the draw pile?
    //     If so, no drag is possible.
    //
    //     The '=' in the consecutive draw test handles the situation
    //     where there are no cards left in either stack. This allows
    //     us to go desperate, otherwise we never would when they are
    //     empty.

  if drawcount > 0 then begin
    if draw[drawcount] = actioncard then begin
      actionphase := 'start';
      actiontype := 'draw';
      consecutivedraws := consecutivedraws + 1;
      if consecutivedraws >= drawcount + discardcount then begin
        desperate := True;       {once we go desperate we stay desperate for the game}
      end;
      exit;
    end;
  end;

  consecutivedraws := 0;

    // 2 - Is it the top card of the discard pile?

  if discardcount > 0 then begin
    if discard[discardcount] = actioncard then begin
      actiontype := 'discard';
      goto carryon;
    end;
  end;

    // 3 - Is it the bottom card of a face-up pile?

  for pile := 1 to 7 do begin
    n := faceupcount[pile];
    if n > 0 then begin
      if faceup[pile,n] = actioncard then begin
        actiontype := 'bottom';
        actionpile := pile;
        goto carryon;
      end;
    end;
  end;

    // 4 - Is it an interior card of a faceup pile?
    // (We could combine this scan of the faceup piles with the previous one.
    // But we do it separately for clarity.)

  for pile := 1 to 7 do begin
    n := faceupcount[pile];
    for i := 1 to n-1 do begin     {n-1 because if the card is at n then we found it above}
      if faceup[pile,i] = actioncard then begin
        actiontype := 'interior';
        actionpile := pile;
        actionchaincount := n - i;
        for j := 1 to actionchaincount do begin
          actionchaincard[j] := faceup[pile,i+j];
        end;
        goto carryon;
      end;
    end;
  end;

    // Ignore any other clicked card.

  actionphase := 'over';
  exit;

    // Now see what to do with it.
    // First determine where it can go.

carryon:

  wherecanmove (actioncard, actiontype);

    // This card may be possibly dragged, or they may just want to click it and
    // this is the first part of the click. Prepare for either.
    //
    // Save the initial position of the card in case we have to return it here
    // when there is no place to drop it, or they choose not to.
    //
    // And record the card's offset to the mouse, so we can keep it at that
    // relative position when we drag it.

  draginitialcardtop  := pcard[actioncard].Top;
  draginitialcardleft := pcard[actioncard].Left;
  draginitialmousex   := mouse.cursorpos.x;
  draginitialmousey   := mouse.cursorpos.y;
  dragoffsetx         := mouse.cursorpos.x - pcard[actioncard].Left;
  dragoffsety         := mouse.cursorpos.y - pcard[actioncard].Top;

  actionphase := 'start';

end;

//===================================================================
// Mouse move.
//===================================================================

procedure TfrmMain.mmove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

var
  currentmousex          : smallint;
  currentmousey          : smallint;
  deltamousex            : smallint;
  deltamousey            : smallint;
  j                      : smallint;

begin

    // Ignore mouse moves unless we are possibly starting a drag,
    // or actually in one.

  if (actionphase <> 'start') and (actionphase <> 'drag') then begin
    exit;
  end;

    // We don't want the draw card to respond to mouse moves at all.

  if actiontype = 'draw' then begin
    exit;
  end;

    // If we haven't begun to drag, see if the first move is enough to start
    // us off. It might be just a slight wiggle when a click is being done.
    // If it is the start of a drag, bring the dragged card (or cards) to
    // the front of all cards so it doesn't slide under them when moved.

  if actionphase = 'start' then begin
    currentmousex := mouse.cursorpos.x;
    currentmousey := mouse.cursorpos.y;
    deltamousex   := draginitialmousex - currentmousex;
    deltamousey   := draginitialmousey - currentmousey;
    if (abs(deltamousex) > 15) or (abs(deltamousey) > 15) then begin
      actionphase := 'drag';
        // Bring to front the highlight and the card or cards.
        // (We need the highlight first so the others will move over top of it.)
      imgTouch.Bringtofront;
      pcard[actioncard].Bringtofront;
      if actiontype = 'interior' then begin
        for j := 1 to actionchaincount do begin
          pcard[actionchaincard[j]].Bringtofront;
        end;
      end;
        // Save positions of targets (if any).
        // For now, we will calculate during mouse move.
        // But would be more efficient to do it here.
{     dragtargetcount := 0
      for j := 1 to scorelandingcount do begin
        dragtargetcount := dragtargetcount + 1;
        dragtargetleft[dragtargetcount] := ;
        dragtargettop[dragtargetcount] := ;
      end;
      for j := 1 to scorelandingcount do begin
        dragtargetcount := dragtargetcount + 1;
        dragtargetleft[dragtargetcount] := ;
        dragtargettop[dragtargetcount] := ;
      end;
}
    end;
  end;

    // Only do a drag operation if we really are dragging.
    // If we are still in phase 'start', then don't do this.

  if actionphase <> 'drag' then begin
    exit
  end;

    // Move the card (and possible chain) to the same relative offset
    // of the mouse as when mouse down was pressed.

  pcard[actioncard].Left := mouse.cursorpos.x - dragoffsetx;
  pcard[actioncard].Top  := mouse.cursorpos.y - dragoffsety;
  if actiontype = 'interior' then begin
    for j := 1 to actionchaincount do begin
      pcard[actionchaincard[j]].Left := pcard[actioncard].Left;
      pcard[actionchaincard[j]].Top  := pcard[actioncard].Top + j * SPACEFACEUP;
    end;
  end;

    // Check to see if the action card is over any targets.

  overlaptarget;

  case overlapfound of

      // We are not over a target. If we were over one before, remove highlight.
    False: begin
      if previousoverlapfound = True then begin
        imgTouch.Visible := False;
        previousoverlapfound := False;
      end;
    end;

      // We are over a target. If it's same as before, nothing to do.
      // Otherwise, we weren't over any before, or it's different - highlight it.
    True: begin
      if     (previousoverlapfound = True)
         and (previousoverlaptype = overlaptype)
         and (previousoverlappile = overlappile) then begin
        j := 1;                 {do nothing}
      end
      else begin
        imgTouch.Top := overlaptop - 3;
        imgTouch.Left := overlapleft - 3;
        imgTouch.visible := True;
        {imgTouch.BringToFront;}
        previousoverlapfound := overlapfound;
        previousoverlaptype := overlaptype;
        previousoverlappile := overlappile;
      end;
    end;

  end; {case}

end;

//===================================================================
// Mouse up.
//===================================================================

procedure TfrmMain.mup(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

var
  j                      : smallint;

begin

    // Ignore if we are not in an action.

  if actionphase = 'over' then begin
    exit;
  end;

  imgTouch.Visible := False;

  case actionphase of

      // Not dragging. So respond to the end of the click.

    'start' : begin

      case actiontype of
        'draw' : begin
           drawacard;
        end;
        'discard' : begin
           analyzediscard;
        end;
        'bottom' : begin
           analyzebottom (actionpile);
        end;
        'interior' : begin
           analyzeinterior (actionpile, actioncard);
        end;
      end;   {case actiontype}

    end;     {start}

      // The mouse drag is over.

    'drag' : begin

      overlaptarget;

      case overlapfound of

          // Overlapping a target - drop the card or cards there.

        True: begin
          case actiontype of
            'discard' : begin
              case overlaptype of
                'score':  movediscardtoscore (overlappile);
                'faceup': movediscardtofaceup (overlappile);
              end;
            end;
            'bottom' : begin
              case overlaptype of
                'score':  movebottomtoscore (actionpile,overlappile);
                'faceup': movebottomtofaceup (actionpile,overlappile);
              end;
            end;
            'interior' : begin
               moveinteriortofaceup (actioncard,actionpile,overlappile);
            end;
          end; {case actiontype}
        end;   {True}

          // Not overlapping a target - return to initial positions;

        False: begin
          pcard[actioncard].Top  := draginitialcardtop;
          pcard[actioncard].Left := draginitialcardleft;
          if actiontype = 'interior' then begin
            for j := 1 to actionchaincount do begin
              pcard[actionchaincard[j]].Top  := pcard[actioncard].Top + j * SPACEFACEUP;
              pcard[actionchaincard[j]].Left := pcard[actioncard].Left;
            end;
          end;
        end;   {False}

      end;     {case overlapfound}
    end;       {drag}
  end;         {case actionphase}


    // This action is completed.

  actionphase := 'over';

end;


//===================================================================
// Respond to a click on a card.
//
// We do not use the click event at all. It was just causing extra
// problems when an inadvertent double-click is given. It caused
// delayed reaction on the wrong card. Much simpler to eliminate it
// altogether, and use mouse up to handle both "clicks" and end of
// drags.
//===================================================================

procedure TfrmMain.sclick(Sender: TObject);

begin

  exit;   // Now handled in mouse up.

end;


//###################################################################
// GAME PROCEDURES
//###################################################################


//===================================================================
// Start another game.
//
// - get a shuffled deck
// - lay out the piles
// - reset certain flags
//
// The "desperate" flag controls what moves are hinted. If we cycle
// through the deck without making any moves excepting drawing cards,
// then we conclude the user (or our automatic player) is stuck. We
// then hint moves that we wouldn't ordinarily recommend. Note that
// once we go desperate, we stay desperate for the rest of the game.
// Otherwise, we wouldn't other desperate moves until the user had
// cycled all the way around through the deck again. That would be
// too tedious.
//
// The "consecutivedraws" count is a way of keeping track of many
// times in a row the only play made was to draw a card. When it
// surpasses the number of cards in the draw pile and discard pile,
// then the "desperate" flag is set.
//===================================================================

procedure startgame;

begin

  gamedeck := shuffledeck ();
  layoutthegame;
  movecount := 0;
  movelogok := True;
  actionphase := 'over';
  desperate := False;
  consecutivedraws := 0;
  frmMain.shpDrawEmpty.Visible := True;  {in case we turned it off after a winning game}

end;

//===================================================================
// Draw a card from the draw pile.
// Turn it over, and place it on the discard pile.
//===================================================================

procedure drawacard;

var
  c                      : card;

begin

  // Disable the current top card on the discard pile, if any.

  if discardcount > 0 then begin
    c := discard[discardcount];
    pcard[c].Enabled := False;
  end;

    // Move the top card of the draw pile to the discard pile and
    // turn it over. Note that it's already enabled (otherwise we
    // wouldn't have been able to click it). But we enable it again
    // just to be safe.

  c := draw[drawcount];
  pcard[c].Top     := DISCARDTOP;
  pcard[c].Left    := DISCARDLEFT;
  pcard[c].Picture := cardimage[c].Picture;
  pcard[c].Enabled := True;
  pcard[c].Bringtofront;

  discardcount := discardcount + 1;
  discard[discardcount] := c;

    // Enable the new top card on the draw pile, if any.

  drawcount := drawcount - 1;
  if drawcount > 0 then begin
    c := draw[drawcount];
    pcard[c].Enabled := True;
  end;

    // Log it.

  movecount := movecount + 1;
  if movecount > movecountmax then begin
    movelogok := False;
  end
  else begin
    move[movecount,1] := 1; {draw a card}
    move[movecount,2] := 1; {number of cards drawn}
    move[movecount,3] := 0; {-}
    move[movecount,4] := 0; {-}
  end;
end;

//===================================================================
// Make the discard pile back into the draw pile.
//===================================================================

procedure remakedrawpile;

var
  c                      : card;
  i                      : smallint;
  n                      : smallint;

begin

    // Are there any cards in the discard pile?

  if discardcount = 0 then begin
    exit;
  end;

    // In effect, we turn the discard pile over to become the draw pile.

  n := 0;
  for i := discardcount downto 1 do begin
    c := discard[i];
    pcard[c].Top     := DRAWTOP;
    pcard[c].Left    := DRAWLEFT;
    pcard[c].Picture := backimage.Picture;
    pcard[c].Enabled := False;
    pcard[c].Bringtofront;
    n := n +1;
    draw[n] := c;
  end;

    // Change the counts and enable the top card on the draw pile.

  drawcount := discardcount;
  discardcount := 0;
  c := draw[drawcount];
  pcard[c].Enabled := True;

    // Log it.

  movecount := movecount + 1;
  if movecount > movecountmax then begin
    movelogok := False;
  end
  else begin
    move[movecount,1] := 2; {redraw}
    move[movecount,2] := 0; {-}
    move[movecount,3] := 0; {-}
    move[movecount,4] := 0; {-}
  end;

end;

//===================================================================
// The player has clicked the discard card and wants to move it.
// Or, in auto play, a card has been drawn, is now sitting on the
// discard pile, and we want to see what we can do with it.
//
// We could just move it to a score pile if possible. This is the
// standard move in solitaire. But we will expand on it to allow a
// click to mean move it to a faceup pile too, to save dragging it,
// or, again, to accommodate autoplay..
//
// What if it can be moved to a score pile and one or two faceup
// piles? Which do we choose?
//
// We could say: choose a faceup pile over a score pile. After all,
// they can always move it up from a faceup pile if they really
// intended for it to go to a score pile. (And it doesn't matter
// which faceup pile. i.e. we could put a 7C on 8D or 8H.)
//
// Instead, we adopt these rules. For autoplay:
//   - if it can go to a score pile without unbalancing them, then
//     do it
//   - if it can go to a faceup pile, do it
//   - if it can go to a score pile and that allows a card in the
//     faceup piles to be moved up and a facedown card turned over,
//     do it
//   - otherwise ignore
//
// For user play:
//   - if it can only go to a score pile (or piles), move it to first
//   - if it can only go to a faceup pile (or piles) move it to first
//   - if it can go to both, then preferentially move it to a score
//     pile, unless that would make them unbalanced; in that
//     case move to faceup pile
//   - if it can't go anywhere, ignore the click and do nothing
//
// For the meaning of "unbalanced", see the balance routine.
//===================================================================

procedure analyzediscard;

var
  c                      : card;
  pile                   : smallint;

begin

  c:= discard[discardcount];

    // Decide where to move it.

  case scorelandingcount of

    0 : begin

      case faceuplandingcount of
          // case 1: cannot go to a score pile or a faceup pile
        0 : begin
          pile := 0;  {just a do nothing statement}
        end;
          // case 2 - cannot go to a score pile, can go to a faceup pile
        else begin
          pile := faceuplanding[1];
          movediscardtofaceup (pile);
        end;
      end; {case}

    end;  {begin}

    else begin

      case faceuplandingcount of
          // case 3 - can go to a score pile cannot go to a faceup pile
        0 : begin
          pile := scorelanding[1];
          movediscardtoscore (pile);
        end;
          // case 4 - can go to both: move to score pile if balanced, else a faceup pile
        else begin
          if balanced(c) then begin
            pile := scorelanding[1];
            movediscardtoscore (pile);
          end
          else begin
            pile := faceuplanding[1];
            movediscardtofaceup (pile);
          end;
        end;
      end; {case}

     end;  {begin}

    end; {case}

end;

//===================================================================
// Try to add one of the bottom cards of a faceup pile to one of
// the score piles. Or maybe move it to another faceup pile.
//
// How do we stop from moving it back and forth from faceup pile to
// faceup pile when we really want to move it to a score pile?
//
// We adopt these rules:
//  - if we can only move it to a score pile, do so
//  - if we can only move it to another faceup pile or piles, do so
//  - if we can move it to either, move it to a score pile if the
//    piles would not be put out of balance. Otherwise, move it to
//    another faceup pile when the card is the top of its chain
//    (and therefore sitting on a facedown card which can be turned
//    over, or would make an empty spot for a possible king); if that
//    is not the case, move to score pile
//===================================================================

procedure analyzebottom (cardpile : smallint);

var
  c                      : card;
  topile                 : smallint;

begin

  c:= faceup[cardpile,faceupcount[cardpile]];

    // Decide where to move it.

  case scorelandingcount of

    0 : begin

      case faceuplandingcount of
          // case 1: cannot go to a score pile or a faceup pile
        0 : begin
          topile := 0;  {just a do nothing statement}
        end;
          // case 2 - cannot go to a score pile, can go to a faceup pile
        else begin
          topile := faceuplanding[1];
          movebottomtofaceup (cardpile, topile);
        end;
      end; {case}

    end;  {begin}

    else begin

      case faceuplandingcount of
          // case 3 - can go to a score pile cannot go to a faceup pile
        0 : begin
          topile := scorelanding[1];
          movebottomtoscore (cardpile, topile);
        end;
          // case 4 - can go to both: move to score pile if balanced,
          //          else a faceup pile if top, else score pile
        else begin
          if balanced(c) then begin
            topile := scorelanding[1];
            movebottomtoscore (cardpile, topile);
          end
          else begin
            if faceupcount[cardpile] = 1 then begin
              topile := faceuplanding[1];
              movebottomtofaceup (cardpile, topile);
              end
            else begin
              topile := scorelanding[1];
              movebottomtoscore (cardpile, topile);
            end;
          end;
        end;
      end; {case}

     end;  {begin}

    end; {case}

end;

//===================================================================
// Analyze what to do with an interior faceup card and its chain.
//
// The only thing we can do is move it to another pile (or piles).
//===================================================================

procedure analyzeinterior (cardpile : smallint; topcard : card);

var
  topile                 : smallint;

begin

{  wherecanmove (topcard, 'interior'); }

  if faceuplandingcount > 0 then begin
    topile := faceuplanding[1];
    moveinteriortofaceup (topcard, cardpile, topile);
  end;

end;

//===================================================================
// Move the discard card to this score pile.
//===================================================================

procedure movediscardtoscore (scorepile : smallint);

var
  c                      : card;
  endtop                 : smallint;
  endleft                : smallint;

begin

  c := discard[discardcount];

    // Move the card image to the score pile and record in array.

  endtop  := SCORE1TOP;
  endleft := SCORE1LEFT + (scorepile-1)*(PILESPACING + CARDWIDTH);

  if animateon then begin
    animate (c, endtop, endleft, 0);
  end
  else begin
    pcard[c].Top  := endtop;
    pcard[c].Left := endleft;
  end;

  pcard[c].Bringtofront;
  pcard[c].Enabled := False;

  scorecount[scorepile] := scorecount[scorepile] + 1;
  score[scorepile,scorecount[scorepile]] := c;

    // The next discard card is now the top of the pile.

  discardcount := discardcount - 1;
  if discardcount > 0 then begin
    c := discard[discardcount];
    pcard[c].Enabled := True;
  end;

    // Log it.

  movecount := movecount + 1;
  if movecount > movecountmax then begin
    movelogok := False;
  end
  else begin
    move[movecount,1] := 3;          {move discard to scorepile}
    move[movecount,2] := 0;          {-}
    move[movecount,3] := scorepile;  {to this scorepile}
    move[movecount,4] := 0;          {-}
  end;

  reward;

end;

//===================================================================
// Move the discard card to this faceup pile.
//===================================================================

procedure movediscardtofaceup (topile : smallint);

var
  c                      : card;
  endtop                 : smallint;
  endleft                : smallint;

begin

  c := discard[discardcount];

    // Move the card image to the faceup pile and record in array.
    // (Remember that the first faceup card is spaced the same distance as a
    // facedown card, if there is at least one above it. That accounts for the
    // formula.)

  endtop  := PILE1TOP + facedowncount[topile]*SPACEFACEDOWN + (faceupcount[topile])*SPACEFACEUP;
  endleft := PILE1LEFT + (topile-1)*(PILESPACING + CARDWIDTH);

  if animateon then begin
    animate (c, endtop, endleft, 0);
  end
  else begin
    pcard[c].Top  := endtop;
    pcard[c].Left := endleft;
  end;

  pcard[c].Bringtofront;
  pcard[c].Enabled := True; {was already enabled, but just to be sure}

  faceupcount[topile] := faceupcount[topile] + 1;
  faceup[topile,faceupcount[topile]] := c;

    // The next discard is now the top of the pile.

  discardcount := discardcount - 1;
  if discardcount > 0 then begin
    c := discard[discardcount];
    pcard[c].Enabled := True;
  end;

    // Log it.

  movecount := movecount + 1;
  if movecount > movecountmax then begin
    movelogok := False;
  end
  else begin
    move[movecount,1] := 5;          {move discard to faceup pile}
    move[movecount,2] := 0;          {-}
    move[movecount,3] := topile;     {to this faceup pile}
    move[movecount,4] := 0;          {-}
  end;

end;

//===================================================================
// Move the bottom of a faceup to score pile.
//===================================================================

procedure movebottomtoscore (frompile : smallint; scorepile : smallint);

var
  c                      : card;
  endtop                 : smallint;
  endleft                : smallint;

begin

  c := faceup[frompile, faceupcount[frompile]];

    // Add card to score pile.

  endtop  := SCORE1TOP;
  endleft := SCORE1LEFT + (scorepile-1)*(PILESPACING + CARDWIDTH);

  if animateon then begin
    animate (c, endtop, endleft, 0);
  end
  else begin
    pcard[c].Top  := endtop;
    pcard[c].Left := endleft;
  end;

  pcard[c].Bringtofront;
  pcard[c].Enabled := False;

  scorecount[scorepile] := scorecount[scorepile] + 1;
  score[scorepile,scorecount[scorepile]] := c;

    // Remove from faceup pile.

  faceupcount[frompile] := faceupcount[frompile] - 1;

    // Log it - before we possibly turn over a card.

  movecount := movecount + 1;
  if movecount > movecountmax then begin
    movelogok := False;
  end
  else begin
    move[movecount,1] := 4;          {move faceup to score pile}
    move[movecount,2] := frompile;   {from this faceup pile}
    move[movecount,3] := scorepile;  {to this score pile}
    move[movecount,4] := 0;          {-}
  end;

    // If no more cards in the faceup pile, then turn over face down card
    // if there is one.

  if faceupcount[frompile] = 0 then begin
    if facedowncount[frompile] > 0 then begin
      turnoverfacedown (frompile);
    end;
  end;

  reward;

end;

//===================================================================
// Move the bottom of a faceup to another faceup pile.
//===================================================================

procedure movebottomtofaceup (frompile : smallint; topile : smallint);

var
  c                      : card;
  endtop                 : smallint;
  endleft                : smallint;

begin

  c := faceup[frompile, faceupcount[frompile]];

    // Move card image and add to array.

  endtop  := PILE1TOP + facedowncount[topile]*SPACEFACEDOWN + (faceupcount[topile])*SPACEFACEUP;
  endleft := PILE1LEFT + (topile-1)*(PILESPACING + CARDWIDTH);

  if animateon then begin
    animate (c, endtop, endleft, 0);
  end
  else begin
    pcard[c].Top  := endtop;
    pcard[c].Left := endleft;
  end;

  pcard[c].Bringtofront;
  pcard[c].Enabled := True;

  faceupcount[topile] := faceupcount[topile] + 1;
  faceup[topile,faceupcount[topile]] := c;

    // Remove from this faceup pile.

  faceupcount[frompile] := faceupcount[frompile] - 1;

    // Log it - before we possibly turn over a facedown card.

  movecount := movecount + 1;
  if movecount > movecountmax then begin
    movelogok := False;
  end
  else begin
    move[movecount,1] := 7;          {move faceup to faceup pile}
    move[movecount,2] := frompile;   {from this faceup pile}
    move[movecount,3] := topile;     {to this faceup pile}
    move[movecount,4] := 1;          {move just one card - the bottom}
  end;

    // If no more cards in the faceup pile, then turn over face down card
    // if there is one.

  if faceupcount[frompile] = 0 then begin
    if facedowncount[frompile] > 0 then begin
      turnoverfacedown (frompile);
    end;
  end;

end;

//===================================================================
// Move the chain to another faceup pile.
//===================================================================

procedure moveinteriortofaceup (chaintopcard : card; frompile : smallint; topile : smallint);

var
  c                      : card;
  chaincount             : smallint;
  endtop                 : smallint;
  endleft                : smallint;
  fromcardposition       : smallint;
  i                      : smallint;
  n                      : smallint;

begin

    // Find where the chain starts in the faceup pile.

  fromcardposition := 0;
  for i := 1 to faceupcount[frompile] do begin
    if chaintopcard = faceup[frompile, i] then begin
      fromcardposition := i;
      break;
    end;
  end;
  if fromcardposition = 0 then begin
    exit;
  end;

  chaincount := faceupcount[frompile] - (fromcardposition-1);

    // Move the chain.

  endtop  := PILE1TOP + facedowncount[topile]*SPACEFACEDOWN + (faceupcount[topile])*SPACEFACEUP;
  endleft := PILE1LEFT + (topile-1)*(PILESPACING + CARDWIDTH);

  if animateon then begin
    animate (faceup[frompile,fromcardposition], endtop, endleft, frompile);
  end
  else begin
    n := 0;
    for i := fromcardposition to faceupcount[frompile] do begin
      c := faceup[frompile, i];
      pcard[c].Top  := endtop + n*SPACEFACEUP;
      pcard[c].Left := endleft;
      n := n + 1;
    end;
  end;

    // Add to receiving pile.

  for i := fromcardposition to faceupcount[frompile] do begin
    c := faceup[frompile, i];
    faceupcount[topile] := faceupcount[topile] + 1;
    faceup[topile,faceupcount[topile]] := c;
    pcard[c].Bringtofront;
    pcard[c].Enabled := True;
  end;

    // Remove from source pile.

  faceupcount[frompile] := fromcardposition - 1;


    // Log it - before we possibly turn over a facedown card.

  movecount := movecount + 1;
  if movecount > movecountmax then begin
    movelogok := False;
  end
  else begin
    move[movecount,1] := 7;          {move faceup to faceup pile}
    move[movecount,2] := frompile;   {from this faceup pile}
    move[movecount,3] := topile;     {to this faceup pile}
    move[movecount,4] := chaincount; {move this number of cards}
  end;

    // Turn up facedown if required

  if faceupcount[frompile] = 0 then begin
    if facedowncount[frompile] > 0 then begin
      turnoverfacedown (frompile);
    end;
  end;

end;

//===================================================================
// Turn over the top facedown card.
//===================================================================

procedure turnoverfacedown (pile : smallint);

var
  c                      : card;

begin

    // Check again that it's OK to do this.

  if faceupcount[pile] <> 0 then begin
    exit;
  end;

  if facedowncount[pile] = 0 then begin
    exit;
  end;

    // It's OK.

  c := facedown[pile, facedowncount[pile]];

    // Remove from facedown stack.

  facedowncount[pile] := facedowncount[pile] - 1;

    // Add to faceup stack. It stays in the same position.

  faceupcount[pile] := faceupcount[pile] + 1;
  faceup[pile,faceupcount[pile]] := c;
  pcard[c].Picture := cardimage[c].Picture;
  pcard[c].Enabled := True;
  pcard[c].Bringtofront;

    // Log it.

  movecount := movecount + 1;
  if movecount > movecountmax then begin
    movelogok := False;
  end
  else begin
    move[movecount,1] := 8;          {turnover a facedown card}
    move[movecount,2] := pile;       {this pile}
    move[movecount,3] := 0;          {-}
    move[movecount,4] := 0;          {-}
  end;

end;


//###################################################################
// GAME HELP
//###################################################################

//===================================================================
// Where is it eligible to move this card?
//
// The card being moved might be the top of the discard pile. Or it
// might be one of the faceup cards (with possible a chain of cards
// in tow).
//
// Note that the discard and the *bottom* faceup card are
// eligible to move to a score pile, or to a faceup pile. But an
// interior faceup card (and its trailers in tow) may only be moved to
// another faceup pile - not a score pile.
//
// The card may be eligible to go to more than one place. For example
// it could go to a specific score pile (or one of several empty
// score piles if it is an ace). Or two existing faceup piles (or one
// of several empty spots for a king). We will fill two arrays -
// scorelanding and faceuplanding.
//
// The routine is needed for both clicks and drags.
//===================================================================

procedure wherecanmove (cmove : card; cardposition : shortstring);

var
  cbottom                : card;
  cbottomcolour          : colour;
  cbottomrank            : smallint;

  ccolour                : colour;
  crank                  : smallint;
  csuit                  : suit;

  cscore                 : card;
  cscorerank             : smallint;
  cscoresuit             : suit;

  frombottom             : boolean;
  fromdiscard            : boolean;
  frominterior           : boolean;

  frompile               : smallint;

  i                      : smallint;
  n                      : smallint;
  p                      : smallint;

begin

    // Find out where the card to be moved is located now.

  fromdiscard  := False;
  frombottom   := False;
  frominterior := False;
  frompile     := 0;

  case cardposition of
    'discard' : begin
      fromdiscard := true;
    end;  {discard}

    'bottom' : begin
      frombottom := true;
      for p := 1 to 7 do begin
        n := faceupcount[p];
        if n > 0 then begin
          if cmove = faceup[p,n] then begin
            frompile := p;
          end;
        end;
      end;
    end;  {bottom}

    'interior' : begin
      frominterior := true;
      for p := 1 to 7 do begin
        n := faceupcount[p];
        if n > 0 then begin
          for i := 1 to n do begin
            if cmove = faceup[p,i] then begin
              frompile := p;
            end;
          end;
        end;
      end;
    end;  {interior}

    else begin
      showmessage ('Unrecognized card position');
      halt;
    end;

  end; {case}

    // We should always find it, but if not ...

  if (fromdiscard = False) and (frombottom = False) and (frominterior = false) then begin
    showmessage ('Could not find card');
    halt;
  end;

  crank   := cardrank[cmove];
  csuit   := cardsuit[cmove];
  ccolour := cardcolour[cmove];

    // First - can we move it to one or more faceup piles?
    // (This goes for a discard card, a bottom faceup pile card,
    // and a chain of faceup pile cards.)

  faceuplandingcount := 0;

  for p:= 1 to 7 do begin

      // Skip case where it's a faceup card and it's its own pile.
      // We don't want to include moving to itself as a possible move.
      // (We could skip the fromdiscard test because frompile is 0 in
      // that case and that would be sufficient, but we will be explicit.)

    if fromdiscard = False then begin
      if p = frompile then begin
        continue;
      end;
    end;

    case crank of

        // If it's a king (by itself or with a chain) we can only move it
        // to an empty pile.

      13 : begin
        if faceupcount[p] = 0 then begin
          faceuplandingcount := faceuplandingcount + 1;
          faceuplanding[faceuplandingcount] := p;
        end;
      end;

        // Not a king. Can only go to a faceup pile that is non-zero,
        // and the bottom card is of opposite colour and one higher rank.

      else begin
        if faceupcount[p] > 0 then begin
          cbottom := faceup[p,faceupcount[p]];
          cbottomrank := cardrank[cbottom];
          cbottomcolour := cardcolour[cbottom];
          if (crank + 1 = cbottomrank) and (ccolour <> cbottomcolour) then begin
            faceuplandingcount := faceuplandingcount + 1;
            faceuplanding[faceuplandingcount] := p;
          end;
        end;
      end;

    end; {case}
  end;     {for}

    // Second - can we move it to one or more score piles?
    //
    // If it is a chain of cards, skip this. We can only move a single card
    // to a score pile, i.e. a discard card or a bottom card.

  scorelandingcount := 0;

  if (frompile > 0) and (frombottom = false) then begin
    exit;
  end;

  for p := 1 to 4 do begin

    case crank of

        // An ace can go to any empty score pile.
      1 : begin
        if scorecount[p] = 0 then begin
          scorelandingcount := scorelandingcount + 1;
          scorelanding[scorelandingcount] := p;
        end;
      end

      else begin
        if scorecount[p] > 0 then begin
          cscore := score[p, scorecount[p]];
          cscoresuit := cardsuit[cscore];
          cscorerank := cardrank[cscore];
          if (csuit = cscoresuit) and (crank = cscorerank + 1) then begin
            scorelandingcount := scorelandingcount + 1;
            scorelanding[scorelandingcount] := p;
          end;
        end;
      end;

     end; {case}
  end;    {for}

end;

//===================================================================
// Check to see if adding a card to a score pile would make the score
// piles unbalanced. Unbalanced means that one of the piles would be
// getting too far ahead of one or more of the others. That is bad
// because we might need that card to be on one of the faceup piles
// to hold the next lower ranked card, which could not itself go to
// a score pile, and so would have nowhere to go.
//
// For example, suppose the score piles currently show as their top
// cards: 4H 5D 5S 6C
// And the card we are contemplating adding is 7C. We could do that,
// but what if we soon draw the 6H? It cannot go to the score pile,
// and we have no possibility of placing it on the 7C in a faceup
// pile. Or maybe the 6H is sitting as the top card in a faceup pile
// and we need to move it to get at the facedown cards underneath. So
// we hold off placing the 7C on the score pile for now.
//
// Of course, there are always situations where it would still be
// advantageous to play the 7C to the score pile, eg if that allows
// us to put up an 8C that is on top of a facedown pile. This routine
// doesn't prevent us from doing that. It just provides the
// information that scoring the 7C would make the piles unbalanced.
//
// And it could be that the score piles are already unbalanced due to
// cards too high in another, non-target pile. But this routine still
// applies assuming we don't want to make it doubly unbalanced.
//===================================================================

function balanced (targetcard : card) : boolean;

var
  c                      : card;
  ccolour                : colour;
  crank                  : smallint;
  csuit                  : suit;
  n                      : smallint;
  oppositecolourcount    : smallint;
  oppositecolourlowestrank : smallint;
  overalllowestrank      : smallint;
  p                      : smallint;
  samecolourcount        : smallint;
  samecolourlowestrank   : smallint;
  targetcolour           : colour;
  targetpile             : smallint;
  targetrank             : smallint;
  targetsuit             : suit;

begin

  targetrank   := cardrank [targetcard];
  targetsuit   := cardsuit [targetcard];
  targetcolour := cardcolour [targetcard];

    // If the card is an ace, then that is always valid to add, and
    // can never put the score piles out of balance.
    //
    // (Note that we defer the case of 2's till later. Although a 2
    // can never put the piles out of balance, we don't know if it
    // is *valid* to add a 2 yet.)

  if targetrank = 1 then begin
    result := True;
    exit;
  end;

    // Verify that it is legitimate to add this card to a score pile.
    // This has already been determined before calling this routine, but
    // we'll check it here just to be safe.
    // If we don't find any pile with our target suit, then we will
    // exit with not balanced.
    // If we find a pile with our suit, but our target card is not next
    // to be added, then we also exit with not balanced.
    // Otherwise, we just remember which pile we are going to add to and
    // continue.

  targetpile := 0;
  for p := 1 to 4 do begin
    if scorecount[p] > 0 then begin
      c := score[p,scorecount[p]];
      crank := cardrank [c];
      csuit := cardsuit [c];
      if csuit = targetsuit then begin
        if crank + 1 = targetrank then begin
          targetpile := p;
          break;
        end
        else begin
          result := False;
          exit;
        end;
      end;
    end;
  end;

  if targetpile = 0 then begin
    result := False;
    exit;
  end;

    // Now that we know it's OK to add, we can say all 2's would never
    // make the score piles unbalanced. (We don't include the 2 in the
    // case with the ace above because maybe the score pile with the
    // right ace didn't exist. Now we know it must because the rank
    // test just passed.)

  if targetrank = 2 then begin
    result := True;
    exit;
  end;

    // Now we do the actual balance test.
    // Find the lowest rank of the score piles of colour opposite to
    // our card and same colour as our card.

  oppositecolourlowestrank := 99;
  oppositecolourcount      := 0;
  samecolourlowestrank     := 99;
  samecolourcount          := 0;

  for p := 1 to 4 do begin
    n := scorecount[p];
    if n <> 0 then begin
      c := score [p,n];
      ccolour := cardcolour[c];
      crank   := cardrank[c];
      csuit   := cardsuit[c];

      case ccolour = targetcolour of

        true : begin
          if csuit <> targetsuit then begin
            samecolourlowestrank := crank;
            samecolourcount := 1;
          end;
        end;

        false : begin
          oppositecolourcount := oppositecolourcount + 1;
          if crank < oppositecolourlowestrank then begin
            oppositecolourlowestrank := crank;
          end;
        end;

      end; {case}
    end;   {if n <> 0}
  end;     {for p}

    // If we didn't find two piles of the opposite colour, then the lowest
    // rank must be 0.

  if oppositecolourcount <> 2 then begin
    oppositecolourlowestrank := 0;
  end;

    // If we didn't find one of the same colour but opposite suit, then its
    // rank is 0.

  if samecolourcount <> 1 then begin
    samecolourlowestrank := 0;
  end;

    // Get overall lowest rank.

  overalllowestrank := samecolourlowestrank;
  if oppositecolourlowestrank < overalllowestrank then begin
    overalllowestrank := oppositecolourlowestrank;
  end;

    // If the rank differs by less than 3, it would be balanced.

  if (targetrank - overalllowestrank) < 3 then begin
    result := true;
    exit;
  end;

    // It differs by 3 or more.

    // If it differs by 1 or less with the opposite colour suits,
    // then it is still balanced. (Or at least, putting the target card up
    // cannot make it worse.)

  if (targetrank - oppositecolourlowestrank) < 2 then begin
    result := true;
    exit;
  end;

    // If it differs by 3 or more from the opposite colour suits, then
    // it is definitely unbalanced.

  if (targetrank - oppositecolourlowestrank) > 2 then begin
    result := false;
    exit;
  end;

    // It differs by exactly 2 from opposite suits.
    // It will be balanced if it differs from same colour suit by 3 or less,
    // unbalanced if more than 3.

  if (targetrank - samecolourlowestrank) < 4 then begin
    result := true;
    exit;
  end
  else begin
    result := false;
    exit;
  end;

end;

//===================================================================
// Determine if the action card has been dragged over one of the
// targets.
//
// Note that it might overlap more than one target. We will select
// the one it is overlapping the most.
//===================================================================

procedure overlaptarget;

var
  actionleft             : smallint;
  actionright            : smallint;
  actiontop              : smallint;
  actionbottom           : smallint;

  area                   : longint;

  boundtop               : smallint;
  boundbottom            : smallint;
  boundleft              : smallint;
  boundright             : smallint;

  i                      : smallint;

  maxfaceuparea          : longint;
  maxfaceupleft          : smallint;
  maxfaceuppile          : smallint;
  maxfaceuptop           : smallint;

  maxscorearea           : longint;
  maxscoreleft           : smallint;
  maxscorepile           : smallint;
  maxscoretop            : smallint;

  pile                   : smallint;

  targetleft             : smallint;
  targetright            : smallint;
  targettop              : smallint;
  targetbottom           : smallint;

begin

    // Assume we will find no overlap (the usual case).

  overlapfound := false;

    // If there are no targets, then exit right away.

  if (scorelandingcount = 0) and (faceuplandingcount = 0) then begin
    exit;
  end;

  area := 0;

  actionleft   := pcard[actioncard].Left;
  actionright  := actionleft + CARDWIDTH;
  actiontop    := pcard[actioncard].Top;
  actionbottom := actiontop + CARDHEIGHT;

    // First look at the score landings, if any.

  maxscorearea := 0;

  for i := 1 to scorelandingcount do begin

    pile := scorelanding[i];
    targetleft   := SCORE1LEFT + (pile - 1)*(PILESPACING + CARDWIDTH);
    targetright  := targetleft + CARDWIDTH;
    targettop    := SCORE1TOP;
    targetbottom := targettop + CARDHEIGHT;

      // Is the action card totally to the left/right/top/bottom of the target?
      // If so, it does not overlap this target at all.

    if    (actionright  < targetleft)
       or (actionleft   > targetright)
       or (actionbottom < targettop)
       or (actiontop    > targetbottom) then begin
      continue;
    end;

      // Calculate the bounds of the overlap.
      // Assume the bounds of the card being dragged defines the overlap,
      // and adjust as required.

    boundtop    := actiontop;
    boundbottom := actionbottom;
    boundleft   := actionleft;
    boundright  := actionright;

    if actiontop    < targettop    then boundtop    := targettop;
    if actionbottom > targetbottom then boundbottom := targetbottom;
    if actionleft   < targetleft   then boundleft   := targetleft;
    if actionright  > targetright  then boundright  := targetright;

      // Now calculate the area of the overlap.
      // Don't need the abs's since bottoms are bigger numbers than tops,
      // and rights are bigger than lefts, but put them just to be sure.

    area := abs((boundbottom - boundtop)) * abs((boundright - boundleft));
    if area > maxscorearea then begin
      maxscorearea := area;
      maxscorepile := pile;
      maxscoreleft := targetleft;
      maxscoretop  := targettop;
    end;

  end; {for score piles}

    // Now look at the faceup landings, if any.
    // Note the -1 in targettop calculation - because we want to find its top,
    // not where the next faceup card would go.

  maxfaceuparea := 0;

  for i := 1 to faceuplandingcount do begin
    pile := faceuplanding[i];
    targetleft   := PILE1LEFT + (pile - 1)*(PILESPACING + CARDWIDTH);
    targetright  := targetleft + CARDWIDTH;
    if facedowncount[pile] + faceupcount[pile] = 0 then begin
      targettop  := PILE1TOP;
    end
    else begin
      targettop  := PILE1TOP + facedowncount[pile]*SPACEFACEDOWN + (faceupcount[pile]-1)*SPACEFACEUP;
    end;
    targetbottom := targettop + CARDHEIGHT;

      // Is the action card totally to the left/right/top/bottom of the target?
      // If so, it does not overlap this target at all.

    if    (actionright  < targetleft)
       or (actionleft   > targetright)
       or (actionbottom < targettop)
       or (actiontop    > targetbottom) then begin
      continue;
    end;

      // Calculate the bounds of the overlap.

    boundtop    := actiontop;
    boundbottom := actionbottom;
    boundleft   := actionleft;
    boundright  := actionright;

    if actiontop    < targettop    then boundtop    := targettop;
    if actionbottom > targetbottom then boundbottom := targetbottom;
    if actionleft   < targetleft   then boundleft   := targetleft;
    if actionright  > targetright  then boundright  := targetright;

      // Now calculate the area of the overlap.
      // Don't need the abs's, but put them just to be sure.

    area := abs((boundbottom - boundtop)) * abs((boundright - boundleft));
    if area > maxfaceuparea then begin
      maxfaceuparea := area;
      maxfaceuppile := pile;
      maxfaceupleft := targetleft;
      maxfaceuptop  := targettop;
    end;

  end; {for faceup piles}

    // If there were no overlaps, then exit.

  if (maxscorearea = 0) and (maxfaceuparea = 0) then begin
    exit;
  end;

    // There were one or more overlaps. What is the biggest area of overlap?
    // We probably didn't find both a score pile overlap and a faceup pile
    // overlap at the same time. One of these figures is probably zero.
    // But they could both be non-zero. Either way, the check is valid.

  overlapfound := true;

  if maxscorearea > maxfaceuparea then begin
    overlaptype := 'score';
    overlappile := maxscorepile;
    overlapleft := maxscoreleft;
    overlaptop  := maxscoretop;
  end
  else begin
    overlaptype := 'faceup';
    overlappile := maxfaceuppile;
    overlapleft := maxfaceupleft;
    overlaptop  := maxfaceuptop;
  end;

end;

//===================================================================
// Select the best move - for hints, and for automatic play.
//
// Search in this order:
//   1 - can we put up (without unbalancing) the discard
//   2 - can we put up (without unbalancing) any bottom faceup card
//   3 - can we move any top faceup card to another pile so that we
//       uncover a facedown card - search the biggest facedown piles
//       first so that if for example we have two black 8's we could
//       put on a bottom red 9, we move the black 8 that is covering
//       the most facedown cards
//   4 - move the discard to a faceup pile
//   5 - move a lone faceup card to allow a king to go to an empty spot
//   6 - if faceup has no facedown cards, and can move to 2 spots,
//       then move to either one (eg 6h to 7s or 7c)
//   7 - if desperate: move a faceup card to a score pile,
//       even if unbalanced
//   8 - if desperate: move the discard or faceup card to a
//       score pile, even if unbalanced
//   9 - if desperate: move a card (or chain) to allow the card above it to go to
//       score pile
//   10- draw a card
//   11- turn over discard pile
//   12- no move possible
//
// Note that when this routine is called by automatic play, we want
// to start with the first step every time. That way, for example, we
// put up all the cards we can before descending to the next search
// level, etc.
//
// Note too that some of these moves should not be hinted or done in
// automatic play unless we are running through the draw pile in a
// little bit of desperation. (No moves previous run-through?)
//===================================================================

procedure selectmove;

var
  biggestcount           : smallint;
  biggestpile            : smallint;
  c                      : card;
  cmove                  : card;
  cnext                  : card;
  i                      : smallint;
  kingavailable          : boolean;
  n                      : smallint;
  pile                   : smallint;
  pilestocheck           : set of byte;
  scorepile              : smallint;


begin

    // 1 - Can we put the discard in score pile without unbalancing it?

  if discardcount > 0 then begin
    c := discard[discardcount];
    wherecanmove (c, 'discard');
    if scorelandingcount > 0 then begin
      if balanced (c) = True then begin
        selectmoveaction := 'movediscardtoscore';
        selectmovecard := c;
        selectmovescorepile := scorelanding[1];
        exit;
      end;
    end;
  end;

    // 2 - Can we put a bottom card in score pile without unbalancing it?

  for pile := 1 to 7 do begin
    if faceupcount[pile] > 0 then begin
      c := faceup[pile,faceupcount[pile]];
      wherecanmove (c, 'bottom');
      if scorelandingcount > 0 then begin
        if balanced (c) = True then begin
          selectmoveaction := 'movebottomtoscore';
          selectmovecard := c;
          selectmovefrompile := pile;
          selectmovescorepile := scorelanding[1];
          exit;
        end;
      end;
    end;
  end;

    // 3 - Can we move a faceup card so that a facedown card is uncovered?
    //     If we can, we want to do it on the largest facedown pile.
    //
    //     Note that we are only considering moves between faceup piles here.
    //     We could include moves to a score pile. But we already know that
    //     this would be an unbalanced move (otherwise would have satisfied
    //     previous case). It can still happen, but as part of "desperate"
    //     case below.
    //
    //     Note that we do not include the case where there are no facedown
    //     cards underneath the faceup card (or cards) we might move. Yes,
    //     moving it would create an empty spot that could be used for a king.
    //     But we will move it only if there is a king to be placed there.
    //     (See separate check below.) This is because moving it might cover
    //     up a spot we might need in future for the other card of the same
    //     colour and rank. eg we would not move 7D onto 8C because maybe
    //     later we will have a 7H that needs that spot.

  pilestocheck := [1,2,3,4,5,6,7];

  while pilestocheck <> [] do begin
    biggestpile := 0;
    biggestcount := 0;

    for pile in pilestocheck do begin
      if facedowncount[pile] > biggestcount then begin
        biggestpile := pile;
        biggestcount := facedowncount[pile];
      end;
    end;

    if biggestcount = 0 then begin                  {we didn't find any facedown}
      break;                                        {cards in remaining piles}
    end;

    case faceupcount[biggestpile] of

      0 : begin                                     {this should never happen}
        break;                                      {means have bare facedown pile}
      end;

      1 : begin                                     {just one card in the pile}
        c := faceup[biggestpile,1];
        wherecanmove (c, 'bottom');
        if faceuplandingcount <> 0 then begin       {prefer to not put up if can}
          selectmoveaction := 'movebottomtofaceup'; {because we already know that}
          selectmovecard := c;                       {would unbalance since did}
          selectmovefrompile := biggestpile;        {not satisfy above}
          selectmovetopile := faceuplanding[1];
          exit;
        end;

 {        // We used to move to score as a second possibility.
          // But prefer not to. We already know it would be an unbalanced
          // move (otherwise would have satisfied case 2 above). It will
          // still happen, but as part of a "desperate" move in case below.

        if scorelandingcount <> 0 then begin
          selectmoveaction := 'movebottomtoscore';
          selectmovecard := c;
          selectmovefrompile := biggestpile;
          selectmovescorepile := scorelanding[1];
          exit;
        end;
}
      end;

      else begin                                 {more than 1 card in the pile}
        c := faceup[biggestpile,1];              {but we still want to move the}
        wherecanmove (c, 'interior');            {top so we uncover the facedown}
        if faceuplandingcount <> 0 then begin
          selectmoveaction := 'moveinteriortofaceup';
          selectmovecard := c;
          selectmovefrompile := biggestpile;
          selectmovetopile := faceuplanding[1];
          exit;
        end;
      end;

    end; {case}

      // We could not move that pile's faceup card anywhere.
      // Remove that pile and try the one with the next most facedown cards.

    pilestocheck := pilestocheck - [biggestpile];

  end; {while}

    // 4 - Move the discard to a faceup pile.

  if discardcount > 0 then begin
    c := discard[discardcount];
    wherecanmove (c, 'discard');
    if faceuplandingcount > 0 then begin
      selectmoveaction := 'movediscardtofaceup';
      selectmovecard := c;
      selectmovetopile := faceuplanding[1];
      exit;
    end;
  end;

    // 5 - Move a card to create an empty spot for a king.

    // First, do we have a king on top of the discard pile or on top of
    // some face-down cards? If we have both, we preferentially would move
    // the king on top of facedown cards since the discard king will come
    // around again. We could take it further and look for the presence of
    // a queen of opposite colour, and prefer the king that allows that to be
    // moved. But we won't go that far.

  kingavailable := False;
  for pile := 1 to 7 do begin
    if facedowncount[pile] > 0 then begin
      if faceupcount[pile] > 0 then begin     {it must be, else bare facedown pile}
        if cardrank[faceup[pile,1]] = 13 then begin
          kingavailable := True;
          break;
        end;
      end;
    end;
  end; {for}

  if kingavailable = False then begin
    if discardcount > 0 then begin
      if cardrank[discard[discardcount]] = 13 then begin
        kingavailable := True;
      end;
    end;
  end;

    // We found a king we can move. Can we create an empty spot?
    // (We know there are no empty spots now - because if there were, we
    // would have been able to satisfy the king move in the above checks.)

  if kingavailable = True then begin
    for pile := 1 to 7 do begin
      if (facedowncount[pile] = 0) and (faceupcount[pile] <> 0) then begin
        c := faceup[pile,1];
        if cardrank[c] <> 13 then begin                  {is it already a king?}
          if faceupcount[pile] = 1 then begin
            wherecanmove (c, 'bottom');
          end
          else begin
            wherecanmove (c, 'interior');
          end;
          if faceuplandingcount <> 0 then begin
            selectmoveaction := 'moveinteriortofaceup';   {will work whether 1 or more}
            selectmovecard := c;
            selectmovefrompile := pile;
            selectmovetopile := faceuplanding[1];
            exit;
          end
          else begin
            if scorelandingcount <> 0 then begin
              selectmoveaction := 'movebottomtoscore';
              selectmovecard := c;
              selectmovefrompile := pile;
              selectmovescorepile := scorelanding[1];
              exit;

            end; {if scorelandingcount...}
          end;   {if faceuplandingcount...}
        end;     {if cardrank}
      end;       {if facedowncount...}
    end;         {for pile}
  end;           {if king available}

    // 6 - If faceup has no facedown cards, and can move to 2 spots,
    //     then move to either one (eg 6h to 7s or 7c).
    //     Doesn't really accomplish anything, more of a housekeeping move.
    //     And it could block putting up a card, but that would be rare.
    //     For the moment, we won't bother.


    // 7 - If desperate: Move a bottom faceup card to a score pile regardless.

  if desperate = True then begin
    for pile := 1 to 7 do begin
      if faceupcount[pile] > 0 then begin
        c := faceup[pile, faceupcount[pile]];
        wherecanmove (c, 'bottom');
        if scorelandingcount > 0 then begin
          selectmoveaction := 'movebottomtoscore';
          selectmovecard := c;
          selectmovefrompile := pile;
          selectmovescorepile := scorelanding[1];
          exit;
        end;
      end;
    end;
  end;

    // 8 - If desperate: Move discard to score pile, regardless.

  if desperate = True then begin
    if discardcount > 0 then begin
      c := discard[discardcount];
      wherecanmove (c, 'discard');
      if scorelandingcount > 0 then begin
        selectmoveaction := 'movediscardtoscore';
        selectmovecard := c;
        selectmovescorepile := scorelanding[1];
        exit;
      end;
    end;
  end;

    // 9 - If desperate: move a card (or chain) to allow the card above it to
    //     go to score pile.
    //
    //     Look at each score pile. See what the next card is for it. See if that
    //     exists in the 7 piles. And if it does, see if the card or chain below
    //     it can be moved somewhere else in the piles.
    //
    //     Note that we don't bother to look for an ace or 2 since they should
    //     be up there already if possible, and they would be bottom of their
    //     faceup pile (unless the user is putting an Ace on a two).

  if desperate then begin

    for scorepile := 1 to 4 do begin
      n := scorecount[scorepile];
      if (n >= 2) and (n < 13) then begin
        c := score[scorepile, n];
        cnext := succ(c);
        for pile := 1 to 7 do begin
          if faceupcount[pile] > 1 then begin
            for i := 1 to faceupcount[pile] - 1 do begin {if it's bottom card, can already move it up}
              if faceup[pile,i] = cnext then begin
                cmove := faceup[pile,i+1];
                wherecanmove (cmove, 'interior');
                if faceuplandingcount > 0 then begin
                  selectmoveaction   := 'moveinteriortofaceup';
                  selectmovecard     := cmove;
                  selectmovefrompile := pile;
                  selectmovetopile   := faceuplanding[1];
                  exit;
                end;
              end;
            end;       {for j}
          end;
        end;           {for i}
      end;
    end;               {for pile}
   end;

    // 10- Can we draw another card?

  if drawcount > 0 then begin
    selectmoveaction := 'drawacard';
    exit;
  end;

    // 11- Can we turn over the discard pile?

  if discardcount > 0 then begin
    selectmoveaction := 'remakedrawpile';
    exit;
  end;

    // 12- No possible move of any kind.

  selectmoveaction := 'none';

end;

//===================================================================
// Show the hint (while the mouse is hovering over the hint icon).
//===================================================================

procedure displayhint;

begin

  case selectmoveaction of

    'movediscardtoscore' : begin
      tagon (selectmovecard, selectmovescorepile, 'score');
    end;

    'movediscardtofaceup' : begin
      tagon (selectmovecard, selectmovetopile, 'faceup');
    end;

    'movebottomtoscore' : begin
      tagon (selectmovecard, selectmovescorepile, 'score');
    end;

    'movebottomtofaceup' : begin
      tagon (selectmovecard, selectmovetopile, 'faceup');
    end;

    'moveinteriortofaceup' : begin
       tagon (selectmovecard,  selectmovetopile, 'faceup');
    end;

    'drawacard' : begin
      tagdraw;
    end;

    'remakedrawpile' : begin
      tagdraw;
    end;

  end; {case}


end;

//===================================================================
// Remove the hint (when the mouse leaves the hint icon).
//===================================================================

procedure removehint;

begin

    // Just turn off all the tags.
    // Don't try to figure out where they are or if they are being used.

  frmMain.imgTag.Visible := False;
  frmMain.imgTagborder.Visible := False;

end;


//###################################################################
// UNDO ROUTINES
//###################################################################


//===================================================================
// 1 - undo draw a card
//===================================================================

procedure undo_draw;

var
  c                      : card;

begin

    // Disable the current top card on the draw pile, if any.

  if drawcount > 0 then begin
    c := draw[drawcount];
    pcard[c].Enabled := False;
  end;

    // Move the top card of the discard pile to the draw pile and
    // show its back. Enable it again just to be safe.

  c := discard[discardcount];
  pcard[c].Top     := DRAWTOP;
  pcard[c].Left    := DRAWLEFT;
  pcard[c].Picture := backimage.Picture;
  pcard[c].Enabled := True;
  pcard[c].Bringtofront;

  drawcount := drawcount + 1;
  draw[drawcount] := c;

    // Enable the new top card on the discard pile, if any.

  discardcount := discardcount - 1;
  if discardcount > 0 then begin
    c := discard[discardcount];
    pcard[c].Enabled := True;
  end;

end;

//===================================================================
// 2 - undo remaking of the draw pile (by turning it back into the
//     discard pile)
//===================================================================

procedure undo_redraw;

var
  c                      : card;
  i                      : smallint;
  n                      : smallint;

begin

    // Are there any cards in the draw pile?
    // There should be, because we are undoing something that
    // actually happened, but just to be safe ...

  if drawcount = 0 then begin
    exit;
  end;

    // In effect, we turn the draw pile over to become the discard pile.

  n := 0;
  for i := drawcount downto 1 do begin
    c := draw[i];
    pcard[c].Top     := DISCARDTOP;
    pcard[c].Left    := DISCARDLEFT;
    pcard[c].Picture := cardimage[c].Picture;
    pcard[c].Enabled := False;
    pcard[c].Bringtofront;
    n := n + 1;
    discard[n] := c;
  end;

    // Change the counts and enable the top card on the discard pile.

  discardcount := drawcount;
  drawcount := 0;
  c := discard[discardcount];
  pcard[c].Enabled := True;

end;

//===================================================================
// 3 - undo moving card from discard to a score pile
//===================================================================

procedure undo_discardtoscore;

var
  c                      : card;
  scorepile              : smallint;

begin

  scorepile := move[movecount,3];
  c := score[scorepile, scorecount[scorepile]];

    // Move the card image back to the discard pile and record in array.

  pcard[c].Top  := DISCARDTOP;
  pcard[c].Left := DISCARDLEFT;
  pcard[c].Bringtofront;
  pcard[c].Enabled := True;

  discardcount := discardcount + 1;
  discard[discardcount] := c;

    // Remove from score pile

  scorecount[scorepile] := scorecount[scorepile] - 1;

end;

//===================================================================
// 4 - undo moving card from faceup pile to a score pile
//===================================================================

procedure undo_faceuptoscore;

var
  c                      : card;
  scorepile              : smallint;
  topile                 : smallint;

begin

  topile := move[movecount,2];
  scorepile := move[movecount,3];
  c := score[scorepile, scorecount[scorepile]];

    // Move card back to the faceup pile.

  pcard[c].Top  := PILE1TOP + facedowncount[topile]*SPACEFACEDOWN + (faceupcount[topile])*SPACEFACEUP;
  pcard[c].Left := PILE1LEFT + (topile-1)*(PILESPACING + CARDWIDTH);
  pcard[c].Bringtofront;
  pcard[c].Enabled := True;

  faceupcount[topile] := faceupcount[topile] + 1;
  faceup[topile,faceupcount[topile]] := c;

    // Remove from score pile.

  scorecount[scorepile] := scorecount[scorepile] - 1;

end;

//===================================================================
// 5 - undo moving card from discard to a faceup pile
//===================================================================

procedure undo_discardtofaceup;

var
  c                      : card;
  frompile               : smallint;

begin

  frompile := move[movecount,3];
  c := faceup[frompile, faceupcount[frompile]];

    // Move the card image to the discount pile and record in array.

  pcard[c].Top  := DISCARDTOP;
  pcard[c].Left := DISCARDLEFT;
  pcard[c].Bringtofront;
  pcard[c].Enabled := True;

  discardcount := discardcount + 1;
  discard[discardcount] := c;

    // Remove from faceup pile.

  faceupcount[frompile] := faceupcount[frompile] - 1;

end;

//===================================================================
// 6 - undo moving a card from score pile back down to a faceup pile
//===================================================================

procedure undo_scoretofaceup;

begin
  // Not provided for in this game.
end;

//===================================================================
// 7 - undo moving one or more faceup cards to another faceup pile
// This undo handles two cases logged during gameplay: moving a
// bottom card to another pile, and moving an interior chain of cards
// to another pile.
//===================================================================

procedure undo_faceupshift;

var
  c                      : card;
  fromcardposition       : smallint;
  frompile               : smallint;
  i                      : smallint;
  n                      : smallint;
  topile                 : smallint;

begin

  frompile := move[movecount,3];    {it was "to" when logged, becomes "from" now}
  topile   := move[movecount,2];    {likewise, was "from", now "to"}
  n        := move[movecount,4];    {number of cards in chain}

  fromcardposition := (faceupcount[frompile] - n) + 1;

    // Move the chain.

  for i := fromcardposition to faceupcount[frompile] do begin
    c := faceup[frompile, i];
    pcard[c].Top := PILE1TOP + facedowncount[topile]*SPACEFACEDOWN + (faceupcount[topile])*SPACEFACEUP;
    pcard[c].Left := PILE1LEFT + (topile-1)*(PILESPACING + CARDWIDTH);
    pcard[c].Bringtofront;
    pcard[c].Enabled := True;
    faceupcount[topile] := faceupcount[topile] + 1;
    faceup[topile,faceupcount[topile]] := c;
  end;

    // Remove from source pile.

  faceupcount[frompile] := fromcardposition - 1;

end;

//===================================================================
// 8 - undo turning over a card in facedown pile
//
// The turning over is done automatically, following a move that
// exposes the top facedown card. So, to have the same effect, we
// will undo the turnover, and automatically undo the previous
// entry in the log. This not only mimics what happens in the game in
// reverse, it also avoids leaving a pile with an exposed facedown
// card. This would be bad, since we don't give the user a way of
// processing this in the game.
//===================================================================

procedure undo_turnoverfacedown;

var
  c                      : card;
  movetype               : smallint;
  pile                   : smallint;

begin

  pile := move[movecount,2];

    // There should only be 1 face up card.
    // No reason to check this, because if it's not, we are messed up.
    // But we'll check anyway.

  if faceupcount[pile] <> 1 then begin
    exit;
  end;

    // It's OK.

  c := faceup[pile, 1];

    // Remove from faceup stack.

  faceupcount[pile] := 0;

    // Add to facedown stack. It stays in the same position.

  facedowncount[pile] := facedowncount[pile] + 1;
  facedown[pile,facedowncount[pile]] := c;
  pcard[c].Picture := backimage.Picture;
  pcard[c].Enabled := False;
  pcard[c].Bringtofront;

    // Now do the move logged before this since the turnover was done
    // automatically as a part of it. It should only be these two cases.
    // If it's something else, then we have messed up again and there is really
    // nothing else to do because we will be leaving a facedown card exposed
    // with no possibility of using it.

  movecount := movecount -1;
  movetype := move[movecount,1];

  case movetype of
    4 : undo_faceuptoscore;
    7 : undo_faceupshift;
    else exit;
  end;

    // When we return to the undo caller, the movecount will be decremented
    // again for the case we just called, like all the others.

end;


//###################################################################
// AUTO PLAY
//###################################################################

//===================================================================
// Do one auto play move.
//
// We don't use one routine to play one autoplay game after another.
// That doesn't give a chance for the user to interrupt it. Instead,
// we make one play, then put on a timer before we do another move.
// The timer allows the user to do some action, while a sleep just
// suspends the app.
//===================================================================

procedure doautoplaymove;

var
  gameover               : boolean = False;
  label aftermove;

begin

    // Check for game over.
    // If we cycle through the draw pile one time without a move, then we
    // go into desperate mode and stay in that mode. If we cycle through
    // again (not just right after, but any time while in desperate mode),
    // for sure there are no moves we know how to make, and this game is
    // over.
    // The '>=' handles the case where no cards left in either pile.
    // Otherwise, may never go desperate and game would end too early.

  case desperate of
    True: begin
      if consecutivedraws > (drawcount + discardcount) then begin
        gameover := True;
        goto aftermove;
      end;
    end;
    False: begin
      if consecutivedraws >= (drawcount + discardcount) then begin
        desperate := True;
        consecutivedraws := 0;
      end;
    end;
  end; {case}

    // What should the next move be?

  selectmove;

  case selectmoveaction of

    'movediscardtoscore' : begin
       movediscardtoscore (selectmovescorepile);
       consecutivedraws := 0;
     end;

     'movediscardtofaceup' : begin
       movediscardtofaceup (selectmovetopile);
       consecutivedraws := 0;
      end;

     'movebottomtoscore' : begin
       movebottomtoscore (selectmovefrompile, selectmovescorepile);
       consecutivedraws := 0;
     end;

     'movebottomtofaceup' : begin
       movebottomtofaceup (selectmovefrompile, selectmovetopile);
       consecutivedraws := 0;
     end;

     'moveinteriortofaceup' : begin
        moveinteriortofaceup (selectmovecard, selectmovefrompile, selectmovetopile);
        consecutivedraws := 0;
     end;

     'drawacard' : begin
       drawacard;
       consecutivedraws := consecutivedraws + 1;
     end;

     'remakedrawpile' : begin
       remakedrawpile; {don't change consecutivedraws count}
     end;

     'none' : begin
       if desperate = False then begin
         desperate := True;
       end
       else begin
         gameover := True;
       end;
     end;

     else begin
       gameover := True;  {should never happen}
     end;

  end; {case}

    // If this game is over, start a new one.

aftermove:

  if gameover = True then begin
    sleep (2000);
    startgame;
  end;

    // Turn on timer for next move.

  frmMain.timAutoPlay.Enabled := True;

end;


//###################################################################
// CARD DISPLAY
//###################################################################


//===================================================================
// Layout the starting positions of the cards for the game.
//
// All of our stacks of cards, whether in the draw pile, the discard
// pile, the score piles, the facedown piles, or the faceup piles
// are numbered from the bottom up. That is, the bottom card is
// index 1, and the top card is index equal to the count in the pile.
// Why? Because we always do things with the top card of each stack.
// When we remove the top card and put it somewhere else, then the
// remaining cards are still numbered correctly. Same for the stack
// we move it to. We would have to renumber the cards if we counted
// from 1 at the top.
//===================================================================

procedure layoutthegame;

var
  c                      : card;
  endtop                 : smallint;
  endleft                : smallint;
  i                      : smallint;
  n                      : smallint = 53;
  pile                   : smallint;
  row                    : smallint;

begin

    // Turn all the cards over and stack them in the deal position,
    // in the order they were shuffled.
    // We don't animate this because: it's slow, it looks messy, and
    // it can reveal the sorted order a bit.

  for i := 52 downto 1 do begin
    c := gamedeck[i];
    pcard[c].Picture := backimage.Picture;;
    pcard[c].Enabled := False;
    pcard[c].Bringtofront;
    pcard[c].Top  := DEALTOP;
    pcard[c].Left := DEALLEFT;
  end;

    // Put the first 28 cards in the seven piles, starting with row 1
    // and going across to each pile, turning over the first card in each
    // row as we go.

  for row := 1 to 7 do begin

    for pile := row to 7 do begin
      n := n - 1;
      c := gamedeck[n];

      case pile = row of

        true : begin
          pcard[c].Picture := cardimage[c].Picture;
          pcard[c].Enabled := True;
          faceup[pile,1] := c;
        end;

        false: begin
          facedown[pile,row] := c;
        end;

      end; {case}

      pcard[c].Visible := True;
      pcard[c].Bringtofront;
      endtop  := PILE1TOP + SPACEFACEDOWN*(row-1);
      endleft := PILE1LEFT + (pile-1)*(CARDWIDTH+PILESPACING);
      if animateon then begin
        animate (c, endtop, endleft, 0);
      end
      else begin
        pcard[c].Top  := endtop;
        pcard[c].Left := endleft;
      end;

    end; {for pile}

  end;   {for row}
 
  for pile := 1 to 7 do begin
    faceupcount[pile] := 1;
    facedowncount[pile] := pile - 1;
  end;

    // Put the remaining 24 cards in the draw pile.
    // Note that we don't deal from the top of the deck to form the draw pile.
    // That would reverse the order. We simply place the remaining deck there.
    // In order to have the images in the right order, we move from the bottom.

    // First we move the bottom 23 cards invisibly.

  for i := 1 to 23 do begin
    c := gamedeck[i];
    pcard[c].Visible := False;
    pcard[c].Top  := DRAWTOP;
    pcard[c].Left := DRAWLEFT;
  end;

    // Then we move the top card. If animation is off, it goes instantly.
    // If animation is on, then we animate the move to simulate the
    // movement of the entire draw pile.

  c := gamedeck[24];
  pcard[c].Visible := True;
  pcard[c].Bringtofront;
  if animateon = True then begin
    animate (c, DRAWTOP, DRAWLEFT, 0);
  end
  else begin
    pcard[c].Top  := DRAWTOP;
    pcard[c].Left := DRAWLEFT;
  end;

    // Tidy up the draw pile.

  for i := 1 to 24 do begin
    c := gamedeck[i];
    pcard[c].Visible := True;
    pcard[c].Bringtofront;
    draw[i] := c;
  end;

  drawcount := 24;
  pcard[draw[drawcount]].Enabled := True;

     // Zero out discard and score piles.

  discardcount := 0;
  for i := 1 to 4 do begin
    scorecount[i] := 0;
  end;
end;

//===================================================================
// Repaint - redo the card display in case of a glitch
//
// Not currently used, but kept around in case needed in future.
// It was useful when using a mouse that was acting up but only
// because I didn't have the flags set up properly to ignore
// mouse downs when the previous mouse action wasn't completed.
//===================================================================

procedure repaint;

var
  c                      : card;
  i                      : smallint;
  pile                   : smallint;

begin

    // Repaint draw pile.

  if drawcount > 0 then begin
    for i := 1 to drawcount do begin
      c := draw[i];
      pcard[c].Top  := DRAWTOP;
      pcard[c].Left := DRAWLEFT;
      pcard[c].Bringtofront;
    end;
  end;

    // Repaint discard pile.

  if discardcount > 0 then begin
    for i := 1 to discardcount do begin
      c := discard[i];
      pcard[c].Top  := DISCARDTOP;
      pcard[c].Left := DISCARDLEFT;
      pcard[c].Bringtofront;
    end;
  end;

    // Repaint score piles.

  for pile := 1 to 4 do begin
    if scorecount[pile] > 0 then begin
      for i := 1 to scorecount[pile] do begin
        c := score[pile,i];
        pcard[c].Top  := SCORE1TOP;
        pcard[c].Left := SCORE1LEFT + (pile-1)*(PILESPACING + CARDWIDTH);
        pcard[c].Bringtofront;
      end;
    end;
  end;

  // Repaint the 7 piles.

  for pile := 1 to 7 do begin

    if facedowncount[pile] > 0 then begin
      for i := 1 to facedowncount[pile] do begin
        c := facedown[pile,i];
        pcard[c].Top :=  PILE1TOP + (i-1)*SPACEFACEDOWN;
        pcard[c].Left := PILE1LEFT + (pile-1)*(PILESPACING + CARDWIDTH);
        pcard[c].Bringtofront;
      end;
    end;

    if faceupcount[pile] > 0 then begin
      for i := 1 to faceupcount[pile] do begin
        c := faceup[pile,i];
        pcard[c].Top := PILE1TOP + facedowncount[pile]*SPACEFACEDOWN + (i-1)*SPACEFACEUP;
        pcard[c].Left := PILE1LEFT + (pile-1)*(PILESPACING + CARDWIDTH);
        pcard[c].Bringtofront;
      end;
    end;

  end;

end;

//===================================================================
// Put a tag on the draw pile as a hint to either draw a new card
// or remake the pile from the discard pile.
//===================================================================

procedure tagdraw;

begin
  frmMain.imgTag.Top     := DRAWTOP + (CARDHEIGHT DIV 2) - 3;
  frmMain.imgTag.Left    := DRAWLEFT + (CARDWIDTH - 15);
  frmMain.imgTag.Visible := True;
  frmMain.imgTag.BringToFront;
end;

//===================================================================
// Put a tag on the hinted card to click, and the red border
// around the hinted target.
//===================================================================

procedure tagon (hintcard: card; targetpile: smallint; piletype: shortstring);

var
  i                      : smallint;
  pile                   : smallint;
  taghigh                : boolean;
  targetleft             : smallint;
  targettop              : smallint;

begin

    // The target pile.

  case piletype of

    'score' : begin
      targetleft   := SCORE1LEFT + (targetpile - 1)*(PILESPACING + CARDWIDTH);
      targettop    := SCORE1TOP;
    end;

    'faceup' : begin
      targetleft   := PILE1LEFT + (targetpile - 1)*(PILESPACING + CARDWIDTH);
      if facedowncount[targetpile] + faceupcount[targetpile] = 0 then begin
        targettop  := PILE1TOP;
      end
      else begin
        targettop  := PILE1TOP + facedowncount[targetpile]*SPACEFACEDOWN + (faceupcount[targetpile]-1)*SPACEFACEUP;
      end;
    end;

  end; {case}

  frmMain.imgTagborder.Top     := targettop - 3;
  frmMain.imgTagborder.Left    := targetleft -3;
  frmMain.imgTagborder.Visible := True;
  frmMain.imgTagborder.bringtofront;

      // The hint card.
      // We dislay it after the target pile border above so that the "tag" arrow
      // is in front of the "touch" border, if they happen to be moving a card
      // from one pile to one right beside it. Otherwise, the arrow would be
      // peeking out from under the border, which looks weird.
      //
      // We put the arrow right by the middle of the card being moved.
      // Except if the card has other cards below it. In which case only the
      // top of the card shows, so we put the arrow higher and in the middle.

    taghigh := false;

    for pile := 1 to 7 do begin
      if faceupcount[pile] > 1 then begin
        for i := 1 to faceupcount[pile]-1 do begin
          if hintcard = faceup[pile,i] then begin
            taghigh := true;
            break;
          end;
        end;
      end;
      if taghigh = true then begin
        break;
      end;
    end;

    if taghigh = True then begin
      frmMain.imgTag.Top  := pcard[hintcard].Top + 3;
      frmMain.imgTag.Left := pcard[hintcard].Left + (CARDWIDTH DIV 2) + 2;
    end
    else begin
      frmMain.imgTag.Top  := pcard[hintcard].Top + (CARDHEIGHT DIV 2) - 3;
      frmMain.imgTag.Left := pcard[hintcard].Left + CARDWIDTH - 15;
    end;

    frmMain.imgTag.Visible := True;
    frmMain.imgTag.Bringtofront;

end;

//===================================================================
// Animate the movement of a card.
// balanced. (If unbalanced, the player should move them.)
//
// This saves the drudgery of putting them up one by one.
//===================================================================

procedure animate (c: card; endtop: smallint; endleft: smallint; frompile: smallint);

var
  //adjusteddelay          : smallint;
  chainc                 : card;
  //chaincount             : smallint;

  deltaleft              : smallint;
  deltatop               : smallint;

  deltax                 : single;
  deltay                 : single;
  deltaz                 : single;

  fromposition           : smallint;
  i                      : smallint;
  interval               : single;
  moving                 : boolean;

  n                      : smallint;
  newleft                : smallint;
  newtop                 : smallint;
  startleft              : smallint;
  starttop               : smallint;

  x                      : single;
  y                      : single;
  z                      : single;

begin

    // Moving from here.

  starttop := pcard[c].Top;
  startleft := pcard[c].Left;

    // Triangle distances to move.

  x := abs (endleft - startleft);
  y := abs (endtop - starttop);
  z := sqrt (x*x + y*y);

  deltaz := 0;
  interval := 50;

    // Are we moving a chain? If so, from what position?

  if frompile <> 0 then begin
    fromposition := 0;
    for i := 1 to faceupcount[frompile] do begin
      chainc := faceup[frompile, i];
      if c = chainc then begin
        fromposition := i;
        break;
      end;
    end;
    if fromposition = 0 then begin
      showmessage ('Could not locate card in chain to animate');
      halt;
    end;
  end;

    // Bring the card (and chain if there) to front so won't slide
    // under other cards when moved.

  pcard[c].Bringtofront;
  if frompile <> 0 then begin
    for i := fromposition + 1 to faceupcount[frompile] do begin
      chainc := faceup[frompile,i];
      pcard[chainc].Bringtofront;
    end;
  end;

    // Keep moving along the hypotenuse until gone just under or at distance z.

  moving := true;
  while moving = true do begin
    moving := false;

      // Gone far enough.

    deltaz := deltaz + interval;
    if deltaz > z then begin
      break;
    end;

      // Calculate new interval point.

    moving := true;

    deltax := (deltaz/z) * x;
    deltay := (deltaz/z) * y;

    deltaleft := trunc (deltax);
    deltatop  := trunc (deltay);

    if (endleft - startleft) > 0 then begin
      newleft := startleft + deltaleft;
    end
    else begin
      newleft := startleft - deltaleft;
    end;

    if (endtop - starttop) > 0 then begin
      newtop := starttop + deltatop;
    end
    else begin
      newtop := starttop - deltatop;
    end;

      // Move the card (or just first card of chain).

    pcard[c].Left := newleft;
    pcard[c].Top  := newtop;

      // Move rest of chain, if any.
      // Only update after all moved, otherwise jerky.

    if frompile = 0 then begin
      pcard[c].Update;
    end
    else begin
      n := 1;
      for i := fromposition + 1 to faceupcount[frompile] do begin
        chainc := faceup[frompile,i];
        pcard[chainc].Top  := newtop + n*SPACEFACEUP;
        pcard[chainc].Left := newleft;
        n := n + 1;
      end;
      pcard[chainc].Update;
    end;

      // Delay according to time user set on trackbar.
{
    if frompile = 0 then begin
      chaincount := 1;
    end
    else begin
      chaincount := faceupcount[frompile] - (fromposition - 1);
      if chaincount < 1 then begin
        chaincount := 1;
      end;
    end;

    adjusteddelay := animatedelay DIV chaincount;
    sleep (adjusteddelay);
 }

    sleep (animatedelay);

  end;  {while}

    // Complete the move to the exact endpoint.

  pcard[c].Top  := endtop;
  pcard[c].Left := endleft;

  if frompile <> 0 then begin
    n := 1;
    for i := fromposition + 1 to faceupcount[frompile] do begin
      chainc := faceup[frompile,i];
      pcard[chainc].Top  := endtop + n*SPACEFACEUP;
      pcard[chainc].Left := endleft;
      n := n + 1;
    end;
  end;

end;

//===================================================================
// Show all cards in the score piles as a sort of reward for winning.
// But only do this if animation is on, and all 52 cards have been
// put up.
//===================================================================

procedure reward;

var
  c                      : card;
  i                      : smallint;
  pile                   : smallint;

begin

  if animateon = false then begin
    exit;
  end;

  if scorecount[1] + scorecount[2] + scorecount[3] + scorecount[4] <> 52 then begin
    exit;
  end;

  frmMain.shpDrawEmpty.Visible := false;         {just to have a cleaner screen}

  for pile := 1 to 4 do begin
    for i := 1 to scorecount[pile] do begin
      c := score[pile,i];
      pcard[c].Top := SCORE1TOP + (i-1) * SPACEFACEUP;
    end;
  end;

end;

//===================================================================
// Post all scoreable cards, as long as they keep the score piles
// balanced. (If unbalanced, the player should move them.)
//
// This saves the drudgery of putting them up one by one.
//===================================================================

procedure postscoreablecards;

var
  c                      : card;
  pile                   : smallint;
  posted                 : boolean;

begin

  posted := true;

    // We don't make just one post for each iteration of the while.
    // We post as many as we can. If we post at least one, then we
    // do it again.

  while posted = True do begin

    posted := False;  {assume will not find any}

      // Can I post the discard?

    if discardcount > 0 then begin
      c := discard[discardcount];
      wherecanmove (c, 'discard');
      if scorelandingcount > 0 then begin
        if balanced (c) then begin
          movediscardtoscore (scorelanding[1]);
          posted := true;
        end;
      end;
    end;

      // Can I post from the 7 piles?

    for pile := 1 to 7 do begin
      if faceupcount[pile] > 0 then begin
        c := faceup[pile, faceupcount[pile]];
        wherecanmove (c, 'bottom');
        if scorelandingcount > 0 then begin
          if balanced (c) then begin
            movebottomtoscore (pile, scorelanding[1]);
            posted := true;
          end;
        end;
      end;
    end;

  end;    {while}

end;

//###################################################################
// UTILITY PROCEDURES AND FUNCTIONS
//
// These are general purpose routines that have nothing to do
// with the gameplay.
//###################################################################


//===================================================================
// Count number of cards in set.
// Wish there was a built-in function for getting number of members
// in a set.
//===================================================================

function countcards (xcards : cardset) : smallint;
var
  c                       : card;
  i                       : smallint = 0;
begin
  for c in xcards do begin
      i := i + 1;
  end;
  result := i;
end;

//===================================================================
// Give me the nth card in a set.
//===================================================================

function cardpos_to_card (n : smallint; xcards : cardset) : card;

var
  c                       : card;
  found                   : boolean = false;
  foundcard               : card;
  i                       : smallint = 0;

begin
  for c in xcards do begin
      i := i + 1;
      if i = n then begin
        found := true;
        foundcard := c;
        break;
      end;
  end;

  if found = false then begin
    showmessage ('Could not find card at given position in hand');
    halt;
  end;

  result := foundcard;

end;

//===================================================================
// Pick a random card from some set of cards.
//===================================================================

function pickarandomcard (xcards : cardset) : card;

begin
  result := cardpos_to_card (random(countcards(xcards))+1, xcards);
end;

//===================================================================
// Shuffle a deck of cards.
// Return an array of cards in random order.
//===================================================================

function shuffledeck () : cardarray;

var
  c                      : card;
  i                      : smallint;
  randomdeck             : array [1..52] of card;
  remainingdeck          : cardset;

begin

  remainingdeck := deck;
  for i := 1 to 52 do begin
    c := pickarandomcard (remainingdeck);
    remainingdeck := remainingdeck - [c];
    randomdeck[i] := c;
  end;

  result := randomdeck;

end;

//###################################################################
// END PROGRAM
//###################################################################

end.

