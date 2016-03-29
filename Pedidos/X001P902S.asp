<!--#include file="X001Z001.INC"-->
<%


wCLA001 = Request.QueryString("CLA001")
wCLA002 = Request.QueryString("CLA002")

wCCI = Session("glCiaInternet")
wCOD = wCLA001
wNPE = wCLA002
wOPE = Session("glCodVendedor")

wPUS = Session("glUsuario")

wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)


wCuenta = clng(TRIM(Request.Form("CUENTA")))

wIND = 1

wPUN = 1	
wPPR = 0
wBPR = 0

'strCnn	= Application("XDTA300_ConnectionString")
'Set XDTA300 = Server.CreateObject("ADODB.Connection")
'XDTA300.Open strCn



wErrPr = "N"	

'Response.write wCuenta

DO WHILE wIND < wCuenta

	wOBJ = right(("0000" & wIND),4)
	wNAMC = "C" & wOBJ
	wNAMD = "D" & wOBJ
	wNAMI = "I" & wOBJ
	wNAMP = "P" & wOBJ
	wNAMU = "U" & wOBJ
	
	wDES = "" : wPUN = 0 : wPPR = 0 : wBPR = 0 : wPIM = 0 : wERR = ""	
	
	wCPR = TRIM(Request.Form(wNAMI))
	wDEL = TRIM(Request.Form(wNAMD))
	wUVE = TRIM(Request.Form(wNAMC))
	wPUN = TRIM(Request.Form(wNAMU))
	wPIM = TRIM(Request.Form(wNAMP))	
	wUCA = 1
	
	
	IF wUVE <> "" then
	IF ISNUMERIC(wUVE) then

	IF cdbl(wUVE) > 0 then
		wREM = wUVE Mod wUCA
		
		'BuscarItemListaPrecio wCPR, wDES, wPUN, wPPR, wBPR, wPIM, wERR

		

							
		
		'BuscarItemListaPrecio wCPR, wDES, wPUN, wPPR, wBPR, wPIM, wERR
		'response.write wDEL & " - " & wPUN & " - " & wPPR & " - " & wCPR & " - " & wPIM & " - " & wERR
		
		strCnn	= Application("XDTA300_ConnectionString")
		wNRO = 0
		'Ubicar Correlativo de Pedido
		SQL = "SELECT ISNULL(MAX(CAST(P300101ITE AS FLOAT)),0) AS NRO FROM X300PF101 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300101CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300101NPE = '" & wCLA002 & "' "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		'RESPONSE.WRITE SQL
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wNRO = cdbl(rstQuery.Fields("NRO"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		wNRO = wNRO + 1
		'RESPONSE.WRITE wNRO

		
		
		IF wERR = "" THEN	
			'ActualizarItemPedido wB300101OPE, wB300101NPE, wCPR, wUVE, wPUN, wPPRF, wBPR, wPIM, wProceso
			
			SQL = "INSERT INTO X300PF101 (" 
			SQL = SQL & " P300101CCI, P300101CIA, P300101OPE, P300101NPE,"
			SQL = SQL & " P300101CPR, P300101UVE, P300101PUN, P300101PPR,"
			SQL = SQL & " P300101BPR, P300101PIM, P300101FAC, P300101ITE, "
			SQL = SQL & " P300101DEL, P300101PUS ) "
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & wCCI & "',"
			SQL = SQL & "'01',"
			SQL = SQL & "'" & wOPE & "',"
			SQL = SQL & "'" & wNPE & "',"
			SQL = SQL & "'" & wCPR & "',"
			SQL = SQL & "'" & fmtNumStr(wUVE) & "',"		
			SQL = SQL & "'" & fmtNumStr(wPUN) & "',"		
			SQL = SQL & "'0',"		
			SQL = SQL & "'0',"
			SQL = SQL & "'" & fmtNumStr(wPIM) & "',"
			SQL = SQL & "'" & wFECHA & "',  "	
			SQL = SQL & "'" & wNRO & "',"
			SQL = SQL & "'" & wDEL & "',"
			SQL = SQL & "'" & wPUS & "')"
			Set XDTA300 = Server.CreateObject("ADODB.Connection")
			XDTA300.Open strCnn
			'RESPONSE.WRITE SQL
			XDTA300.Execute SQL
			XDTA300.Close 
			SET XDTA300 = NOTHING	

		'End if 
		END IF	
		END IF	
		'END IF 
	  ELSE		
		wErrPr = "S"
		'BuscarItemListaPrecio wCPR, wDES, wPUN, wPPR, wBPR, wPIM, wERR
		wMensaje =  "(" & wCPR & " - " & wDES & "), Verifique las Cantidades ha ingresado un carácter no numérico (" & wUVE & ")"
	END IF
	END IF

	wIND = wIND + 1
LOOP

if wErrPr = "S" then
	Response.Write "</table>"
	%>	
	<P ALIGN="center">
	<b><font face="Tahoma" color="#FF0000" size="2"><%=wMensaje%></font></b></p>
<P ALIGN="center">
	&nbsp;<INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'></p>
	<%   	
end if

Function fmtNumStr(wMONTO)

	fmtNumStr = Replace(wMONTO, ",", ".") 

End Function


if wErrPr = "N" then
	'CalcularMontoPedido wB300101OPE, wB300101NPE
	
	SQL = " X300PX001 "
	SQL = SQL & "'" & wCCI & "', "
    SQL = SQL & "'01', "
    SQL = SQL & "'" & wOPE & "', "
    SQL = SQL & "'" & wNPE & "' "
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	XDTA300.Execute SQL
	XDTA300.Close 

	wURL = 	Session("glUrlBuscar")
	wURL = "X001P101.ASP?CLA001=" & wCLA001 & "&CLA002=" & wCLA002	
	Response.Redirect wURL
	'Response.write wURL
End if	


%><!--#include file="X001Y003.PRC"--><!--#include file="X001Y100.PRC"-->