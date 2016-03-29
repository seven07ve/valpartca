<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

<!--#include file="fpdf.asp"-->
<!--#include file="X001Z001.INC"-->
<!--#include file="X001Z900.INC"-->
<%

strCnn	= Application("XDTA300_ConnectionString")

wCLA001 = Request.QueryString("CLA001")
wCLA002 = Request.QueryString("CLA002")
wCCI = "VAL" 'Session("glCiaInternet")
wCIA = "01" 'Session("glCia")

Response.write "<html><head><title>" & "Factura Nro. " & wCLA002 & "</title></head>"

SQL = "SELECT B300200CCL, A300002RSO, B300200FEC, A300002DIL,  "
SQL = SQL & " B300200NPE, B300200MNE, B300200BIV, B300200MTO,  " 		
SQL = SQL & " B300200CVE, B300200CON, "
SQL = SQL & " B300200PIM, A300002RIF, A300002NT1, "
SQL = SQL & " B300200BUL, B300200FVE, B300200CSE "
SQL = SQL & " FROM X300BQ200 " 
SQL = SQL & " WHERE "
SQL = SQL & " B300200CCI ='" & wCCI & "' AND "
SQL = SQL & " B300200CIA ='" & wCIA & "' AND "
SQL = SQL & " B300200NFA ='" & wCLA002 & "' "	
'response.write sql
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
'RESPONSE.WRITE SQL
IF NOT rstQuery.EOF THEN
	wCCL = trim(rstQuery.Fields("B300200CCL"))
	wRSO = trim(rstQuery.Fields("A300002RSO"))
	wDIL = trim(rstQuery.Fields("A300002DIL"))
	wFPR = cdate(rstQuery.Fields("B300200FEC"))
	wFVE = cdate(rstQuery.Fields("B300200FVE"))			
	wBUL = trim(rstQuery.Fields("B300200BUL"))
	wNPE = trim(rstQuery.Fields("B300200NPE"))			
	wMNE = trim(rstQuery.Fields("B300200MNE"))
	wBIV = trim(rstQuery.Fields("B300200BIV"))			
	wMTO = trim(rstQuery.Fields("B300200MTO"))			
	wOPE = trim(rstQuery.Fields("B300200CVE"))	
	wCSE = trim(rstQuery.Fields("B300200CSE"))
	wPIM = trim(rstQuery.Fields("B300200PIM"))
	wRIF = trim(rstQuery.Fields("A300002RIF"))		
	wTEL = trim(rstQuery.Fields("A300002NT1"))
	wCON = trim(rstQuery.Fields("B300200CON"))
END IF 
rstQuery.CLOSE
SET rstQuery = NOTHING	

wCSE = Right(wCSE,7) 

SQL = "SELECT A300020NOM  "
SQL = SQL & " FROM X300AF020 " 
SQL = SQL & " WHERE "
SQL = SQL & " A300020CCI ='" & wCCI & "' AND "
SQL = SQL & " A300020CIA ='" & wCIA & "' AND "
SQL = SQL & " A300020CVE ='" & wOPE & "' "	
'response.write sql
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
'RESPONSE.WRITE SQL
IF NOT rstQuery.EOF THEN
	wOPE2 = trim(rstQuery.Fields("A300020NOM"))		
END IF 
rstQuery.CLOSE
SET rstQuery = NOTHING	

wFPR = Right("00" & day(wFPR),2) & "/" & Right("00" & month(wFPR),2) & "/" & year(wFPR)
wFVE = Right("00" & day(wFVE),2) & "/" & Right("00" & month(wFVE),2) & "/" & year(wFVE)

Set pdf=CreateJsObject("FPDF")

pdf.CreatePDF "P", "mm", "A4"
pdf.SetPath("fpdf/")
pdf.SetFont "Arial","",16
pdf.SetSubject ("Factura " & wCLA002)
pdf.SetTitle("Factura " & wCLA002)
pdf.SetAuthor("Insystech, C.A.")
pdf.SetKeywords("Factura " & wCLA002)
pdf.SetCreator("Insystech, C.A.")
pdf.Open()
pdf.LoadModels("Factura") ' il nome del modello è specificato senza estensione.
pdf.AddPage()

