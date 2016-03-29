<%


Function ActualizarItemPedido(wOPE, wNPE, wCPR, wUVE, wPUN, wPPR, wBPR, wPIM, wACC)

	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
	wPUS = Session("glUsuario")

	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	strCnn	= Application("XDTA300_ConnectionString")

	IF wACC = "Agregar" then
		SQL = "INSERT INTO X300BF101 (" 
		SQL = SQL & " B300101CCI, B300101CIA, B300101OPE, B300101NPE,"
		SQL = SQL & " B300101CPR, B300101UVE, B300101PUN, B300101PPR,"
		SQL = SQL & " B300101BPR, B300101PIM, B300101FAC)"
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & wCCI & "',"
		SQL = SQL & "'" & wCIA & "',"
		SQL = SQL & "'" & wOPE & "',"
		SQL = SQL & "'" & wNPE & "',"
		SQL = SQL & "'" & wCPR & "',"
		SQL = SQL & "'" & fmtNumStr(wUVE) & "',"		
		SQL = SQL & "'" & fmtNumStr(wPUN) & "',"		
		SQL = SQL & "'" & fmtNumStr(wPPR) & "',"		'Session("glPPP")
		SQL = SQL & "'" & fmtNumStr(wBPR) & "',"
		SQL = SQL & "'" & fmtNumStr(wPIM) & "',"
		SQL = SQL & "'" & wFECHA & "')  "	
		'SQL = SQL & " WHERE (B300101CCI + B300101CIA + B300101OPE + B300101NPE + B300101CPR) "
		'SQL = SQL & " NOT IN (SELECT (B300101CCI + B300101CIA + B300101OPE + B300101NPE + B300101CPR) "
		'SQL = SQL & " FROM X300BF101)) "			
	end if	
	IF wProceso = "Actualizar" or wProceso = "Eliminar" then
		if wProceso = "Eliminar" then
			SQL = "DELETE FROM X300BF101 " 
		   ELSE	
			SQL = "UPDATE X300BF101 SET " 
			SQL = SQL & " B300101UVE = '" & fmtNumStr(wUVE) & "', "
			SQL = SQL & " B300101PUN = '" & fmtNumStr(wPUN) & "', "
			SQL = SQL & " B300101PPR = '" & fmtNumStr(wPPR) & "', " 'Session("glPPP")
			SQL = SQL & " B300101BPR = '" & fmtNumStr(wBPR) & "', "
			SQL = SQL & " B300101PIM = '" & fmtNumStr(wPIM) & "', "
			SQL = SQL & " B300101FAC = '" & wFECHA & "'  "		
		END IF	
		SQL = SQL & " WHERE "		
		SQL = SQL & " B300101CCI ='" & wCCI & "' AND "
		SQL = SQL & " B300101CIA ='" & wCIA & "' AND "
		SQL = SQL & " B300101OPE ='" & wOPE & "' AND "
		SQL = SQL & " B300101NPE ='" & wNPE & "' AND "
		SQL = SQL & " B300101CPR ='" & wCPR & "' "		
	END IF

	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	'RESPONSE.WRITE SQL
	XDTA300.Execute SQL
	XDTA300.Close 
	SET XDTA300 = NOTHING	

	
End Function

Function fmtNumStr(wMONTO)

	fmtNumStr = Replace(wMONTO, ",", ".") 

End Function



Function CalcularMontoPedido(wOPE, wNPE)

	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")

	strCnn	= Application("XDTA300_ConnectionString")

    SQL = " X300AX001 "
    SQL = SQL & "'" & wCCI & "', "
    SQL = SQL & "'" & wCIA & "', "
    SQL = SQL & "'" & wOPE & "', "
    SQL = SQL & "'" & wNPE & "' "
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	XDTA300.Execute SQL
	XDTA300.Close 

End Function

%>