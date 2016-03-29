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

Response.write "<html><head><title>" & "Cotización Nro. " & wCLA002 & "</title></head>"

wCCL = wCLA001: wRSO = ""
Session("glRSO") = wRSO 
wFPR = cdate(now)			
wBUL = "":	wNPE = "":	wMTO = "":	wFDE = now:	wGDE = "":	wNTR = ""
wFRC = now:	wOPE = "":	wPRE = "":	wCON = "": 	wCSE = "":	wPIM = "":	wRIF = "":	wTEL = ""		
wEMP = "":	wRIF = "":	wDIL = "":	wPAI = "":	wCIU = "":	wTEL = "":	wFAX = "":	wWEB = ""		
wEMA = "":	wOFI = "":	wTEO = "":	wTFA = "":	wFEC = "":	wRCL = "":	wDCL = "":	wTCL = ""
wECL = "":	wNDE = "":	wRDE = "":	wDDE = "":	wTDE = "":	wEDE = "":	wOCO = "":	wVEN = ""		
wCPA = "":	wMND = "":	wTER = "":	wEDE = "":	wFVE = "":	wPNT = "":	wPBR = ""

SQL = "SELECT Z300002DEL, Z300002RIF, Z300002TEL, Z300002DIL, Z300002WEB, Z300002PAI, "
SQL = SQL & " Z300002CIU "
SQL = SQL & " FROM X300ZF002 " 
SQL = SQL & " WHERE "
SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "'"
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
IF NOT rstQuery.EOF THEN
	wEMP = TRIM(rstQuery.Fields("Z300002DEL"))
	wRIF = TRIM(rstQuery.Fields("Z300002RIF"))
	wTEL = TRIM(rstQuery.Fields("Z300002TEL"))
	wDIL = TRIM(rstQuery.Fields("Z300002DIL"))
	wWEB = TRIM(rstQuery.Fields("Z300002WEB"))
	wPAI = TRIM(rstQuery.Fields("Z300002PAI"))
	wCIU = TRIM(rstQuery.Fields("Z300002CIU"))
END IF
rstQuery.Close 
set rstQuery = nothing

wTFA = "Cotización N°: " & wCLA002

IF wPAI = "VE" THEN
	wPAI = "Venezuela"
	wMND = "Bolivares"
END IF

IF wPAI = "CO" THEN
	wPAI = "Colombia"
	wMND = "Pesos"
END IF


IF wPAI = "EC" THEN
	wPAI = "Ecuador"
	wMND = "Dólar estadounidense"
END IF

SQL = "SELECT * "
SQL = SQL & " FROM X300PF001 WHERE "
SQL = SQL & " P300001CCI = '" & Session("glCiaInternet") & "' AND "
SQL = SQL & " P300001COD = '" & trim(wCLA001) & "' "
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
IF NOT rstQuery.EOF THEN
	wRSO = trim(rstQuery.Fields("P300001NOM"))
	wRCL = trim(rstQuery.Fields("P300001NIT"))
	wDCL = trim(rstQuery.Fields("P300001DEM"))
	wTCL = trim(rstQuery.Fields("P300001TEL"))
	wECL = trim(rstQuery.Fields("P300001EMA"))
END IF
rstQuery.Close 
set rstQuery = nothing


SQL = "SELECT * "
SQL = SQL & " FROM X300PF100 WHERE "
SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
SQL = SQL & " P300100CCL = '" & trim(wCLA001) & "' AND "
SQL = SQL & " P300100NPE = '" & trim(wCLA002) & "' "
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
IF NOT rstQuery.EOF THEN
	wFPA = trim(rstQuery.Fields("P300100FPA"))
	wP300100BAN = trim(rstQuery.Fields("P300100BAN"))
	wP300100MFA = trim(rstQuery.Fields("P300100MFA"))
	wP300100COP = trim(rstQuery.Fields("P300100COP"))
	wP300100CPE = trim(rstQuery.Fields("P300100CPE"))
	wBBR = cdbl(rstQuery.Fields("P300100BBR"))
	wBDP = cdbl(rstQuery.Fields("P300100BDP"))
	wMNE = cdbl(rstQuery.Fields("P300100MNE"))
	wBIV = cdbl(rstQuery.Fields("P300100BIV"))
	
	wPUS = trim(rstQuery.Fields("P300100PUS"))
	wCPE = trim(rstQuery.Fields("P300100CPE"))
	wFEC = trim(rstQuery.Fields("P300100FPR"))