pdf.SetFont "Arial","B",8
pdf.SetY(34)
pdf.rect 10, 33, 155, 30 'dibujo rectangulo
pdf.Cell 15,4,"Cliente:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.MultiCell 130,4,"" & wRSO & "",0,1,"L",0

pdf.SetY(39)
pdf.SetFont "Arial","B",8
pdf.Cell 15,4,"C"  & chr(243) & "digo:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.MultiCell 130,4,"" & wCCL & "",0,1,"L",0

pdf.SetY(44)
pdf.SetFont "Arial","B",8
pdf.Cell 15,4,"Direcci" & chr(243) & "n:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.MultiCell 130,4,"" & wDIL & "",0,1,"L",0

pdf.SetY(52)
pdf.SetFont "Arial","B",8
pdf.Cell 15,4,"R.I.F.:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.Cell 20,4,"" & wRIF & "",0,1,"L",0

pdf.SetY(57)
pdf.SetFont "Arial","B",8
pdf.Cell 15,4,"Tel"  & chr(233) & "fono:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.Cell 50,4,"" & wTEL & "",0,1,"L",0

pdf.SetY(57)
pdf.SetX(80)
pdf.SetFont "Arial","B",8
pdf.Cell 15,4,"Vendedor:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.Cell 130,4,"" & wOPE2 & "",0,1,"L",0

pdf.SetFont "helvetica","B",10
pdf.SetY(10)
pdf.SetX(127)
pdf.SetTextColor 34,56,113
pdf.Cell 130,5,"N" & chr(186) & " " & "DE CONTROL",0,1,"C",0
pdf.SetFont "Arial","B",16
pdf.SetY(16)
pdf.SetX(168)
pdf.Cell 10,5,"00",0,0,"R",0
pdf.SetTextColor 255,0,0
pdf.Cell 19,5,"" & wCSE & "",0,0,"L"

pdf.SetFillColor 255,255,255
pdf.SetTextColor 0,0,0

pdf.rect 170, 33, 30, 30 'dibujo rectangulo
pdf.SetY(35)
pdf.SetX(177)
pdf.SetFont "Arial","B",10
pdf.Cell 13,4,"FACTURA",0,0,"C",0
pdf.Ln()
pdf.SetX(177)
pdf.SetFont "Arial","B",8
pdf.MultiCell 130,4,"" & wCLA002 & "",0,1,"C",0

pdf.SetX(170)
pdf.SetFont "Arial","B",8
pdf.Cell 10,4,"Fecha:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.Cell 130,4,"" & wFPR & "",0,1,"L",0

pdf.SetX(170)
pdf.SetFont "Arial","B",8
pdf.Cell 10,4,"Vence:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.Cell 130,4,"" & wFVE & "",0,1,"L",0

pdf.SetX(177)
pdf.SetFont "Arial","B",7
pdf.Cell 10,4,"FORMA DE PAGO",0,0,"C",0
pdf.Ln()
pdf.SetX(120)
pdf.Cell 130,4,"Cr" & chr(233) & "dito",0,1,"C",0


pdf.rect 10, 64, 190, 4 'dibujo rectangulo

pdf.SetY(60)
pdf.Ln()

pdf.SetFont "Arial","B",8
pdf.Cell 18,4,"Referencia",0,0,"C",0
pdf.Cell 77,4,"Descripci" & chr(243) & "n",0,0,"C",0
pdf.Cell 36,4,"Cantidad",0,0,"C",0
pdf.Cell 28,4,"Precio Unitario",0,0,"C",0
pdf.Cell 26,4,"Total",0,0,"R",0

