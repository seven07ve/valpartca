<!--#include file="X001Y001.PRC"-->

<%



wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCLA001 = TRIM(Request.QueryString("CLA001"))
wCLA002 = TRIM(Request.QueryString("CLA002"))

wSTSPED = TRIM(Request.QueryString("STSPED"))


strCnn	= Application("XDTA300_ConnectionString")
	
SQL = "SELECT B300100SPP, B300100MNE, B300100CCL " 
SQL = SQL & " FROM X300BF100 WHERE "
SQL = SQL & " B300100OPE = '" &  wCLA001 & "' AND "	
SQL = SQL & " B300100NPE = '" &  wCLA002 & "' "	
Set rstQuery = Server.CreateObject("ADODB.Recordset")
   rstQuery.Open sql , strCnn
IF NOT rstQuery.EOF THEN
	wSPP = trim(rstQuery.Fields("B300100SPP"))
	wMNE = trim(rstQuery.Fields("B300100MNE"))
	wCCL = trim(rstQuery.Fields("B300100CCL"))
END IF
rstQuery.Close 
set rstQuery = nothing

'response.write wSTSPED
wNOMCLI = TRIM(Request.QueryString("NOMCLI"))

wNOMCLI = BuscarClientePedido ( wCLA001, wCLA002 )
wNOMCLI = replace(wNOMCLI, chr(34), " ")
wNOMCLI = replace(wNOMCLI, "'", " ")
wNOMCLI = replace(wNOMCLI, chr(35), " ") 


Session("glError") = "N"

If wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

'IF wSTSPED = "0" THEN
	wPAR = "TITULO=Oportunidad " & wCLA002 & " de ("  & wCCL & " - " & replace(wNOMCLI,"&", " ")  & ")"
'	ELSE
'	wPAR = "TITULO=Oportunidad " & "101121" & cdbl(wCLA002) & " de "  &  wNOMCLI 
'END IF
wPAR = wPAR & "&CAMC01=" & wCLA001
wPAR = wPAR & "&CAMC02=" & wCLA002
wPAR = wPAR & "&URLACT=X001A101_A.ASP" 		

'Response.write wPAR

wURL = "X001P101_F.ASP?" & wPAR

 
Response.Redirect wURL

%>		
