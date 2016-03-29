<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Listado de Clientes con Correo Electronico</title>
</head>

<body>


<%


strCnn	= Application("XDTA300_ConnectionString")

SQL = " SELECT LTRIM(rtrim(Z300001EML))+'| |'+Z300001NUS "
SQL = SQL & " FROM X300ZF001 "
SQL = SQL & " Where Z300001EML <> '.' AND Z300001CLU = 'C' "
SQL = SQL & " Group by Z300001EML, Z300001NUS "
Set rstQuery = Server.CreateObject("ADODB.Recordset")
rstQuery.Open sql , strCnn
DO WHILE NOT rstQuery.EOF
	
	Response.write trim(rstQuery.Fields(0)) & "<br>"

	rstQuery.MoveNext
LOOP
rstQuery.CLOSE
SET rstQuery = NOTHING	
%>

</body>

</html>
