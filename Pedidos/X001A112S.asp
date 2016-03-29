<% 
Response.Expires = -1 
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"
%>

<!--#include file="X001Z001.INC"-->

<%

	wCuenta = clng(TRIM(Request.Form("CUENTA")))
	
	
	wCLA001 = Request.QueryString("CLA001")	
	wTMFA = 0 
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)		
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	

	wIND = 1
	

    DO WHILE wIND <= wCuenta    
		'response.write wIND & "<br> Cuenta"
		wOBJ = right(("0000" & wIND),4)
		wNAMF = "F" & wOBJ
		wNAMR = "R" & wOBJ
		
		wNFA = TRIM(Request.Form(wNAMF))		
		wNCC = TRIM(Request.Form(wNAMR))
		
		RESPONSE.WRITE wNFA & "-" & wNCC & "<BR>"
			
			'INSERTA DETALLE
			Set XDTA300 = Server.CreateObject("ADODB.Connection")
			XDTA300.Open strCnn
			
			SQL = "UPDATE X300CF002 SET " 
			SQL = SQL & " C300002NCC = '" & wNCC & "'"
			SQL = SQL & " WHERE "
			SQL = SQL & " C300002CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " C300002CIA = '" & Session("glCia") & "' AND "
			SQL = SQL & " C300002NDC = '" & wCLA001 & "' AND "
			SQL = SQL & " C300002NFA = '" & wNFA & "' "
			
			XDTA300.Execute SQL	
			XDTA300.Close 
			set XDTA300 = nothing			
	
			'response.write SQL	
			'response.write wNFA & "-" & wMFA & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"
		
			
		
		'End If

		wIND = wIND + 1
		
	LOOP	
	
	
		
	
	


	wURL = "X001A107.asp?CLA001=" & wCLA001
	Response.redirect wURL


%>



