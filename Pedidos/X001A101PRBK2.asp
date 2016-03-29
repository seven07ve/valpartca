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
<title>Procesar Pedido</title>
</head>

<body>
<%

wCLA001 = Request.QueryString("CLA001")
wCLA002 = Request.QueryString("CLA002")
wB300100CCI = Session("glCiaInternet")
wB300100CIA = Session("glCia")
wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

wOK = "0"

strCnn	= Application("XDTA300_ConnectionString")

'Ubicar Correlativo de Pedido
SQL = "SELECT * FROM X300ZF003 WHERE "
SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
SQL = SQL & " Z300003IDP = 'PE' AND "
SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
IF NOT rstQuery.EOF THEN
			
	wNRO = cLNG(rstQuery.Fields("Z300003CAC")) + 1						
				
	If wNRO > cLNG(rstQuery.Fields("Z300003NCH")) Then
		wNRO = cLNG(rstQuery.Fields("Z300003NCD"))
	End If
				
	wCVE = trim(rstQuery.Fields("Z300003CVE"))
				
	SQL = "UPDATE X300ZF003 SET "
	SQL = SQL & " Z300003CAC = " & wNRO & " "  'Correlativo actual
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300003IDP = 'PE' AND "
	SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
	'Response.Write SQL
	set rstQuery1 = Server.CreateObject("ADODB.Recordset")
	rstQuery1.Open sql , strCnn
    SET rstQuery1 = NOTHING
								
  ELSE
			  
   wNRO = 1
   
END IF
rstQuery.Close 
set rstQuery = nothing
wNRO = right(("000000" & wNRO),6)
'Fin de ubicar correlativo de pedido


Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn

SQL = "UPDATE X300BF100 SET " 
SQL = SQL & " B300100NPE ='" & wNRO & "' "
SQL = SQL & " WHERE "		
SQL = SQL & " B300100CCI ='" & wB300100CCI & "' AND "
SQL = SQL & " B300100CIA ='" & wB300100CIA & "' AND "
SQL = SQL & " B300100OPE ='" & wCLA001 & "' AND "
SQL = SQL & " B300100NPE = " & wCLA002 & " "
XDTA300.Execute SQL

SQL = "UPDATE X300BF101 SET " 
SQL = SQL & " B300101NPE ='" & wNRO & "' "		
SQL = SQL & " WHERE "		
SQL = SQL & " B300101CCI ='" & wB300100CCI & "' AND "
SQL = SQL & " B300101CIA ='" & wB300100CIA & "' AND "
SQL = SQL & " B300101OPE ='" & wCLA001 & "' AND "
SQL = SQL & " B300101NPE = " & wCLA002 & " "
XDTA300.Execute SQL

SQL = "UPDATE X300BF100 SET " 
SQL = SQL & " B300100SPP = '1', "
SQL = SQL & " B300100FAC = '" & wFECHA & "' "		
SQL = SQL & " WHERE "		
SQL = SQL & " B300100CCI ='" & wB300100CCI & "' AND "
SQL = SQL & " B300100CIA ='" & wB300100CIA & "' AND "
SQL = SQL & " B300100OPE ='" & wCLA001 & "' AND "
SQL = SQL & " B300100NPE = " & wNRO & " "
XDTA300.Execute SQL

XDTA300.Close 
set XDTA300 = nothing

wOK = "1"

%>
</body>

<SCRIPT language="Javascript" >

	
	if ("<%=wOK%>" == '1') { 
	   alert('Pedido <%=wNRO%> Procesado');	      	
	   //document.parentWindow.location.href='X001A001.asp'; 	   
	   //document.parentWindow.location.href='../ASPX/C001E001.aspx?CAMC01=<%=wCLA001%>&CAMC02=<%=wNRO%>&URL=../Pedidos/X001A001.asp'
	   window.open('../ASPX/C001E001.aspx?CAMC01=<%=wCLA001%>&CAMC02=<%=wNRO%>&URL=../Pedidos/X001A001.asp','main');
	}


</SCRIPT>  

</html>
