unit about_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls;

type

  { TfrmAbout }

  TfrmAbout = class(TForm)
    btnCloseAbout: TButton;
    Image1: TImage;
    imgIconRepaint: TImage;
    imgIconNewGame: TImage;
    imgIconReplay: TImage;
    imgIconUndo: TImage;
    imgIconHint: TImage;
    imgIconAbout: TImage;
    imgIconQuit: TImage;
    Label1: TLabel;
    labIcons: TLabel;
    memCredits: TMemo;
    memIconNewGame: TMemo;
    memIconReplay: TMemo;
    memIconUndo: TMemo;
    memIconHint: TMemo;
    memIconAbout: TMemo;
    memIconQuit: TMemo;
    memIconRepaint: TMemo;
    memTips: TMemo;
    memRules: TMemo;
    pagAbout: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;

    procedure btnCloseAboutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  public

  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.lfm}

{ TfrmAbout }

procedure TfrmAbout.FormShow(Sender: TObject);
begin
  frmAbout.btnCloseAbout.Bringtofront;
end;


procedure TfrmAbout.btnCloseAboutClick(Sender: TObject);
begin
  Close;
end;

end.

