<!--#include file="X001Z001.INC"-->
<%


wCLA001 = Request.QueryString("CLA001")
wCLA002 = Request.QueryString("CLA002")

wB300101CCI = Session("glCiaInternet")
wB300101CIA = Session("glCia")
wB300101OPE = wCLA001
wB300101NPE = wCLA002


wCuenta = clng(TRIM(Request.Form("CUENTA")))

wIND = 1

wB300101PUN = 1	
wB300101PPR = 0
wB300101BPR = 0

'strCnn	= Application("XDTA300_ConnectionString")
'Set XDTA300 = Server.CreateObject("ADODB.Connection")
'XDTA300.Open strCn



wErrPr = "N"	

'Response.write wCuenta

DO WHILE wIND < wCuenta

	wOBJ = right(("0000" & wIND),4)
	wNAMC = "C" & wOBJ
	wNAMI = "I" & wOBJ
	wNAMP = "P" & wOBJ
	wNAMU = "U" & wOBJ
	
	wCPR = TRIM(Request.Form(wNAMI))
	wUVE = TRIM(Request.Form(wNAMC))
	wUCA = TRIM(Request.Form(wNAMU))
	wPPRF = TRIM(Request.Form(wNAMP))	
	
	
	IF wUVE <> "" then
	IF ISNUMERIC(wUVE) then

	IF cdbl(wUVE) > 0 then
		wREM = wUVE Mod wUCA
		
		BuscarItemListaPrecio wCPR, wDES, wPUN, wPPR, wBPR, wPIM, wERR

		If wREM <> 0 Then			
		   wErrPr = "S"	
		   wMensaje =  "(" & wCPR & " - " & wDES & "), La cantidad vendida debe ser multiplo del lote " & wUCA
		ELSE

		wDES = "" : wPUN = 0 : wPPR = 0 : wBPR = 0 : wPIM = 0 : wERR = ""						
		
		BuscarItemListaPrecio wCPR, wDES, wPUN, wPPR, wBPR, wPIM, wERR
		'response.write wDES & " - " & wPUN & " - " & wPPR & " - " & wBPR & " - " & wPIM & " - " & wERR
		
		strCnn	= Application("XDTA300_ConnectionString")
		SQL = " SELECT B300101CPR "
		SQL = SQL & " FROM X300BF101 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300101CCI ='" & wB300101CCI & "' AND "
		SQL = SQL & " B300101CIA ='" & wB300101CIA & "' AND "
		SQL = SQL & " B300101OPE ='" & wB300101OPE & "' AND "		
		SQL = SQL & " B300101NPE ='" & wB300101NPE & "' AND "		
		SQL = SQL & " B300101CPR ='" & wCPR & "' "		
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
			'wLIMI = cdbl(wPPR) -  2
			'wLIMS = cdbl(wPPR) 
			'wLIMS = cdbl(wPPR) +  2
			'wPPRO = cdbl(wPPRF)
			'IF wPPRO >= wLIMI AND  wPPRO <= wLIMS 	THEN
			'IF wPPRO <= wLIMS 	THEN	
				'If wExiste = "N" Then						
					ActualizarItemPedido wB300101OPE, wB300101NPE, wCPR, wUVE, wPUN, wPPRF, wBPR, wPIM, wProceso
				'End if 
			'  else
			'	if wErrPr = "N" then
			'		Response.Write "<table border=""1"" width=""90%"" align=""center"">"
			'		Response.Write "<tr>"
			'		Response.Write "<td align=""center"">Promocion Errada</td>"
			'		Response.Write "</tr>"
			'	end if	
			'	wDESERR = "Item: " & wCPR & "-" & wDES & " Promocion Valida (" & wLIMI & "-" & wLIMS & ")"
			'	Response.Write "<tr>"
			'	Response.Write "<td align=""center"">" & wDESERR & "</td>"
			'	Response.Write "</tr>"

				'Response.Write  "Item: " & wCPR & "-" & wDES & " Promocion (Valida: " & wLIMI & "-" & wLIMS & ")"
				'wErrPr = "S"
			'END IF	
			'Response.Write  wB300101OPE & "-" & wB300101NPE & "-" & wCPR & "-" & wUVE & "-" & wPUN & "-" & wPPR & "-" & wBPR & "-" & wPIM & "-" &  wProceso			
		END IF	
		END IF	
		END IF 
	  ELSE		
		wErrPr = "S"
		BuscarItemListaPrecio wCPR, wDES, wPUN, wPPR, wBPR, wPIM, wERR
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
	CalcularMontoPedido wB300101OPE, wB300101NPE
	wURL = 	Session("glUrlBuscar")
	'wURL = "X001A101_F.ASP?CAMC01=" & wB300101OPE & "&CAMC02=" & wB300101NPE & "&REG=S"	
	wURL = "X001A101_S.ASP?CLA001=" & wB300101OPE & "&CLA002=" & wB300101NPE & "&REG=S"		
	Response.Redirect wURL
	'Response.write wURL
End if	


%><!--#include file="X001Y003.PRC"--><!--#include file="X001Y100.PRC"-->