END IF
rstQuery.Close 
set rstQuery = nothing

wTOT = wBIV + cdbl(wMNE)
wBBR = FormatNumber(wBBR,2)
wBDP = FormatNumber(wBDP,2)
wMNE = FormatNumber(wMNE,2)
wTOT2 = wTOT
wTOT = FormatNumber(wTOT,2)

SQL = " SELECT P300710DES "
SQL = SQL & " FROM X300PF710 " 																	
SQL = SQL & " WHERE "
SQL = SQL & " P300710CCI = '" & trim(Session("glCiaInternet")) & "' AND "
SQL = SQL & " P300710COD = '" & wFPA & "' "
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
IF NOT rstQuery.EOF THEN
	wFPA = trim(rstQuery.Fields("P300710DES"))
END IF
rstQuery.Close 
set rstQuery = nothing

SQL = " SELECT Z300001NUS "
SQL = SQL & " FROM X300ZF001 " 																	
SQL = SQL & " WHERE "
SQL = SQL & " Z300001CCI = '" & trim(Session("glCiaInternet")) & "' AND "
SQL = SQL & " Z300001PUS = '" & wPUS & "' "
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
IF NOT rstQuery.EOF THEN
	wNUS = trim(rstQuery.Fields("Z300001NUS"))
END IF
rstQuery.Close 
set rstQuery = nothing



wOBS = ""                  
wCON = ""
wSOM = ""
wIMPE = ""
wIMPI = ""




wFEC = Right("00" & day(wFEC),2) & "." & Right("00" & month(wFEC),2) & "." & year(wFEC)
wFVE = Right("00" & day(now),2) & "." & Right("00" & month(now),2) & "." & year(now)

Set pdf=CreateJsObject("FPDF")

pdf.CreatePDF "P", "mm", "A4"
pdf.SetPath("fpdf/")
pdf.SetFont "Arial","",16
pdf.SetSubject ("Cotización " & wCLA002)
pdf.SetTitle("Cotización " & wCLA002)
pdf.SetAuthor("Insystech, C.A.")
pdf.SetKeywords("Factura " & wCLA002)
pdf.SetCreator("Insystech, C.A.")
pdf.Open()
pdf.LoadModels("Cotizacion") ' il nome del modello è specificato senza estensione.
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
pdf.SetY(54)
'Create Header Cells
pdf.SetFillColor 192,192,190 

pdf.SetX(6)
pdf.MultiCell 30,3,"Referencia" & vbCrLf & "Reference",1,"C",true


pdf.SetY(54)
pdf.SetX(36)
pdf.MultiCell 80,3,"Descripción" & vbCrLf & "Description",1,"C",true

pdf.SetY(54)
pdf.SetX(114)
pdf.MultiCell 15,3,"Cantidad" & vbCrLf & "Quantity",1,"C",true

pdf.SetY(54)
pdf.SetX(129)
pdf.MultiCell 12,3,"Unidad" & vbCrLf & "Unit",1,"C",true

'pdf.SetY(54)
'pdf.SetX(121)
'pdf.MultiCell 20,3,"Descuento" & vbCrLf & "Discount",1,"C",true

pdf.SetY(54)
pdf.SetX(141)
pdf.MultiCell 15,6,"IVA",1,"C",true

pdf.SetY(54)
pdf.SetX(156)
pdf.MultiCell 23,3,"Valor Unitario" & vbCrLf & "Unit Value",1,"C",true

pdf.SetY(54)
pdf.SetX(179)
pdf.MultiCell 25,3,"Valor Total" & vbCrLf & "Total Value",1,"C",true


