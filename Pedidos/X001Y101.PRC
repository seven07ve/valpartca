<%


Function ActualizarItemReclamo(wCCL, wCOD, wNFA, wCPR, wUVE, wTRE, wDEL, wAFP, wACC)

	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
	wPUS = Session("glUsuario")

	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	strCnn	= Application("XDTA300_ConnectionString")

	IF wACC = "Agregar" then
		SQL = "INSERT INTO X300EF002 (" 
		SQL = SQL & " E300002CCI, E300002CIA, E300002COD, E300002NFA, "
		SQL = SQL & " E300002CPR, E300002CAN, E300002TRE, E300002DEL, "
		SQL = SQL & " E300002AFP, E300002FPR )"
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & wCCI & "',"
		SQL = SQL & "'" & wCIA & "',"
		SQL = SQL & "'" & wCOD & "',"
		SQL = SQL & "'" & wNFA & "',"
		SQL = SQL & "'" & wCPR & "',"
		SQL = SQL & "'" & fmtNumStr(wUVE) & "',"		
		SQL = SQL & "'" & wTRE & "',"		
		SQL = SQL & "'" & wDEL & "',"		
		SQL = SQL & "'" & wAFP & "',"		
		SQL = SQL & "'" & wFECHA & "')  "	
	end if	
	IF wProceso = "Actualizar" or wProceso = "Eliminar" then
		if wProceso = "Eliminar" then
			SQL = "DELETE FROM X300EF002 " 
		   ELSE	
			SQL = "UPDATE X300EF002 SET " 
			SQL = SQL & " E300002CAN = '" & fmtNumStr(wUVE) & "', "
			SQL = SQL & " E300002TRE = '" & wTRE & "', "
			SQL = SQL & " E300002AFP = '" & wAFP & "', "
			SQL = SQL & " E300002FAC = '" & wFECHA & "'  "		
		END IF	
		SQL = SQL & " WHERE "		
		SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
		SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
		SQL = SQL & " E300002COD ='" & wCOD & "' AND "
		SQL = SQL & " E300002NFA ='" & wNFA & "' AND "
		SQL = SQL & " E300002CPR ='" & wCPR & "' "		
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




%>