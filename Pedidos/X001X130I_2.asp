<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

<!--#include file="fpdf.asp"-->
<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y007.PRC"-->
<!--#include file="X001Z900.INC"-->

<%
response.Clear
strCnn	= Application("XDTA300_ConnectionString")

wCLA001 = Request.QueryString("CLA001")
wCLA002 = Request.QueryString("CLA002")
wCCI = Session("glCiaInternet")
wCIA = Session("glCia")

Datos_Compania wDEL, wURI	

wURI = Replace(wURI, "..", "")

Response.write "<html><head><title>" & "Factura Nro. " & wCLA002 & "</title></head>"

SQL = "SELECT B300200CCL, B300200RSO, B300200FDD, B300200BUL, B300200NPE, B300200MNE, B300200BIV, "
SQL = SQL & " B300200MTO, B300200FDE, B300200GDE, B300200NTR, B300200FRC, B300200OPE, B300200OCO, " 		
SQL = SQL & " B300200CON, B300200PRE, B300200PIM, B300200RCL, B300200TCL, B300200EMP, B300200RIF, "
SQL = SQL & " B300200DIL, B300200PAI, B300200CIU, B300200TEL, B300200FAX, B300200WEB, B300200EMA, "
SQL = SQL & " B300200OFI, B300200TEO, B300200TFA, B300200FEC, B300200RCL, B300200DCL, B300200TCL, "
SQL = SQL & " B300200ECL, B300200NDE, B300200RDE, B300200DDE, B300200TDE, B300200EDE, B300200OCO, "
SQL = SQL & " B300200VEN, B300200CPA, B300200MND, B300200TER, B300200FVE, B300200PNT, B300200PBR "
SQL = SQL & " FROM X300BF200 " 
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
	wRSO = trim(rstQuery.Fields("B300200RSO"))
	Session("glRSO") = wRSO 
	wFPR = trim(rstQuery.Fields("B300200FDD"))			
	wBUL = trim(rstQuery.Fields("B300200BUL"))
	wNPE = trim(rstQuery.Fields("B300200NPE"))			
	wMNE = trim(rstQuery.Fields("B300200MNE"))
	wBIV = trim(rstQuery.Fields("B300200BIV"))			
	wMTO = trim(rstQuery.Fields("B300200MTO"))			
	wFDE = now
	wGDE = trim(rstQuery.Fields("B300200GDE"))			
	wNTR = trim(rstQuery.Fields("B300200NTR"))
	wFRC = now
	wOPE = trim(rstQuery.Fields("B300200OPE"))	
	wPRE = trim(rstQuery.Fields("B300200PRE"))	
	wCON = trim(rstQuery.Fields("B300200CON"))
	wCSE = trim(rstQuery.Fields("B300200OCO"))
	wPIM = trim(rstQuery.Fields("B300200PIM"))
	wRIF = "890-901-866-7 PRODUCTOR"
	wTEL = "(57-4) 36040 40"
	wFAX = "(57-4) 2557279"
	wEMP = "BONEM"
	wDIL = "Calle 6 Sur No. 50 C - 104"
	wPAI = "H"
	wCIU = "RÉGIMEN COMÚN 11-0051-08"
	wWEB = "AUTORETENEDORES RES. 847 JUNIO 10/86"
	wEMA = "GRANDES CONTRIBUYENTES"
	wOFI = "BONEM S.A. ES RETENEDOR DE IVA ART. 9 LEY 223 DIC DE 1995"
	wTEO = " "
	wTFA = "FACTURA DE VENTA / INVOICE No. " & wCLA002 
	wFEC = trim(rstQuery.Fields("B300200FEC"))		
	wRCL = trim(rstQuery.Fields("B300200RCL"))		
	wDCL = left(trim(rstQuery.Fields("B300200DCL")),48)		
	wTCL = trim(rstQuery.Fields("B300200TCL"))		
	wECL = trim(rstQuery.Fields("B300200ECL"))
	wNDE = trim(rstQuery.Fields("B300200NDE"))
	wRDE = trim(rstQuery.Fields("B300200RDE"))
	wDDE = left(trim(rstQuery.Fields("B300200DDE")),48)		
	wTDE = trim(rstQuery.Fields("B300200TDE"))		
	wEDE = trim(rstQuery.Fields("B300200EDE"))
	wOCO = " "
	wVEN = " "
	wCPA = " "
	wMND = "PESOS "
	wTER = trim(rstQuery.Fields("B300200TER"))		
	wEDE = trim(rstQuery.Fields("B300200EDE"))		
	wFVE = trim(rstQuery.Fields("B300200FVE"))	
	wPNT = 0
	wPBR = 0
