<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"


wCIA = TRIM(Request.Form("CIA"))
wUSUARIO = Injection(TRIM(Request.Form("LOGIN")))
wPASSWORD = Injection(TRIM(Request.Form("PASSWORD")))



VerificarAcceso wCIA, wUSUARIO, wPASSWORD


SUB OpenDatabase(ByRef XDTA300)

	set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.ConnectionTimeout = 15
	XDTA300.CommandTimeout = 30
	StrCnn	= Application("XDTA300_ConnectionString")
	XDTA300.Open StrCnn
	
	
END SUB

Function Injection(ByVal wSTR)

	wSTR = Replace(wSTR, "'", "")
	wSTR = Replace(wSTR, "delete", "")	
	wSTR = Replace(wSTR, " ", "")	
	wSTR = Replace(wSTR, "insert", "")
	wSTR = Replace(wSTR, "select", "")
	
	Injection = wSTR

End Function


Function VerificarAcceso(ByVal Cia, ByVal Usuario, ByVal Password)



	IF Session("glConexion") = "SQL" then
		OpenDatabase XDTA300
		SQL = "X300ZX001 '" & UCase(Cia) & "', '" & UCase(Usuario) & "', '" & UCase(Password) & "'"
	    set Rs = XDTA300.Execute(SQL)
		wAcceso = Rs("ACCESO")
		wError = Rs("ERROR")
		Rs.close
		set Rs = Nothing
		
		wUsuario = UCase(Usuario)
		wClave = UCase(Password)
		If wAcceso = "1" Then
			Call Ubicar_Ultima_Fecha_Acceso(UCase(Cia), wUsuario)
		End If
		Call Registrar_Acceso(UCase(Cia), wAcceso, wError, wUsuario, wClave)
		
		Response.write "<script language=""javascript"">"
		Select Case wAcceso
			Case 1
				Session("glUsuario") = UCase(Usuario)
				Session("glCiaInternet") = UCase(Cia)
				Call Cargar_Informacion()
			Case 2
				'Usuario No Existe
				Session("glAutorizacion") = "UNE"
				Session.Abandon
				Response.write "alert('Usuario No Existe');"
				Response.write "window.open('../?q=" & UCase(Cia) & "','_parent');"
				'Response.Redirect "../"
			Case 3
				'Clave Incorrecta
				Session("glAutorizacion") = "CI"
				Session.Abandon
				Response.write "alert('Clave Incorrecta');"
				Response.write "window.open('../?q=" & UCase(Cia) & "','_parent');"
				'Response.Redirect "../"
			Case 4
				'Usuario Inactivo
				Session("glAutorizacion") = "UI"
				Session.Abandon
				Response.write "alert('Su Usuario se encuentra Inactivo, \n debe contactar al Dpto. de Atencin al Cliente');"
				Response.write "window.open('../?q=" & UCase(Cia) & "','_parent');"
				'Response.Redirect "../"					
			Case else
				'No controlado
				Session("glAutorizacion") = "UNA"	
				Response.Redirect "../?q=" & UCase(Cia) 
		End Select
		
		Response.write "</script>"
	
	END IF		

End Function


