<%


	If Request.cookies("CAR")("CiaInternet") <> "" Then

		If Len(Trim(Session("glCiaInternet"))) = 0 Then
			Session("glCiaInternet") = Request.Cookies("CAR")("CiaInternet") 
			Session("glUsuario") = Request.Cookies("CAR")("Usuario")  
			Session("glCodVendedor") = Request.Cookies("CAR")("CodVendedor")
			Session("glUsuarioNombre") = Request.Cookies("CAR")("UsuarioNombre") 
			Session("glCia") = Request.Cookies("CAR")("Cia") 
			Session("glTipoUsuario") = Request.Cookies("CAR")("TipoUsuario") 
			Session("glNombreCiaInternet") = Request.Cookies("CAR")("NombreCiaInternet") 	
			Session("glMostrarExistencia") = Request.Cookies("CAR")("MostrarExistencia") 	
			Session("glMostrarTodasFamilias") = Request.Cookies("CAR")("MostrarTodasFamilias") 
			Session("glNickName") = Request.Cookies("CAR")("NickName") 
			Session("glEstatusUsuario") = Request.Cookies("CAR")("EstatusUsuario") 
			Session("glAplicarIva") = Request.Cookies("CAR")("AplicarIva") 
			Session("glMostrarNC") = Request.Cookies("CAR")("MostrarNC")
			Session("glMostrarTR") = Request.Cookies("CAR")("MostrarTR") 			

			Session("glTamano") = Request.Cookies("CAR")("Tamano") 
			Session("glVisitor") = Request.Cookies("CAR")("Visitor") 
			
			sActiveUsersList = application("ActiveUsersList")
    
    		sUser = Session("glUsuario")
    		sUserName = Session("glUsuarioNombre")
    		sNickName = Request.Cookies("NickName")
    		sVisitor = Session("glVisitor") 'CInt(application("Visitors"))
    		sLastActionTime = Time
    
    		'User info consists of user name, last action time, and the page viewed
    		sUserInfo = sUser & "<|>" & sUserName & "<|>" & sVisitor & "<|>" & sLastActionTime & "<|>" & sNickName & "<|>" & Session("glCiaInternet")

    		If dOnlineUsers.exists(Session.SessionID) Then
    			Else
    			dOnlineUsers.Add Session.SessionID, sUserInfo
			End If
				
		End If 
			
			'''''''''''''''''''''PARA VALIDAR ESTATUS DE PAGINA SEGUN TIPO DE USUARIO'''''''''''''''''''''''''''
			
			strCnn	= Application("XDTA300_ConnectionString")
			SQL = "SELECT Z300002STS FROM X300ZF002 " 
			SQL = SQL & " WHERE "
			SQL = SQL & " Z300002CCI = '" &  Session("glCiaInternet") & "' "	
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
		    rstQuery.Open sql , strCnn
			IF NOT rstQuery.EOF THEN
				wSTS = trim(rstQuery.Fields("Z300002STS"))	
			END IF
			rstQuery.Close 
			set rstQuery = nothing

		
			wURL = ""
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
		    'response.write "Estatus: " & wSTS
			IF LEN(TRIM(wURL)) > 0 THEN
				Response.write "<script language=""javascript"">"
				Response.write "window.open('" & wURL & "','_top');"
				Response.write "</script>"
			END IF 

		
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		
			
		
		Else
		
		Response.write "<script language=""javascript"">"
		Response.write "alert('Su Sesion ha Finalizado sera redirigido a la Pagina Principal');"
		Response.write "window.open('../','_top');"
		Response.write "</script>"
		
	End If 

	'Response.write Len(Trim(Session("glCiaInternet")))

%>