END IF 
rstQuery.CLOSE
SET rstQuery = NOTHING	

 


	
wOBS = " "                       
'wCON = " "
wSOM = " "
wIMPE = " "
wIMPI = " "

wDIA = Right("00" & day(wFPR),2)
wMES = Right("00" & month(wFPR),2)
wANO = "" & year(wFPR)

wFVE = Right("00" & day(wFVE),2) & "." & Right("00" & month(wFVE),2) & "." & year(wFVE)

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
pdf.LoadModels("Factura_BON") ' il nome del modello è specificato senza estensione.
pdf.AddPage()

'pdf.CreatePDF()
'pdf.SetPath("fpdf/")
'pdf.SetSubject ("Results")
'pdf.SetTitle("Results")
'pdf.SetLeftMargin(40)
'pdf.Open()
'pdf.AddPage()


	
%>

<%
'Set table header font
pdf.SetFont "Arial","B",7
pdf.SetY(96)
'Create Header Cells
pdf.SetFillColor 255,255,255

pdf.SetY(86)
pdf.SetX(6)
pdf.MultiCell 30,3,"Pedido " & vbCrLf &  "Order No.",0,"L",true

pdf.SetY(86)
pdf.SetX(36)
pdf.MultiCell 30,3,"Referencia No. " & vbCrLf & "Reference No.",0,"L",true

pdf.SetY(86)
pdf.SetX(66)
pdf.MultiCell 70,3,"Descripción" & vbCrLf & "Description",0,"C",true

pdf.SetY(86)
pdf.SetX(136)
pdf.MultiCell 15,3,"Cantidad" & vbCrLf & "Quantity",0,"C",true

pdf.SetY(86)
pdf.SetX(150)
pdf.MultiCell 20,3,"Valor Unitario" & vbCrLf & "Unit Price",0,"C",true

pdf.SetY(86)
pdf.SetX(170)
pdf.MultiCell 20,3,"Valor Total Amount" & vbCrLf ,0,"C",true

pdf.SetY(86)
pdf.SetX(189)
pdf.MultiCell 15,3,"% IVA" & vbCrLf & " ",0,"C",true



'Set font for results
pdf.SetFont "Arial","",7

	SQL = " SELECT B300201NPE, B300201CPR, B300201DEL, B300201UDE, B300201PFI, "
	SQL = SQL & " B300201PLI, B300201MNE, B300201NFA, B300201PIM, " 
	SQL = SQL & " B300201DEP, B300201PRD, B300201DPP, B300201NRB " 
	SQL = SQL & " FROM X300BF201 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300201CCI ='" & wCCI & "' AND "
	SQL = SQL & " B300201CIA ='" & wCIA & "' AND "	
	SQL = SQL & " B300201NFA ='" & wCLA002 & "' "
	'SQL = SQL & " B300201NFA IN ('421041','421055','420640','420614', '417253','421271','421070') "
	SQL = SQL & " ORDER BY B300201ITE " 	
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
	wTBIV = 0
	wARA = 92
	DO WHILE NOT rstQuery.EOF
	
	
		wCL2 = trim(rstQuery.Fields("B300201NFA"))
		wDEL = trim(rstQuery.Fields("B300201DEL"))
		
		wNPE = TRIM(rstQuery.Fields("B300201NPE")) 
		wC01 = TRIM(rstQuery.Fields("B300201CPR")) 
		wC02 = left(trim(rstQuery.Fields("B300201DEL")),55)
		wC03 = trim(rstQuery.Fields("B300201UDE"))
		wUNI = wC03
		wC05 = trim(rstQuery.Fields("B300201NRB"))
		wC04 = trim(rstQuery.Fields("B300201PLI"))
		wC07 = trim(rstQuery.Fields("B300201PFI"))
		wPIM = trim(rstQuery.Fields("B300201PIM"))
		'wC08 = trim(rstQuery.Fields("B300201KIL"))
		wC09 = wC03 * wC07
		wC06 = trim(rstQuery.Fields("B300201DEP"))
				
		IF isnull(wC03) then : wC03 = 0 :   end if	
		IF isnull(wC04) then : wC04 = 0 :   end if	
		
		
		IF isnull(wC07) then : wC07 = 0 :	end if	
		IF isnull(wC08) then : wC08 = 0 :	end if	
		IF isnull(wC09) then : wC09 = 0 :	end if		
		
		wBIV = wC09	* (wPIM/100) 

		wTC03 = wTC03 + CDBL(wUNI)
		wTC08 = wTC08 + wC08
		wTBIV = wTBIV + wBIV
		wTC09 = wTC09 + wC09


		wC03 = formatnumber(wC03,0)
		wC04 = formatnumber(wC04,0)

		wPIM = formatnumber(wPIM,0)	
		wC06 = formatnumber(wC06,0)
		wC07 = formatnumber(wC07,0)				
		wC08 = formatnumber(wC08,0)
		wC09 = formatnumber(wC09,0)

		wCuenta = wCuenta + 1

		wITE = wCuenta
		pdf.SetX(6)
		pdf.Cell 30,4,"" & wNPE & "",0,0,"L",0
		pdf.Cell 30,4,"" & wC01 & "",0,0,"L",0
		pdf.Cell 70,4,"" & wDEL & "",0,0,"L",0
		pdf.Cell 15,4,"" & wC03 & "",0,0,"R",0
		pdf.Cell 20,4,"" & wC07 & "",0,0,"C",0
		pdf.Cell 20,4,"" & wC09 & "",0,0,"R",0
		pdf.Cell 15,4,"" & wPIM & "%",0,0,"C",0
		pdf.Ln()
		
		wARA = wARA + 4
		rstQuery.MoveNext 
		
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wTC03 = formatnumber(wTC03,0) 

