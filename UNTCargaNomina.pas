unit UNTCargaNomina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxCustomTileControl, cxClasses, dxTileControl, Xml.xmldom, Xml.XMLIntf,
  Vcl.StdCtrls, Xml.XMLDoc, Vcl.ExtCtrls, Vcl.Menus, cxButtons;

type
  TFrameCargarNomina = class(TFrame)
    Panel6: TPanel;
    dxTileControl1: TdxTileControl;
    ListBox1: TListBox;
    ListBox2: TListBox;
    XMLDocument1: TXMLDocument;
    BtnCargarXML: TcxButton;
    procedure BtnCargarXMLClick(Sender: TObject);
  private
    { Private declarations }
    function LecturaXML(pDoc:String): WideString;
    function ValidarTercero(pIdEmpleado,pCodDocumento,pPrimerNombe,pSegundoNombre,pPrimerApellido,pSegundoApellido,pDireccion,pTelefono,pEmail,pCodDepartamento,pCodCiudad,pSalIntegral,pSueldo,pFechaIngreso,pFechaRetiro,pCodTipoContrato,pCodTipoTrabajador,pCodSubtipoTrabajador,pCargo,pNombreBanco,pTipoCuenta,pNumCuenta:String): WideString;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameCargarNomina.BtnCargarXMLClick(Sender: TObject);
var
  Path,vDoc : String;
  vBuscar : TSearchRec;
begin
  Path := ExtractFilePath(Application.ExeName)+'XML\*.xml';
  SetCurrentDir(Path);
  if FindFirst(Path,faAnyFile,vBuscar) = 0 then
  begin
    repeat
      vDoc := vBuscar.Name;
      LecturaXML(vDoc);
    until FindNext(vBuscar) <> 0;
  end;
  FindClose(vBuscar);
end;


function TFrameCargarNomina.LecturaXML(pDoc: String): WideString;
var
  tempNode,tempNode2,tempNode3,Nodo,Nodo2,Nodo3: IXMLNode;

  cont,cont2,cont3,cont4: byte;

  FechaIngreso,FechaLiquidacionInicio,FechaLiquidacionFin,TiempoLaborado,FechaGen,
  Prefijo,CodigoTrabajador,TipoXML,PrimerNombre,SegundoApellido,PrimerApellido,Sueldo,TipoContrato,
  SalarioIntegral,LugarTrabajoDireccion,LugarTrabajoMunicipioCiudad,LugarTrabajoDepartamentoEstado,LugarTrabajoPais,
  TipoDocumento,AltoRiesgoPension,SubTipoTrabajador,TipoTrabajador,NumeroCuenta,TipoCuenta,Banco,
  DiasTrabajados,SueldoTrabajado,AuxilioTransporte,ViaticoManuAlojS,ViaticoManuAlojNS,Tipo_HE,HoraInicio_HE,HoraFin_HE,
  Cantidad_HE,Porcentaje_HE,Pago_HE,FechaInicio_VacComun,FechaFin_VacComun,Cantidad_VacComun,Pago_VacComun,
  Cantidad_VacCompens,Pago_VacCompens,Cantidad_Prima,Pago_Prima,PagoNS_Prima,Pago_Cesantia,Porcentaje_Cesantia,
  PagoIntereses_Cesantia,FechaInicio_Incapacidad,FechaFin_Incapacidad,Cantidad_Incapacidad,Tipo_Incapacidad,Pago_Incapacidad,
  FechaInicio_LicenciaMP,FechaFin_LicenciaMP,Cantidad_LicenciaMP,Pago_LicenciaMP,
  FechaInicio_LicenciaR,FechaFin_LicenciaR,Cantidad_LicenciaR,Pago_LicenciaR,
  FechaInicio_LicenciaNR,FechaFin_LicenciaNR,Cantidad_LicenciaNR,
  BonificacionS,BonificacionNS,AuxilioS,AuxilioNS,FechaInicio_HuelgaLegal,FechaFin_HuelgaLegal,Cantidad_HuelgaLegal,
  DescripcionConcepto_Otro,ConceptoS_Otro,ConceptoNS_Otro,CompensacionO,CompensacionE,PagoS_BonoEPCTV,PagoNS_BonoEPCTV,
  PagoAlimentacionS_BonoEPCTV,PagoAlimentacionNS_BonoEPCTV,
  Comision,PagoTercero,Anticipo,Dotacion,ApoyoSost,Teletrabajo,BonifRetiro,Indemnizacion,Reintegro,
  Porcentaje_Salud,Deduccion_Salud,Porcentaje_Pension,Deduccion_Pension,Porcentaje_SP,DeduccionSP,PorcentajeSub,DeduccionSub,
  Porcentaje_Sindicato,Deduccion_Sindicato,SancionPublic,SancionPriv,Descripcion_Libranza,Deduccion_Libranza,
  PagoTerceroDed,AnticipoDed,OtraDeduccion,PensionVoluntaria,RetencionFuente,AFC,Cooperativa,EmbargoFiscal,PlanComplementario,
  Educacion,Reintegro_deduccion,Deuda,Redondeo,
  DevengadosTotal,DeduccionesTotal,ComprobanteTotal,
  NodoName,NodoName2,NodoName3,
  Path,vDoc,vCodConcepto : String;

  vBuscar : TSearchRec;
