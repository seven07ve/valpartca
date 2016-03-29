<%

Function Datos_Compania(wDEL, wURI)
		
		strCnn	= Application("XDTA300_ConnectionString")

	    SQL = "SELECT Z300002DEL, Z300002LOG " 	
		SQL = SQL & " FROM X300ZF002 "
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "		
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		If NOT rstQuery.EOF Then	
			wDEL = trim(rstQuery.Fields("Z300002DEL"))
			wURI = trim(rstQuery.Fields("Z300002LOG"))
		End If
		rstQuery.CLOSE
		SET rstQuery = NOTHING	

		IF NOT ISNULL(wURI) THEN
			wURI = Replace(wURI," ","%20")
			wURI = "../ASPX/" & wURI 			
		END IF 		
	

End Function 
    
%>