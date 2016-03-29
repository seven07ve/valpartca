
<%@ Language=VBScript %>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel=stylesheet type="text/css" href="../X001Z900.CSS">
<title></title>
<SCRIPT LANGUAGE="Javascript">

function Regresar()
{

	history.go(-1);
}

</SCRIPT>

<script ID="serverEventHandlersVBS" LANGUAGE="vbscript" RUNAT="Server">


</script>


</head>
<body align="center" style="text-align: center" topmargin="2" leftmargin="0" rightmargin="0"   >
    <table align="center"   bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" BORDER="1" WIDTH="760"  style="border-style: inset; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" WIDTH="760" >
<%


	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")


	wANOFIS = Request.QueryString("ANOFIS")
	wMESFIS = Request.QueryString("MESFIS")
	wCODCNY = Request.QueryString("CODCNY")	

	wPAR = "ANOFIS=" & wANOFIS 
	wPAR = wPAR & "&MESFIS=" & wMESFIS
	wPAR = wPAR & "&CODCNY=" & wCODCNY

	
	'Response.Write wPAR
	'Mostrar Titulo

	wURL = wURLIMP & "?STSIMP=E" & "&" & wPAR
	wURLI = wURLIMP & "?STSIMP=S" & "&" & wPAR
	wURLP = wURLPRI & "?STSBUS=S"
	
	wURLA = "../../ASPX/C001D001.ASPX?CODCOR=" 
	
	
	
	Mostrar_Pie
	

	SUB Mostrar_Pie()
		'#FFFFCC ' Amarillo
		wBgcolor = "white" 'Azul
		wColor="black" 'Blanco
		wSize = 2
		%>
		  <TR>
			<td CLASS="TDP" width="30%" aLIGN="center" bgcolor="<%=wBgcolor%>"><font face="Arial" color="<%=wColor%>" size=<%=wSize%>>
			<A href="<%=wURLA %>" style="text-decoration:none" target="_parent">
			Nuevo
			</A></font></td>		  			
			<td CLASS="TDP" width="35%" ALIGN="center" bgcolor="<%=wBgcolor%>"><font face="Arial" color="<%=wColor%>" size=<%=wSize%>>
			<A href="<%=wURLI %>" style="text-decoration:none" target="_blank">	
			<%="Imprimir" %>
			</A></font></td>		
			<td CLASS="TDP" width="35%" ALIGN="center" bgcolor="<%=wBgcolor%>"><font face="Arial" color="<%=wColor%>" size=<%=wSize%>>
			<A href="#" style="text-decoration:none" OnClick='javascript:Regresar()'> 	
			<%= "Regresar" %></a>
			
			</font></td>		
		</TR>	
		<%
	

	END SUB

    
%>
</table>
</body>

</html>
