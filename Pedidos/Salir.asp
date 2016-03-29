<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title></title>
</head>

<body>

<%

	strCnn	= Application("XDTA300_ConnectionString")

	wCL1 = TRIM(Request.QueryString("CL1"))	
	
	IF wCL1 = "0" THEN
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

	
		
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn

	SQL = "INSERT INTO X300ZF008 (" 
	SQL = SQL & " Z300008CCI, Z300008CIA, Z300008PUS, Z300008CUS, "
	SQL = SQL & " Z300008ACC, Z300008VIS, Z300008DES, Z300008LUS, "
	SQL = SQL & " Z300008UIP, Z300008UNA, Z300008URU, Z300008FEC ) "
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & Session("glCiaInternet") & "', "
	SQL = SQL & "'" & Session("glCia") & "', "
	SQL = SQL & "'" & Session("glUsuario") & "', "
	SQL = SQL & "'', "
	SQL = SQL & "'9', "
	SQL = SQL & "1, "
	SQL = SQL & "'Usuario Salio del Sistema', "
	SQL = SQL & "'" & wLUSER & "', "
	SQL = SQL & "'" & wUSERIP & "', "
	SQL = SQL & "'" & wUSERNA & "', "
	SQL = SQL & "'" & wUSERUR & "', "
	SQL = SQL & "getdate() ) "
	'response.write sql
	XDTA300.Execute SQL
	XDTA300.Close 
	set XDTA300 = nothing
		
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn

	SQL = "UPDATE X300ZF001 SET " 
	SQL = SQL & " Z300001FSU = getdate(), "
	SQL = SQL & " Z300001SSE = '0' "				
	SQL = SQL & " WHERE "		
	SQL = SQL & " Z300001CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300001CIA ='" & Session("glCia") & "' AND "
	SQL = SQL & " Z300001PUS ='" & Session("glUsuario")  & "' "	
	XDTA300.Execute SQL
	XDTA300.Close 
	set XDTA300 = nothing
	
	END IF

	Response.Cookies("CAR").Expires = Date - 1
	Response.Cookies("userid").Expires = Date - 1
	
	on error resume next
	dOnlineUsers.remove(Session.SessionID)

	Session.Abandon
	Response.Redirect "../"
			
%>

</body>

</html>
