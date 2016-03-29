SUB OpenDatabase(ByRef XDTA300)

	set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.ConnectionTimeout = 15
	XDTA300.CommandTimeout = 30
	StrCnn	= Application("XDTA300_ConnectionString")
	XDTA300.Open StrCnn
	
END SUB


Function VerificarAcceso(ByVal Usuario, ByVal Password)

	OpenDatabase XDTA300
	SQL = "X300AX001 '" & UCase(Usuario) & "', '" & UCase(Password) & "'"
	set Rs = XDTA300.Execute(SQL)
	wAcceso = Rs("ACESSO")
	wError = Rs("ERROR")
	Rs.close
	set Rs = Nothing
	
	Select Case wAcceso
		Case 1
			'Usuario Autorizado
			Response.Redirect "X001Z001F.HTM"
		Case 2
			'Usuario No Existe
			Response.Redirect "X001Z001I.HTM"
		Case 3
			'Clave Incorrecta
			Response.Redirect "X001Z001I.HTM"
		Case else
			'No controlado	
			Response.Redirect "X001Z001I.HTM"
	End Select

End Function