PDF.rect 6, 54, 198, 148 'dibujo rectangulo
'Set font for results
pdf.SetFont "Arial","",7

	SQL = " SELECT P300101CPR, P300101DEL, P300101UVE, P300101PUN, "
	SQL = SQL & " P300101MNE, P300101PIM,  (SELECT A300003UME FROM X300AF003 "
 	SQL = SQL & " WHERE A300003CCI = P300101CCI  AND A300003CPR = P300101CPR ) "
 	SQL = SQL & " AS P300101UME " 	
	SQL = SQL & " FROM X300PF101 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " P300101CCI ='" & wCCI & "' AND "
	SQL = SQL & " P300101NPE ='" & wCLA002 & "' "
	SQL = SQL & " ORDER BY P300101ITE " 	
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
	
	
		'wCL2 = trim(rstQuery.Fields("B300201NFA"))
		wDEL = trim(rstQuery.Fields("P300101DEL"))
		
		wC01 = TRIM(rstQuery.Fields("P300101CPR")) 
		wC02 = left(trim(rstQuery.Fields("P300101DEL")),35)
		wC03 = trim(rstQuery.Fields("P300101UVE"))
		wUNI = wC03
		wC05 = trim(rstQuery.Fields("p300101UME"))
		wC04 = trim(rstQuery.Fields("P300101PUN"))
		wC07 = trim(rstQuery.Fields("P300101PUN"))
		wPIM = trim(rstQuery.Fields("P300101PIM"))
		'wC08 = trim(rstQuery.Fields("B300201KIL"))
		wC09 = wC03 * wC07
		'wC06 = trim(rstQuery.Fields("B300201DEP"))
				
		IF isnull(wC03) then : wC03 = 0 :   end if	
		IF isnull(wC04) then : wC04 = 0 :   end if	
		
		
		IF isnull(wC07) then : wC07 = 0 :	end if	
		IF isnull(wC08) then : wC08 = 0 :	end if	
		IF isnull(wC09) then : wC09 = 0 :	end if			

		wTC03 = wTC03 + CDBL(wUNI)
		wTC08 = wTC08 + wC08
		wTC09 = wTC09 + wC09


		wC03 = formatnumber(wC03,2)
		wC04 = formatnumber(wC04,2)

		wPIM = formatnumber(wPIM,2)	
		wC06 = formatnumber(wC06,2)
		wC07 = formatnumber(wC07,2)				
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wC09,2)

		wCuenta = wCuenta + 1

		wITE = wCuenta
		pdf.SetX(6)
		pdf.Cell 30,4,"" & wC01 & "",1,0,"L",0
		pdf.Cell 78,4,"" & wDEL & "",1,0,"L",0
		pdf.Cell 15,4,"" & wC03 & "",1,0,"R",0
		pdf.Cell 12,4,"" & wC05 & "",1,0,"C",0
		'pdf.Cell 20,4,"" & wC06 & "",1,0,"R",0
		pdf.Cell 15,4,"" & wPIM & "",1,0,"R",0
		pdf.Cell 23,4,"" & wC07 & "",1,0,"R",0
		pdf.Cell 25,4,"" & wC09 & "",1,0,"R",0		
		pdf.Ln()
		
		rstQuery.MoveNext 
		
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wTC03 = formatnumber(wTC03,0) 


SQL = " SELECT Count(*) as CUENTA "
SQL = SQL & " FROM X300BF206 " 
SQL = SQL & " WHERE "
SQL = SQL & " B300206CCI ='" & wCCI & "' AND "
SQL = SQL & " B300206CIA ='" & wCIA & "' AND "
SQL = SQL & " B300206NFA ='" & wCLA002 & "' "	

'Response.Write SQL
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
'rstQueryData = rstQuery.GetRows 
wCuenta = 0
pdf.SetFont "Arial","B",7
IF NOT rstQuery.EOF THEN

	wCNT = CDBL(trim(rstQuery.Fields("CUENTA")))

END IF
rstQuery.CLOSE
SET rstQuery = NOTHING

wMSU  = 0
SQL = " SELECT B300206DSU, B300206MSU "
SQL = SQL & " FROM X300BF206 " 
SQL = SQL & " WHERE "
SQL = SQL & " B300206CCI ='" & wCCI & "' AND "
SQL = SQL & " B300206CIA ='" & wCIA & "' AND "
SQL = SQL & " B300206NFA ='" & wCLA002 & "' "	
SQL = SQL & " ORDER BY B300206LIN " 	
'Response.Write SQL
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
'rstQueryData = rstQuery.GetRows 
wCuenta = 0
pdf.SetFont "Arial","B",7
DO WHILE NOT rstQuery.EOF

	wDSU = trim(rstQuery.Fields("B300206DSU")) 
	wMSU = trim(rstQuery.Fields("B300206MSU")) 

	wCuenta = wCuenta + 1

	IF wCNT = wCuenta THEN
		pdf.SetFont "Arial","B",10
	END IF  

	pdf.Cell 160,4,wDSU,0,0,"R",0
	pdf.Cell 34,4,"" & formatnumber(wMSU,2) & "",0,0,"R",0
	pdf.Ln()

	
	
	rstQuery.MoveNext 	
LOOP
rstQuery.CLOSE
SET rstQuery = NOTHING

wMSU = Replace(wMSU, "-", "")
  

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