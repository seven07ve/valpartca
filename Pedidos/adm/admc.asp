<%

'wCIA = TRIM(Request.Form("CIA"))
wCIA = "CARVICA" 
wUSUARIO = TRIM(Request.Form("LOGIN"))
wPASSWORD = TRIM(Request.Form("PASSWORD"))


'response.write "Conexion" & Application("XDTA300_ConnectionString")

VerificarAcceso wCIA, wUSUARIO, wPASSWORD


SUB OpenDatabase(ByRef XDTA300)

	set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.ConnectionTimeout = 15
	XDTA300.CommandTimeout = 30
	StrCnn	= Application("XDTA300_ConnectionString")
	XDTA300.Open StrCnn
	
END SUB


Function VerificarAcceso(ByVal Cia, ByVal Usuario, ByVal Password)



	IF Session("glConexion") = "SQL" then
		OpenDatabase XDTA300
		SQL = "X300ZX001 '" & UCase(Cia) & "', '" & UCase(Usuario) & "', '" & UCase(Password) & "'"

		set Rs = XDTA300.Execute(SQL)
		wAcceso = Rs("ACCESO")
		wError = Rs("ERROR")
		Response.Write Cia & Usuario & Password
			
		Rs.close
		set Rs = Nothing
	    Response.Write wAcceso
		Select Case wAcceso
			Case 1
				'Usuario Autorizado
				Session("glUsuario") = UCase(Usuario)
				Session("glCiaInternet") = UCase(Cia)
				'server.transfer("X001Z002F.ASP")
				'Response.Write "Usuario Autorizado"
				Session("glAutorizacion") = ""
				Response.Redirect "X010Z300S.ASP"
				'Response.Redirect "X001Z002F.ASP"
			Case 2
				'Usuario No Existe
				'Response.Write "Usuario No existe"
				'Response.Redirect "ADM/DEFAULT.ASP"
				Session("glAutorizacion") = "UNE"
				Response.Redirect "ADM.ASP"
			Case 3
				'Clave Incorrecta
				'Response.Redirect "ADM/DEFAULT.ASP"
				'Response.Write "Clave Incorrecta"
				Session("glAutorizacion") = "CI"
				Response.Redirect "ADM.ASP"
			Case 4
				'Clave Incorrecta
				'Response.Redirect "ADM/DEFAULT.ASP"
				Session("glAutorizacion") = "UNA"
				Response.Redirect "ADM.ASP"
				'Response.Write "Usuario no Autorizado"	
			Case else
				'No controlado					
				Session("glAutorizacion") = "UNA"
				Response.Redirect "ADM.ASP"
				'Response.Write "No Controlado"
		End Select
		
	ELSE

		'Conectado via Access
		'Usuario Autorizado
		Session("glUsuario") = UCase(Usuario)
		Session("glCiaInternet") = UCase(Cia)
		'server.transfer("X001Z002F.ASP")
		Response.Redirect "X001Z002F.ASP"

	END IF		

End Function


%>