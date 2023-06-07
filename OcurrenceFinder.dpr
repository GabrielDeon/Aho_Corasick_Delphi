program OcurrenceFinder;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  uAhoCorasick in 'uAhoCorasick.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
