<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<body align="center" style="text-align: center" bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>"   >

<%

	wNOMTAB = Request.QueryString("NOMTAB")
	wCLA001 = Request.QueryString("CLA001")
	wCLA002 = Request.QueryString("CLA002")

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	
	wURL = wURLACT & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&NOMTAB=" & wNOMTAB
	wURLX = wURLX & "&CLA001=" & wCLA001
	wURLX = wURLX & "&CLA002=" & wCLA002

	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = wURLX & "&STSIMP=S" 
	wURLT = wURLX & "&STSIMP=E" 
	wURLTO = "X001X122.asp"
	
	wURLP = wURLPRI & "&PARBUS=S"
	
	wURLP = "X001Z902.ASP" & "?URLTIT=" & wURLTIT
	 %>

<table WIDTH="919" bgcolor="#FFFFFF" align="center" height="100%"><tr><td valign="top" >
    <table bordercolor="#FFFFFF" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" BORDER="1" WIDTH="919"  style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px" width="790" >
    <TR>
		
			<td CLASS="TDP" width="20%" align="center" height="30"><A href="<%=wURL %>" target="_parent">Agregar Registro</A></td>		  
			
			<td CLASS="TDP" width="20%" align="center"><A href="<%=wURLI %>" target="_blank">Imprimir</A></td>		  
			
				  
			<td CLASS="TDP" width="20%" align="center"><A href="X001X002.ASP" target="_parent">Volver</A></td>		  
		
		
    </TR>	
	</table>
	</td> 
	</tr> 
	</table> 
</body>
</HTML>

<html></html>