<%@ Language=VBScript %>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.3)">
</HEAD>
<body>		

<p align="center"  style="margin-left: 15px; margin-right: 15px; margin-top: 15px; margin-bottom: 0px">
							<b><font face="Arial">
							<img src="img/Noticia.jpg" ></font></b></p>
<table BORDER="0" ALIGN="center" width="90%">
<tr>
<%



	strCnn = Application("XDTA300_ConnectionString")

	'Cargar Datos
	SQL = " SELECT * "
	SQL = SQL & " FROM X300ZF050"
	SQL = SQL & " WHERE Z300050STS = '1' "    
	SQL = SQL & " ORDER BY Z300050FEC DESC "			
    Set rstQuery = Server.CreateObject("ADODB.Recordset")	
	'Response.Write strCnn
    rstQuery.Open sql , strCnn    
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0	 	
	DO WHILE NOT rstQuery.EOF
		
		wCuenta = wCuenta + 1
		
		wC01 = trim(rstQuery("Z300050TIL"))		
		wC02 = trim(rstQuery("Z300050FOP"))
		wC03 = trim(rstQuery("Z300050CDN"))
		
		IF wC02 = "0" OR wC02 = "" THEN
			wC02 = "DF.jpg"
		END IF
		
			
		wLink = "X010Z303.asp?PAR=" & wC03
		
		%>
		<% if wCuenta = 4 then 
		      wCuenta = 1
		%>
		   
		   <tr>		   
		<% end if  %> 
		<td valign="top">
		<table BORDER="0" width="80%">
		<tr valign="top">
			<td Align="center"  width="40%">
			<a HREF="<%=wLink %>" TARGET="NOTICIAS" onmouseover="window.status='<%= wC01%>'" onfocus="window.status='<%= wC01%>'" onclick="window.status='<%= wC01%>'" onmouseout=" window.status='<%= wC01%>'">
			<img src="<%="img/" & wC02 %>" width="146" height="112"  border="1" style="border: 1px solid #FF9900">
	
			</td>
		</tr>
		<tr valign="top">
			<td ALIGN="center"  width="40%">
			<B>
			<font face="Arial" color="black" style="font-size: 9	pt">
			<a HREF="<%= wLink %>" TARGET="NOTICIAS" style="text-decoration: none;color: #000000;letter-spacing: 0pt" onmouseover="window.status='<%= wC01%>'" onfocus="window.status='<%= wC01%>'" onclick="window.status='<%= wC01%>'" onmouseout=" window.status='<%= wC01%>'" >     
			<%= wC01%></a></font></B>
			</td>    
		</tr>
		<br>
		</table>
		<%    		
		
		
		rstQuery.MoveNext 
	LOOP		
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	

%>



</body>
</html>