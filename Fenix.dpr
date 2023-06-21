program Fenix;

uses
  Vcl.Forms,
  UNTPrincipal in 'UNTPrincipal.pas' {FormPrincipal},
  UNTCargaNomina in 'UNTCargaNomina.pas' {FrameCargarNomina: TFrame},
  UNTConn in 'UNTConn.pas' {DMConn: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('TabletDark');
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDMConn, DMConn);
  Application.Run;
end.