'Add Line Break
pdf.Ln()
pdf.SetFont "courier","",8

	SQL = " SELECT B300201CPR, A300003DEL, A300003REF, B300201UPE, "
	SQL = SQL & " B300201MNE,  B300201NFA, B300201PUN, B300201PAL " 
	SQL = SQL & " FROM X300BQ201 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300201CCI ='" & wCCI & "' AND "
	SQL = SQL & " B300201CIA ='" & wCIA & "' AND "	
	SQL = SQL & " B300201NFA ='" & wCLA002 & "' "
	'Response.Write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    'rstQueryData = rstQuery.GetRows 
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0
	wTC03 = 0 
	wTC08 = 0
	wTC09 = 0
	DO WHILE NOT rstQuery.EOF
	
	
		wCL2 = trim(rstQuery.Fields("B300201NFA"))
		wDEL = left(trim(rstQuery.Fields("A300003DEL")),30)
		wC01 = TRIM(rstQuery.Fields("B300201CPR")) 
		wREF = TRIM(rstQuery.Fields("A300003REF")) 
		wC02 = left(trim(rstQuery.Fields("A300003DEL")),20)
		wC03 = trim(rstQuery.Fields("B300201UPE"))
		wC04 = 0
		wC07 = trim(rstQuery.Fields("B300201PUN"))
		'wPES = trim(rstQuery.Fields("B300201PAL"))
		wC09 = trim(rstQuery.Fields("B300201MNE"))
		wDEL = wDEL & "  " & wC05
		
		IF isnull(wC03) then : wC03 = 0 :   end if	
		IF isnull(wC04) then : wC04 = 0 :   end if	
		
		IF isnull(wC07) then : wC07 = 0 :	end if	
		IF isnull(wC08) then : wC08 = 0 :	end if	
		IF isnull(wC09) then : wC09 = 0 :	end if			

		wTC03 = wTC03 + wC03
		wTC08 = wTC08 + wC08
		wTC09 = wTC09 + wC09
		'wTPES = wTPES + (cdbl(wPES)* cdbl(wC03))

		wC03 = formatnumber(wC03,0)
		wC04 = formatnumber(wC04,2)

		wC06 = formatnumber(wC06,2)
		wC07 = formatnumber(wC07,2)				
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wC09,2)

		wCuenta = wCuenta + 1

		wITE = wCuenta

		pdf.Cell 30,4,"" & wREF & "",0,0,"L",0
		pdf.Cell 60,4,"" & wDEL & "",0,0,"L",0
		pdf.Cell 30,4,"" & wC03 & "",0,0,"R",0
		pdf.Cell 35,4,"" & wC07 & "",0,0,"R",0
		pdf.Cell 30,4,"" & wC09 & "",0,0,"R",0		
		pdf.Ln()
		
		rstQuery.MoveNext 
		
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

pdf.rect 10, 220, 190, 50  'dibujo rectangulo
'pdf.rect 104, 210, 95, 31 'dibujo rectangulo

pdf.SetFont "Arial","B",8
pdf.SetY(225)
pdf.SetX(10)
pdf.Cell 40,4,"Sub-total:",0,0,"L",0
wC09 = wTC09
pdf.MultiCell 130,4,"" & formatnumber(wC09,2) & "",0,1,"R",0

pdf.SetY(230)
pdf.SetX(10)
pdf.Cell 51,4,"Flete:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.MultiCell 130,4,"" & formatnumber(wBPR,2) & "",0,1,"R",0

pdf.SetY(235)
pdf.SetX(10)
pdf.SetFont "Arial","B",8
pdf.Cell 51,4,"Descuento:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.MultiCell 130,4,"" & formatnumber(wBPR,2) & "",0,1,"L",0

pdf.SetY(235)
pdf.SetX(71)
wPOR = wBPR / wC09 * 100
pdf.MultiCell 130,4,"" & formatnumber(wPOR,2) & "  %",0,1,"L",0

pdf.SetY(240)
pdf.SetX(10)
pdf.SetFont "Arial","B",8
pdf.Cell 51,4,"Otro Descuento:",0,0,"L",0
pdf.SetFont "Arial","",8
pdf.MultiCell 130,4,"" & formatnumber(wBPR,2) & "",0,1,"L",0
pdf.SetY(240)
pdf.SetX(71)
wPOR = wBPR / wC09 * 100
pdf.MultiCell 130,4,"" & formatnumber(wPOR,2) & "  %",0,1,"L",0