Sub Cargar_Informacion()

	Session("glRegistros") = 15
	Session("glBusqueda") = ""
	Session("glUrlBuscar") = ""
	Session("glTipoUsuario") = ""
	Session("glMensajeError") = ""
	Session("glAgregar") = ""
	Session("glCodVendedor") = ""
	Session("glCia") = ""
	Session("glCus") = ""
	Session("glNombreCiaInternet") = ""	
	Session("glUsuarioNombre") = ""
	Session("glTamano") = "780" '580 760
	Session("glUrlBuscarDetalle")	= ""
	Session("glUrlRegresar")	= ""	

	Response.Cookies("CAR").Expires = Date + 2
	Response.Cookies("CAR")("CiaInternet") = Session("glCiaInternet")
	Response.Cookies("CAR")("Usuario") = Session("glUsuario")
	Response.Cookies("CAR")("Tamano") = Session("glTamano")

	strCnn	= Application("XDTA300_ConnectionString")

	SQL = "SELECT * FROM X300ZQ001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002DEC = '" &  Session("glCiaInternet") & "' AND "	
	SQL = SQL & " Z300001PUS = '" &  Session("glUsuario") & "' "	

	'Response.Write strCnn
	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		
		Session("glCodVendedor") = trim(rstQuery.Fields("Z300001CVE"))
		Session("glCiaInternet") = trim(rstQuery.Fields("Z300001CCI"))
		Session("glUsuarioNombre") = trim(rstQuery.Fields("Z300001NUS"))
		Session("glCia") = trim(rstQuery.Fields("Z300001CIA"))
		Session("glTipoUsuario") = trim(rstQuery.Fields("Z300001CLU"))
		Session("glNombreCiaInternet") = trim(rstQuery.Fields("Z300002DEL"))	
		Session("glMostrarExistencia") = trim(rstQuery.Fields("Z300001MEX"))	
		Session("glMostrarTodasFamilias") = trim(rstQuery.Fields("Z300001MTF"))
		Session("glNickName") = trim(rstQuery.Fields("Z300001NIC"))	
		Session("glEstatusUsuario") = trim(rstQuery.Fields("Z300001STS"))	
		Session("glAplicarIva") = trim(rstQuery.Fields("Z300001AIV"))	
		Session("glMostrarNC") = trim(rstQuery.Fields("Z300001MNC"))	
		Session("glMostrarTR") = trim(rstQuery.Fields("Z300001MTR"))
		
		wVIS = CDBL(rstQuery.Fields("Z300001VIS"))
		wSTS = trim(rstQuery.Fields("Z300002STS"))	
		
		Response.Cookies("CAR")("CodVendedor") = trim(rstQuery.Fields("Z300001CVE"))
		Response.Cookies("CAR")("CiaInternet") = trim(rstQuery.Fields("Z300001CCI"))
		Response.Cookies("CAR")("UsuarioNombre") = trim(rstQuery.Fields("Z300001NUS"))
		Response.Cookies("CAR")("Cia") = trim(rstQuery.Fields("Z300001CIA"))
		Response.Cookies("CAR")("TipoUsuario") = trim(rstQuery.Fields("Z300001CLU"))
		Response.Cookies("CAR")("NombreCiaInternet") = trim(rstQuery.Fields("Z300002DEL"))	
		Response.Cookies("CAR")("Color1") = trim(rstQuery.Fields("Z300002CO1"))	
		Response.Cookies("CAR")("Color2") = trim(rstQuery.Fields("Z300002CO2"))	
		Response.Cookies("CAR")("MostrarExistencia") = trim(rstQuery.Fields("Z300001MEX"))	
		If IsNull(trim(rstQuery.Fields("Z300001MTF"))) Then
			Response.Cookies("CAR")("MostrarTodasFamilias") = "N"
		  Else
			Response.Cookies("CAR")("MostrarTodasFamilias") = trim(rstQuery.Fields("Z300001MTF"))
		End If
		If IsNull(trim(rstQuery.Fields("Z300001NIC"))) Then
			Response.Cookies("CAR")("NickName") = "" 
			Response.Cookies("userid") = "" 
		  Else
			Response.Cookies("CAR")("NickName") = trim(rstQuery.Fields("Z300001NIC"))
			Response.Cookies("userid") = trim(rstQuery.Fields("Z300001NIC"))
			Response.Cookies("NickName") = trim(rstQuery.Fields("Z300001NIC"))
		End If
		Response.Cookies("CAR")("EstatusUsuario") = trim(rstQuery.Fields("Z300001STS"))
		Response.Cookies("CAR")("AplicarIva") = trim(rstQuery.Fields("Z300001AIV"))	
		Response.Cookies("CAR")("MostrarNC") = trim(rstQuery.Fields("Z300001MNC"))	
		Response.Cookies("CAR")("MostrarTR") = trim(rstQuery.Fields("Z300001MTR"))	
		
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	IF Session("glTipoUsuario") = "C" THEN
	
		SQL = "SELECT A300002CVE FROM X300AF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300002CCI = '" &  Session("glCiaInternet") & "' AND "	
		SQL = SQL & " A300002PUS = '" &  Session("glUsuario") & "' "	
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			Response.Cookies("CAR")("CodVendedor") = trim(rstQuery.Fields("A300002CVE"))
			Session("glCodVendedor") = trim(rstQuery.Fields("A300002CVE"))
		END IF 
		rstQuery.Close 
		set rstQuery = nothing
	
	END IF 	
	
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	wVIS = wVIS + 1
	
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn

	SQL = "UPDATE X300ZF001 SET " 
	SQL = SQL & " Z300001VIS = '" & wVIS & "', "
	SQL = SQL & " Z300001FUA = '" & wFECHA & "', "
	SQL = SQL & " Z300001SSE = '1' "				
	SQL = SQL & " WHERE "		
	SQL = SQL & " Z300001CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300001CIA ='" & Session("glCia") & "' AND "
	SQL = SQL & " Z300001PUS ='" & Session("glUsuario")  & "' "	
	XDTA300.Execute SQL
	XDTA300.Close 
	set XDTA300 = nothing
	
	
	'***********************************************************************	
	'***********************************************************************
	Session("Start") = Now
	Application.Lock
	Application("Visitors") = Application("Visitors") + 1
    If Application("TodaysDate") <> Date() Then
       	Application("PageViewsToday") = 0
       	Application("VisitorsToday") = 0
    End if
    Application("VisitorsToday") = Application("VisitorsToday") + 1
    Application("TodaysDate") = Date()
    Application.UnLock
	
	sActiveUsersList = application("ActiveUsersList")
	    
    sUser = Session("glUsuario")
    sUserName = Session("glUsuarioNombre")
	sNickName = Request.Cookies("NickName")
    sVisitor = CInt(application("Visitors"))
    sLastActionTime = Time
    
   	'User info consists of user name, last action time, and the page viewed
    sUserInfo = sUser & "<|>" & sUserName & "<|>" & sVisitor & "<|>" & sLastActionTime & "<|>" & sNickName & "<|>" & Session("glCiaInternet")

	If dOnlineUsers.exists(Session.SessionID) Then
    	  Else
    	  dOnlineUsers.Add Session.SessionID, sUserInfo
	End If	


	Session("glVisitor") = Application("VisitorsToday") 
	Response.Cookies("CAR")("Visitor") = Session("glVisitor")	
	'***********************************************************************
	'***********************************************************************
	

	IF TRIM(Session("glUsuario")) = "" THEN
		Response.Redirect "Default.asp"
	END IF 
	

    wURL = "X001Z002F.ASP" 

	If wSTS = "3" and (Session("glTipoUsuario") = "V" or Session("glTipoUsuario") = "C" or Session("glTipoUsuario") = "CP" or Session("glTipoUsuario") = "EG") Then
	    Response.Cookies("CAR").Expires = Date - 1
		Response.Cookies("userid").Expires = Date - 1
	    dOnlineUsers.remove(Session.SessionID)
	    Session.Abandon
	    wURL = "mensaje.htm"
    End If 
    
   	If wSTS = "2" and Session("glTipoUsuario") = "C" Then
   		Response.Cookies("CAR").Expires = Date - 1
		Response.Cookies("userid").Expires = Date - 1
   		dOnlineUsers.remove(Session.SessionID)
		Session.Abandon
	    wURL = "mensaje.htm"
    End If 
    
   	If wSTS = "4" and Session("glTipoUsuario") = "CP" Then
		Response.Cookies("CAR").Expires = Date - 1
		Response.Cookies("userid").Expires = Date - 1	
		dOnlineUsers.remove(Session.SessionID)
		Session.Abandon
	    wURL = "mensaje.htm"
    End If 
    
   	If wSTS = "5" and Session("glTipoUsuario") = "V" Then
   		Response.Cookies("CAR").Expires = Date - 1
		Response.Cookies("userid").Expires = Date - 1
		dOnlineUsers.remove(Session.SessionID)
		Session.Abandon
	    wURL = "mensaje.htm"
    End If 
	
	Response.Redirect wURL
	