begin
  XMLDocument1.FileName := ExtractFilePath(Application.ExeName) + 'XML\'+pDoc;
  XMLDocument1.Active := True;

  ListBox1.Clear;
  ListBox2.Clear;

  for Cont := 0 to XMLDocument1.ChildNodes.Count - 1 do
  begin
    tempNode := XMLDocument1.ChildNodes.Get(Cont);
    if tempNode.HasChildNodes then
    begin
      for Cont2 := 0 to tempNode.ChildNodes.Count - 1 do
      begin
        ListBox1.AddItem(tempNode.ChildNodes.Get(Cont2).NodeName, nil);
        NodoName := tempNode.ChildNodes.Get(Cont2).NodeName;
        Nodo := tempNode.ChildNodes[Cont2];
//----------------------------------------------TRABAJADOR----------------------------------------------//
        if Nodo.AttributeNodes['FechaIngreso'].Text <> '' then
        begin
          FechaIngreso := Nodo.AttributeNodes['FechaIngreso'].Text;
        end;

        if Nodo.AttributeNodes['FechaLiquidacionInicio'].Text <> '' then
        begin
          FechaLiquidacionInicio := Nodo.AttributeNodes['FechaLiquidacionInicio'].Text;
        end;

        if Nodo.AttributeNodes['FechaLiquidacionFin'].Text <> '' then
        begin
          FechaLiquidacionFin := Nodo.AttributeNodes['FechaLiquidacionFin'].Text;
        end;

        if Nodo.AttributeNodes['TiempoLaborado'].Text <> '' then
        begin
          TiempoLaborado := Nodo.AttributeNodes['TiempoLaborado'].Text;
        end;

        if Nodo.AttributeNodes['FechaGen'].Text <> '' then
        begin
          FechaGen := Nodo.AttributeNodes['FechaGen'].Text;
        end;

        if Nodo.AttributeNodes['Prefijo'].Text <> '' then
        begin
          Prefijo := Nodo.AttributeNodes['Prefijo'].Text;
        end;

        if Nodo.AttributeNodes['CodigoTrabajador'].Text <> '' then
        begin
          CodigoTrabajador := Nodo.AttributeNodes['CodigoTrabajador'].Text;
        end;

        if Nodo.AttributeNodes['TipoXML'].Text <> '' then
        begin
          TipoXML := Nodo.AttributeNodes['vTipoXML'].Text;
        end;

        if Nodo.AttributeNodes['PrimerNombre'].Text <> '' then
        begin
          PrimerNombre := Nodo.AttributeNodes['PrimerNombre'].Text;
        end;

        if Nodo.AttributeNodes['SegundoApellido'].Text <> '' then
        begin
          SegundoApellido := Nodo.AttributeNodes['SegundoApellido'].Text;
        end;

        if Nodo.AttributeNodes['PrimerApellido'].Text <> '' then
        begin
          PrimerApellido := Nodo.AttributeNodes['PrimerApellido'].Text;
        end;

        if Nodo.AttributeNodes['Sueldo'].Text <> '' then
        begin
          Sueldo := Nodo.AttributeNodes['Sueldo'].Text;
        end;

        if Nodo.AttributeNodes['TipoContrato'].Text <> '' then
        begin
          TipoContrato := Nodo.AttributeNodes['TipoContrato'].Text;
        end;

        if Nodo.AttributeNodes['SalarioIntegral'].Text <> '' then
        begin
          SalarioIntegral := Nodo.AttributeNodes['SalarioIntegral'].Text;
        end;

        if Nodo.AttributeNodes['LugarTrabajoDireccion'].Text <> '' then
        begin
          LugarTrabajoDireccion := Nodo.AttributeNodes['LugarTrabajoDireccion'].Text;
        end;

        if Nodo.AttributeNodes['LugarTrabajoMunicipioCiudad'].Text <> '' then
        begin
          LugarTrabajoMunicipioCiudad := Nodo.AttributeNodes['LugarTrabajoMunicipioCiudad'].Text;
        end;

        if Nodo.AttributeNodes['LugarTrabajoDepartamentoEstado'].Text <> '' then
        begin
          LugarTrabajoDepartamentoEstado := Nodo.AttributeNodes['LugarTrabajoDepartamentoEstado'].Text;
        end;

        if Nodo.AttributeNodes['LugarTrabajoPais'].Text <> '' then
        begin
          LugarTrabajoPais := Nodo.AttributeNodes['LugarTrabajoPais'].Text;
        end;

        if Nodo.AttributeNodes['TipoDocumento'].Text <> '' then
        begin
          TipoDocumento := Nodo.AttributeNodes['TipoDocumento'].Text;
        end;

        if Nodo.AttributeNodes['AltoRiesgoPension'].Text <> '' then
        begin
          AltoRiesgoPension := Nodo.AttributeNodes['AltoRiesgoPension'].Text;
        end;

        if Nodo.AttributeNodes['SubTipoTrabajador'].Text <> '' then
        begin
          SubTipoTrabajador := Nodo.AttributeNodes['SubTipoTrabajador'].Text;
        end;

        if Nodo.AttributeNodes['TipoTrabajador'].Text <> '' then
        begin
          TipoTrabajador := Nodo.AttributeNodes['TipoTrabajador'].Text;
        end;

        if Nodo.AttributeNodes['NumeroCuenta'].Text <> '' then
        begin
          NumeroCuenta := Nodo.AttributeNodes['NumeroCuenta'].Text;
        end;

        if Nodo.AttributeNodes['TipoCuenta'].Text <> '' then
        begin
          TipoCuenta := Nodo.AttributeNodes['TipoCuenta'].Text;
        end;

        if Nodo.AttributeNodes['Banco'].Text <> '' then
        begin
          Banco := Nodo.AttributeNodes['Banco'].Text;
        end;
