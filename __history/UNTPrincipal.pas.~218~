unit UNTPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, frxDock,
  Vcl.RibbonLunaStyleActnCtrls, Vcl.Menus, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  Vcl.StdCtrls, cxButtons, cxClasses, cxStyles, MetropolisUI.Tile, cxControls,
  dxCustomTileControl, dxTileControl, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  cxContainer, cxEdit, cxTextEdit;

type
  TFormPrincipal = class(TForm)
    dxTileControl1: TdxTileControl;
    dxTileControl1Group1: TdxTileControlGroup;
    dxTileControl1Group2: TdxTileControlGroup;
    VerEmpleados: TdxTileControlItem;
    CargarNomina: TdxTileControlItem;
    ListaConceptos: TdxTileControlItem;
    ModuloFacturasElectronicasExp: TdxTileControlItem;
    ModuloNotasCreditoElectronicasExp: TdxTileControlItem;
    ModuloNotasDebitoElectronicasExp: TdxTileControlItem;
    RealizarNomina: TdxTileControlItem;
    CorregirNomina: TdxTileControlItem;
    NotasAjuste: TdxTileControlItem;
    Informes: TdxTileControlItem;
    ActualizarSalarioBasico: TdxTileControlItem;
    procedure CargarNominaClick(Sender: TdxTileControlItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UNTCargaNomina;

procedure TFormPrincipal.CargarNominaClick(Sender: TdxTileControlItem);
begin
  if Sender.DetailOptions.DetailControl = nil then
  begin
    Sender.DetailOptions.DetailControl := TFrameCargarNomina.Create(Self);
  end;
end;

end.