pdf.SetY(225)
pdf.SetX(110)
pdf.SetFont "Arial","B",8
pdf.Cell 60,4,"Base Imponible Seg" & chr(250) & "n Al" & chr(237) & "cuota " & wPIM & "%:",0,0,"R",0
pdf.SetFont "Arial","",8
wC09 = wTC09 - wBPR
pdf.Cell 24,4,"" & formatnumber(wC09,2) & "",0,0,"R",0

pdf.SetY(230)
pdf.SetX(98)
wBIM = ((wTC09-wBPR) * wPIM) / 100
wC09 = wBIM	
pdf.SetFont "Arial","B",8
pdf.Cell 72,4,"Monto Total del Impuesto Seg" & chr(250) & "n Al" & chr(237) & "cuota " & wPIM & "%:",0,0,"R",0
pdf.SetFont "Arial","",8
pdf.Cell 24,4,"" & formatnumber(wC09,2) & "",0,0,"R",0


pdf.SetY(235)
pdf.SetX(110)
pdf.SetFont "Arial","B",8
pdf.Cell 60,4,"                     Monto Total de la Venta:",0,0,"R",0
pdf.SetFont "Arial","",8
wC09 = (wTC09-wBPR) + wBIM
pdf.Cell 24,4," " & formatnumber(wC09,2) & "",0,0,"R",0

pdf.SetY(240)
pdf.SetX(110)
pdf.SetFont "Arial","B",8
pdf.Cell 60,4,"                          75% I.V.A. Retenido:",0,0,"R",0
pdf.SetFont "Arial","",8
pdf.Cell 24,4,"0,00",0,0,"R",0

pdf.SetY(245)
pdf.SetX(110)
pdf.SetFont "Arial","B",8
pdf.Cell 60,4,"                                                 Saldo:",0,0,"R",0
wC09 = (wTC09-wBPR) + wBIM
pdf.Cell 24,4," " & formatnumber(wC09,2) & "",0,0,"R",0

pdf.SetY(245)
pdf.SetX(10)
pdf.SetFont "Arial","",8
pdf.MultiCell 150,4,"Son: " & ucase(CONVERTIR(wC09)) & "",0,1,"L",0

pdf.SetY(250)
pdf.SetX(10)
pdf.SetFont "Arial","B",6
pdf.Cell 28,4,"POR CADA CHEQUE DEVUELTO SE COBRARA BS. 30",0,0,"L",0
pdf.Ln()
pdf.Cell 28,4,"FAVOR DEPOSITAR O EMITIR CHEQUE 'NO ENDOSABLE' ",0,0,"L",0
pdf.Ln()
pdf.Cell 28,4,"A NOMBRE DE: CORPORACION VALPARTS, C.A.",0,0,"L",0
pdf.Ln()
pdf.Cell 28,4,"MERCANTIL CTA. CTE. 0105 0065 63 1065334982",0,0,"L",0
pdf.Ln()
pdf.Cell 28,4,"PROVINCIAL CTA. CTE. 0108 0334 94 0100108999",0,0,"L",0


pdf.SetY(250)
pdf.SetX(95)
pdf.SetFont "Arial","B",6
pdf.Cell 28,4,"LA EMPRESA NO SE HACE RESPONSABLE POR PAGOS EN EFECTIVO.",0,0,"L",0
pdf.Ln()
pdf.SetX(95)
pdf.Cell 28,4,"LA FACT NO SE CONSIDERA CANCELADA SI PAGADA EN EFECTIVO. ",0,0,"L",0
pdf.Ln()
pdf.SetX(95)
pdf.Cell 28,4,"NO SE ACEPTAN DEVOLUCIONES SI EL PRODUCTO Y/O EMPAQUE",0,0,"L",0
pdf.Ln()
pdf.SetX(95)
pdf.Cell 28,4,"ESTA EN MAL ESTADO. NO SE ACEPTAN RECLAMOS Y/O",0,0,"L",0
pdf.Ln()
pdf.SetX(95)
pdf.Cell 28,4,"DEVOLUCIONES DESPUES DE 46 HORAS (2 DIAS) DE LA ENTREGA.",0,0,"L",0

'Write Output
pdf.Output()

Response.write "</html>" 

%>