End Sub 


Sub Registrar_Acceso(wCCI, wAcceso, wError, wUsuario, wClave)
	
	wLUSER = Trim(request.serverVariables("LOGON_USER"))
	wUSERIP = Trim(request.serverVariables("REMOTE_HOST"))
	wUSERNA = Trim(request.serverVariables("HTTP_USER_AGENT"))
	wUSERUR = Trim(request.serverVariables("HTTP_REFERER"))
	
	If Instr(wUSERNA, "MSIE") Then
		If Instr(wUSERNA, "MSIE 5.") Then
			Browser = "Microsoft Internet Explorer 5.x"
			Elseif Instr(wUSERNA, "MSIE 4.") Then
			Browser = "Microsoft Internet Explorer 4.x"
			Elseif Instr(wUSERNA, "MSIE 3.") Then
			Browser = "Microsoft Internet Explorer 3.x"
			If Instr(wUSERNA, "MSIE 3.02") Then
				Browser = "Microsoft Internet Explorer 3.02"
			End If
	     Else
		    Browser = "Microsoft Internet Explorer"
	    End If
	ElseIf Instr(wUSERNA, "Mozilla") and Instr(wUSERNA, "compatible") = 0 Then
		If Instr(wUSERNA, "Mozilla/4") Then
			Browser = "Netscape Navigator 4.x"
			Elseif Instr(wUSERNA, "Mozilla/3") Then
			Browser = "Netscape Navigator 3.x"
		 Else
			Browser = "Mozilla Firefox"
		End If
	End If 
	
	wUSERNA = Browser

	
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn

	SQL = "INSERT INTO X300ZF008 (" 
	SQL = SQL & " Z300008CCI, Z300008CIA, Z300008PUS, Z300008CUS, "
	SQL = SQL & " Z300008ACC, Z300008VIS, Z300008DES, Z300008LUS, "
	SQL = SQL & " Z300008UIP, Z300008UNA, Z300008URU, Z300008FEC ) "
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "', "
	SQL = SQL & "'01', "
	SQL = SQL & "'" & wUsuario & "', "
	SQL = SQL & "'" & wClave & "', "
	SQL = SQL & "'" & wAcceso & "', "
	SQL = SQL & "1, "
	SQL = SQL & "'" & wError & "', "
	SQL = SQL & "'" & wLUSER & "', "
	SQL = SQL & "'" & wUSERIP & "', "
	SQL = SQL & "'" & wUSERNA & "', "
	SQL = SQL & "'" & wUSERUR & "', "
	SQL = SQL & "'" & wFECHA & "') "
	'response.write sql
	XDTA300.Execute SQL
	XDTA300.Close 
	set XDTA300 = nothing
	
End Sub 

Sub Ubicar_Ultima_Fecha_Acceso(wCCI, wUsuario)

	strCnn	= Application("XDTA300_ConnectionString")

	SQL = "SELECT " 
	SQL = SQL & " MAX(Z300008FEC) AS Z300008FEC  "
	SQL = SQL & " FROM X300ZF008 "
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300008CCI = '" & wCCI & "' AND "
	SQL = SQL & " Z300008CIA = '01' AND "
	SQL = SQL & " Z300008ACC = '1' AND "		
	SQL = SQL & " Z300008PUS = '" & trim(wUsuario) & "'" 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	If NOT rstQuery.EOF Then	
		Session("glFUA") = trim(rstQuery.Fields("Z300008FEC"))
	End If
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	
	

End Sub


		
%>