//----------------------------------------------TRABAJADOR----------------------------------------------//
//----------------------------------------------DEVENGADOS----------------------------------------------//
        if NodoName = 'Devengados' then
        begin
          tempNode2 := tempNode.ChildNodes.Get(Cont2);
          if tempNode2.HasChildNodes then
          begin
            for Cont3 := 0 to tempNode2.ChildNodes.Count -1 do
            begin
              ListBox1.AddItem('  '+tempNode2.ChildNodes.Get(Cont3).NodeName, nil);
              NodoName2 := tempNode2.ChildNodes.Get(Cont3).NodeName;
              Nodo2 := tempNode2.ChildNodes[Cont3];

              if NodoName2 = 'Basico' then
              begin
                if Nodo2.AttributeNodes['DiasTrabajados'].Text <> '' then
                begin
                  DiasTrabajados := Nodo2.AttributeNodes['DiasTrabajados'].Text;
                end;

                if Nodo2.AttributeNodes['SueldoTrabajado'].Text <> '' then
                begin
                  SueldoTrabajado := Nodo2.AttributeNodes['SueldoTrabajado'].Text;
                end;
              end;

              if NodoName2 = 'Vacaciones' then
              begin
                tempNode3 := tempNode2.ChildNodes.Get(Cont3);
                if tempNode3.HasChildNodes then
                begin
                  for Cont4 := 0 to tempNode3.ChildNodes.Count -1 do
                  begin
                    ListBox1.AddItem('    '+tempNode3.ChildNodes.Get(Cont4).NodeName, nil);
                    NodoName3 := tempNode3.ChildNodes.Get(Cont4).NodeName;
                    Nodo3 := tempNode3.ChildNodes[Cont4];

                    if NodoName3 = 'VacacionesCompensadas' then
                    begin
                      if Nodo3.AttributeNodes['Cantidad'].Text <> '' then
                        Cantidad_VacCompens := Nodo3.AttributeNodes['Cantidad'].Text;
                      if Nodo3.AttributeNodes['Pago'].Text <> '' then
                        Pago_VacCompens := Nodo3.AttributeNodes['Pago'].Text;
                    end;

                    if NodoName3 = 'VacacionesComunes' then
                    begin
                      if Nodo3.AttributeNodes['Cantidad'].Text <> '' then
                        Cantidad_VacComun := Nodo3.AttributeNodes['Cantidad'].Text;
                      if Nodo3.AttributeNodes['Pago'].Text <> '' then
                        Pago_VacComun := Nodo3.AttributeNodes['Pago'].Text;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
