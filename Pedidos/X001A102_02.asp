<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

</HEAD>
<body>
<%
	wURLW = Request.ServerVariables("URL")
	
	wTIT = "Agregar Item desde Plan Slipt" 
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wCLA003 = TRIM(Request.QueryString("CLA003"))
	
	wPAR = "X001Z100D.ASP?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 & "&CLA003=" & wCLA003
	
	wB300100CCI = Session("glCiaInternet")
	wB300100CIA = Session("glCia")

	wPEDIDO = wCLA001 & "-" & wCLA002
			
	wProceso = "Aceptar"


	wURL = "X001A101_AS.ASP"
	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >


    <table BORDER="1" WIDTH="85%" cellspacing="0" cellpadding="0" align="center">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=1><%= wTIT %></td>		  
		 </TR>	

<%

		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT B300121NLP, B300121DEC "
		SQL = SQL & " FROM X300BF121 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300121CCI ='" & wB300100CCI & "' AND "
		SQL = SQL & " B300121CIA ='" & wB300100CIA & "' AND "
		SQL = SQL & " B300121NPS ='" & wCLA003 & "' AND "
		SQL = SQL & " B300121STS ='1' "		

		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		do while NOT rstQuery.EOF
			wB300121NLP = trim(rstQuery.Fields("B300121NLP"))
			wB300121DEC = trim(rstQuery.Fields("B300121DEC"))
			wURL = wPAR & "&CLA004=" & wB300121NLP
			wSTR = "<TR><td class=" & CHR(34) & "TDD" & CHR(34) & ">"
			wSTR = wSTR & "<p CLASS=" & CHR(34) & "P1" & CHR(34) &  " align=" & CHR(34) & "center" & CHR(34) & ">"
			wSTR = wSTR & "<a href=" & CHR(34) & wURL & CHR(34) &  " target=" & CHR(34) & "main" & CHR(34) & ">"			
			wSTR = wSTR & wB300121DEC 
			wSTR = wSTR & "</a></p></td></tr>"
			Response.Write wSTR
			rstquery.movenext
		loop
		rstQuery.CLOSE
		SET rstQuery = NOTHING	


%>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
		  <INPUT TYPE="Hidden" NAME="CLA001" value="<%=wCLA001%>">          
		  <INPUT TYPE="Hidden" NAME="CLA002" value="<%=wCLA002%>">          
		  <INPUT TYPE="Hidden" NAME="CLA003" value="<%=wCLA003%>">          
		  <INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:history.back()'>
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
</FORM>
</BODY>
</HTML>
