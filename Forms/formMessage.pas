unit formMessage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMessage = class(TForm)
    pnMessage: TPanel;
    imgMessage: TImage;
    lbMessage: TLabel;
    btnMessage: TButton;
    procedure btnMessageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessage: TfrmMessage;

implementation

{$R *.dfm}

procedure TfrmMessage.btnMessageClick(Sender: TObject);
begin
  self.Close;
end;

end.