//----------------------------------------------DEVENGADOS----------------------------------------------//
//----------------------------------------------DEDUCCCIONES----------------------------------------------//
        if NodoName = 'Deducciones' then
        begin
          tempNode2 := tempNode.ChildNodes.Get(Cont2);
          if tempNode2.HasChildNodes then
          begin
            for Cont3 := 0 to tempNode2.ChildNodes.Count -1 do
            begin
              ListBox1.AddItem('  '+tempNode2.ChildNodes.Get(Cont3).NodeName, nil);
              NodoName2 := tempNode2.ChildNodes.Get(Cont3).NodeName;
              Nodo2 := tempNode2.ChildNodes[Cont3];

              if NodoName2 = 'Salud' then
              begin
                if Nodo2.AttributeNodes['Porcentaje'].Text <> '' then
                begin
                  Porcentaje_Salud := Nodo2.AttributeNodes['Porcentaje'].Text;
                end;

                if Nodo2.AttributeNodes['Deduccion'].Text <> '' then
                begin
                  Deduccion_Salud := Nodo2.AttributeNodes['Deduccion'].Text;
                end;
              end;

              if NodoName2 = 'FondoPension' then
              begin
                if Nodo2.AttributeNodes['Porcentaje'].Text <> '' then
                begin
                  Porcentaje_Pension := Nodo2.AttributeNodes['Porcentaje'].Text;
                end;

                if Nodo2.AttributeNodes['Deduccion'].Text <> '' then
                begin
                  Deduccion_Pension := Nodo2.AttributeNodes['Deduccion'].Text;
                end;
              end;
            end;
          end;
        end;
//----------------------------------------------DEDUCCCIONES----------------------------------------------//
      end;
      ListBox2.AddItem('FechaIngreso: '+FechaIngreso,nil);
      ListBox2.AddItem('RetencionFuente: '+RetencionFuente,nil);
      ValidarTercero(CodigoTrabajador,TipoDocumento,PrimerNombre,
      '',PrimerApellido,SegundoApellido,LugarTrabajoDireccion,'',
      '',LugarTrabajoDepartamentoEstado,LugarTrabajoMunicipioCiudad,SalarioIntegral,Sueldo,FechaIngreso,
      '',TipoContrato,TipoTrabajador,SubTipoTrabajador,
      '',Banco,TipoCuenta,NumeroCuenta);
    end;
  end;
end;

function TFrameCargarNomina.ValidarTercero(pIdEmpleado, pCodDocumento, pPrimerNombe,
  pSegundoNombre, pPrimerApellido, pSegundoApellido, pDireccion, pTelefono,
  pEmail, pCodDepartamento, pCodCiudad, pSalIntegral, pSueldo, pFechaIngreso,
  pFechaRetiro, pCodTipoContrato, pCodTipoTrabajador, pCodSubtipoTrabajador,
  pCargo, pNombreBanco, pTipoCuenta, pNumCuenta: String): WideString;
begin

end;

end.
