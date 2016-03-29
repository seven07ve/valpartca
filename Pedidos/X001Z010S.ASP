<%


wCIA = TRIM(Request.Form("CIA"))
wCIA = "CARVICA"
wUSUARIO = TRIM(Request.Form("LOGIN"))
wPASSWORD = TRIM(Request.Form("PASSWORD"))
wPASSWORDN = TRIM(Request.Form("PASSWORDN"))
wPASSWORDNN = TRIM(Request.Form("PASSWORDNN"))




IF wPASSWORDN <> wPASSWORDNN THEN

	response.redirect "X001Z010.ASP"
	
  ELSE
  
	CambiarClave wCIA, wUSUARIO, wPASSWORD, wPASSWORDN

END IF	

SUB OpenDatabase(ByRef XDTA300)

	set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.ConnectionTimeout = 15
	XDTA300.CommandTimeout = 30
	StrCnn	= Application("XDTA300_ConnectionString")
	XDTA300.Open StrCnn
	
END SUB

Function CambiarClave(ByVal Cia, ByVal Usuario, ByVal Password, ByVal Passwordn)

IF Session("glConexion") = "SQL" then

	OpenDatabase XDTA300
	SQL = "X300ZX002 '" & UCase(Cia) & "', '" & UCase(Usuario) & "', '" & UCase(Password) & "', '" & UCase(Passwordn) & "'"
	set Rs = XDTA300.Execute(SQL)
		wAcceso = Rs("ACCESO")
		wError = Rs("ERROR")	
	Rs.close
	set Rs = Nothing
	
	'Response.Write wAcceso
	Select Case wAcceso
		Case 1
			'Usuario Autorizado			
			Response.Redirect "DEFAULTB.ASP"
		Case 2
			'Usuario No Existe			
			response.write "<script>"			
				response.write "alert(""Usuario No Existe"");"				 
				response.write "history.back()"				 
			response.write "</script>" 
		Case 3
			'Clave Incorrecta			
			response.write "<script>"			
				response.write "alert(""Clave Incorrecta"");"				 
				response.write "history.back()"				 
			response.write "</script>" 
		Case else
			'No controlado	
			Response.write "Falla"
	End Select

END IF  

End Function



%>
