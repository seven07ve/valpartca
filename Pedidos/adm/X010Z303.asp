<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
</HEAD>
<BODY>
<%

	wPAR = TRIM(Request.QueryString("PAR"))		


	strCnn = Application("XDTA300_ConnectionString")


	SQL = " SELECT * "
	SQL = SQL & " FROM X300ZF050"
	SQL = SQL & " WHERE Z300050CDN = '" & wPAR & "'"   
	SQL = SQL & " ORDER BY Z300050FEC DESC "			
	Set rstQuery = Server.CreateObject("ADODB.Recordset")	
	'Response.Write strCnn
	rstQuery.Open sql , strCnn    
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0	 	
	IF NOT rstQuery.EOF THEN
	
		wC01 = trim(rstQuery("Z300050TIL"))		
		wC02 = trim(rstQuery("Z300050DNL"))		
		wC03 = trim(rstQuery("Z300050FEC"))		
		wC04 = trim(rstQuery("Z300050FOG"))			

	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	


%>
<table width="100%" id="table1" border="0" cellspacing="3" cellpadding="3" >
	<tr>
		<td align="left" >
		<b><font face="Arial" size="2" >
	
		<%= wC01%></font></b></td>
	</tr>
	<tr>
		<td>
		<font face="Arial" size="2" >	
		<%= wC02%>
		</font>	
		</td>
	</tr>

<% IF wC04 <> "0" AND wC04 <> "" THEN %>  	
		<tr>
		<td align="center" >
	<br>
		<img src="<%="img/" & wC04 %>" border="1" style="border: 1px solid #FF9900">

		</td>
	</tr>
<% END IF %>	
</table>

<form method="POST" action="X010Z303.asp" webbot-action="--WEBBOT-SELF--">
	<!--webbot bot="SaveResults" U-File="../_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" startspan --><input NAME="VTI-GROUP" TYPE="hidden" VALUE="0"><!--webbot bot="SaveResults" i-checksum="37496" endspan -->
	<p align="center">
	<input type="button" value="Volver" name="B3" style="border-style: ridge; border-width: 1px" onclick="javascript:history.back()"></p>
</form>
<p align="center">&nbsp;</p>

</BODY>
</HTML>