PDF.rect 7, wARA, 195, 0'dibujo rectangulo

pdf.SetX(6)
pdf.Cell 135,4,"Esta factura es emitida en: Medellin",0,0,"L",0
pdf.Cell 30,4,"Total",0,0,"R",0
pdf.Cell 20,4,"" & formatnumber(wTC09,0) & "",0,0,"R",0
pdf.Ln()

pdf.SetX(6)
pdf.Cell 135,4,"Facturación autorizada por la DIAN Resolución # 110000526532 de 2013/04/10 del # 272155 al #298287",0,0,"L",0
pdf.Cell 30,4,"I.V.A",0,0,"R",0
pdf.Cell 20,4,"" & formatnumber(wTBIV,0) & "",0,0,"R",0
pdf.Ln()

pdf.SetX(6)
pdf.Cell 135,4,"Paguese unicamente con cheque a favor de Bonem S.A. y sello restrictivo al primer beneficiario",0,0,"L",0
pdf.Cell 30,4,"",0,0,"R",0
pdf.Cell 20,4," ",0,0,"R",0
pdf.Ln()


pdf.SetX(6)
pdf.Cell 135,4,"Consigne unicamente en cuenta corriente No. 00190186608 de Bancolombia y envie la consignación por Fax a: (574) 2557279",0,0,"L",0
pdf.SetFont "Arial","B",7
pdf.Cell 30,4,"Valor Factura",0,0,"R",0
pdf.Cell 20,4,"" & formatnumber(wTBIV+wTC09,0) & "",0,0,"R",0
pdf.Ln()


'RESPONSE.WRITE wCNT & "-" & wCuenta

''''''''''''''''''''''''''''''''''''''''''''''''''
'pdf.AddPage()
'PDF.rect 6, 64, 198, 125 'dibujo rectangulo
'''''''''''''''''''''''''''''''''''''''''''''''''



'pdf.SetFont "courier","",7
'pdf.Cell 160,4,"SUB-TOTAL",0,0,"R",0
'wC09 = wTC09
'pdf.Cell 20,4,"" & formatnumber(wC09,2) & "",0,0,"R",0
'pdf.Ln()
'wBIM = (wTC09 * wPIM) / 100
'wC09 = wBIM		
'pdf.Cell 160,4,"I.V.A. (" & wPIM & "%)",0,0,"R",0
''pdf.Cell 20,4,"" & formatnumber(wC09,2) & "",0,0,"R",0
'pdf.Ln()
'pdf.Ln()
'wC09 = wTC09 + wBIM
'pdf.Cell 160,4,"TOTAL",0,0,"R",0
''pdf.Cell 20,4,"" & formatnumber(wC09,2) & "",0,0,"R",0
'pdf.Ln()

'Write Output
pdf.Output()


'dim fs
'set fs=Server.CreateObject("Scripting.FileSystemObject")
'if fs.FileExists("C:\inetpub\wwwroot\aspx\Imagenes\Logos\INC_INC_LOGOINCOLBEST.png")=true then
  'response.write("File c:\asp\image.jpg exists!")
'else
'  response.write("File c:\asp\image.jpg does not exist!")
'end if
'set fs=nothing
'Response.write Server.MapPath("carvica.jpg")

Response.write "</html>" 



%>