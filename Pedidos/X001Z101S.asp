<!--#include file="X001Z001.INC"-->
<%


wCLA001 = Request.QueryString("CLA001")
wCLA002 = Request.QueryString("CLA002")
wSTSPED = Request.QueryString("STSPED")

wCCI = Session("glCiaInternet")
wCIA = Session("glCia")


wCuenta = clng(TRIM(Request.Form("CUENTA")))

wIND = 1


'strCnn	= Application("XDTA300_ConnectionString")
'Set XDTA300 = Server.CreateObject("ADODB.Connection")
'XDTA300.Open strCn



wErrPr = "N"	

'Response.write wCuenta

DO WHILE wIND < wCuenta

	wOBJ = right(("0000" & wIND),4)
	wNAMC = "C" & wOBJ
	wNAMI = "I" & wOBJ
	wNAMF = "F" & wOBJ
	wNAMU = "U" & wOBJ
	wNAMM = "M" & wOBJ
	wNAMD = "D" & wOBJ
	wNAMP = "P" & wOBJ
	
	wCPR = TRIM(Request.Form(wNAMI))
	wUVE = TRIM(Request.Form(wNAMC))
	wUCA = TRIM(Request.Form(wNAMU))
	wNFA = TRIM(Request.Form(wNAMF))	
	wTRE = TRIM(Request.Form(wNAMM))
	wDEL = TRIM(Request.Form(wNAMD))
	wAFP = TRIM(Request.Form(wNAMP))
	
	'Response.write wUVE
	
	IF wUVE <> "" then
	IF ISNUMERIC(wUVE) then

	IF cdbl(wUVE) > 0 then

		


		'If wREM <> 0 Then			
		'   wErrPr = "S"	
		'   wMensaje =  "(" & wCPR & " - " & wDES & "), La cantidad vendida debe ser multiplo del lote " & wUCA
		'ELSE

	
		
		
		strCnn	= Application("XDTA300_ConnectionString")
		SQL = " SELECT E300002CPR "
		SQL = SQL & " FROM X300EF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
		SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
		SQL = SQL & " E300002COD ='" & wCLA002 & "' AND "
		SQL = SQL & " E300002NFA ='" & wNFA & "' AND "		
		SQL = SQL & " E300002CPR ='" & wCPR & "' "		
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
		If Not rstQuery.EOF Then
			'wExiste = "S"
			 wProceso = "Actualizar"
		  Else
			'wExiste = "N"
			 wProceso = "Agregar"
		End If
		rstQuery.CLOSE
		SET rstQuery = NOTHING	

		
		IF wERR = "" THEN			
			ActualizarItemReclamo wCLA001, wCLA002, wNFA, wCPR, wUVE, wTRE, wDEL, wAFP, wProceso
		END IF	
		END IF	
		'END IF 
	  ELSE		
		wErrPr = "S"
		
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


if wErrPr = "N" then
	
	
	wURL = "X001A115_S.ASP?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 & "&REG=S"		
	wURL = wURL & "&STSPED=" & wSTSPED
	Response.Redirect wURL
	'Response.write wURL
End if	


%><!--#include file="X001Y101.PRC"-->