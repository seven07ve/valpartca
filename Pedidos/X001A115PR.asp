<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Procesar Reclamo</title>
</head>

<body>
<%

wCLA001 = Request.QueryString("CLA001")
wCLA002 = Request.QueryString("CLA002")
wCCI = Session("glCiaInternet")
wCIA = Session("glCia")
wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

wOK = "0"

strCnn	= Application("XDTA300_ConnectionString")

'VERIFICA SI EL RECLAMO YA FUE PROCESADO 
SQL = "SELECT E300001SPP FROM X300EF001 " 
SQL = SQL & " WHERE "
SQL = SQL & " E300001CCI = '" & Session("glCiaInternet") & "' AND "
SQL = SQL & " E300001CIA = '" & Session("glCia") & "' AND "
SQL = SQL & " E300001CCL = '" & wCLA001 & "' AND "	
SQL = SQL & " E300001COD = '" & wCLA002 & "' "	
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
IF NOT rstQuery.EOF THEN	
	wSPP = trim(rstQuery.Fields("E300001SPP"))
END IF
rstQuery.Close 
set rstQuery = nothing


'VERIFICA SI EL RECLAMO TIENE DETALLE
SQL = "SELECT E300002CPR FROM X300EF002 " 
SQL = SQL & " WHERE "
SQL = SQL & " E300002CCI = '" & Session("glCiaInternet") & "' AND "
SQL = SQL & " E300002CIA = '" & Session("glCia") & "' AND "
SQL = SQL & " E300002COD = '" & wCLA002 & "' "	
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
IF NOT rstQuery.EOF THEN	
	wOK = "1"
END IF
rstQuery.Close 
set rstQuery = nothing


IF wOK = "1" AND wSPP = "0" THEN 

	'RESPONSE.WRITE "OK"
	
	'Ubicar Correlativo de Pedido
	'SQL = "SELECT Z300003CAC, Z300003NCH, Z300003NCD "
	'SQL = SQL & " FROM X300ZF003 WHERE "
	'SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
	'SQL = SQL & " Z300003IDP = 'RE' AND "
	'SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
	'Set rstQuery = Server.CreateObject("ADODB.Recordset")
	'rstQuery.Open sql , strCnn
	'IF NOT rstQuery.EOF THEN
			
	'	wNRO = CLng(rstQuery.Fields("Z300003CAC")) + 1
	'	If wNRO > CLng(rstQuery.Fields("Z300003NCH")) Then
	'		wNRO = CLng(rstQuery.Fields("Z300003NCD"))
	'	End If
				
	'	SQL = "UPDATE X300ZF003 SET "
	'	SQL = SQL & " Z300003CAC = " & wNRO & " "  'Correlativo actual
	'	SQL = SQL & " WHERE "
	'	SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
	'	SQL = SQL & " Z300003IDP = 'RE' AND "
	'	SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
	'	'Response.Write SQL
	'	set rstQuery1 = Server.CreateObject("ADODB.Recordset")
	'	rstQuery1.Open sql , strCnn
	'	SET rstQuery1 = NOTHING
								
	'	ELSE
			  
		wNRO = 1
					
	'END IF
	'rstQuery.Close 
	'set rstQuery = nothing
	'wNRO = "9" & right(("00000" & wNRO),6)	
	'Fin de ubicar correlativo de Reclamo
	
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	
	wNRO = wCLA002 
	
	SQL = "UPDATE X300EF001 SET " 
	SQL = SQL & " E300001COD = " & wNRO 		
	SQL = SQL & " WHERE "		
	SQL = SQL & " E300001CCI ='" & wCCI & "' AND "
	SQL = SQL & " E300001CIA ='" & wCIA & "' AND "
	SQL = SQL & " E300001CCL ='" & wCLA001 & "' AND "
	SQL = SQL & " E300001COD = " & wCLA002 & " "
	'XDTA300.Execute SQL
	
	SQL = "UPDATE X300EF002 SET " 
	SQL = SQL & " E300002COD = " & wNRO 
	SQL = SQL & " WHERE "		
	SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
	SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
	SQL = SQL & " E300002COD = " & wCLA002 & " "
	'XDTA300.Execute SQL
	
	SQL = "UPDATE X300EF001 SET " 
	SQL = SQL & " E300001SPP = '1', "
	SQL = SQL & " E300001FAC = '" & wFECHA & "' "		
	SQL = SQL & " WHERE "		
	SQL = SQL & " E300001CCI ='" & wCCI & "' AND "
	SQL = SQL & " E300001CIA ='" & wCIA & "' AND "
	SQL = SQL & " E300001CCL ='" & wCLA001 & "' AND "
	SQL = SQL & " E300001COD = " & wNRO 
	XDTA300.Execute SQL

	XDTA300.Close 
	set XDTA300 = nothing
	
	
	
	

END IF 


%>
</body>

<SCRIPT language="Javascript" >

	
	if ("<%=wOK%>" == '1') { 
	   alert('PQR <%=wCLA002%> Procesado.');	      		   
	   //window.open('../ASPX/C001E003.aspx?CAMC01=<%=wCLA001%>&CAMC02=<%=wCLA002%>&URL=../Pedidos/X001A005.asp','main');
	   window.open('X001A005.asp','main');
	}else{
	   alert('PQR <%=wCLA002%> No Tiene Detalle');		   
	   window.open('X001A115_S.ASP??CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>','main');
	}


</SCRIPT>  

</html>
