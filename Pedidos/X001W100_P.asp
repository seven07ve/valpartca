<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<body topmargin="2"   >

<%

	wNOMTAB = Request.QueryString("NOMTAB")
	wCAMC01 = Request.QueryString("CAMC01")
	wCAMC02 = Request.QueryString("CAMC02")
	wCAMC03 = Request.QueryString("CAMC03")
	wCAMC04 = Request.QueryString("CAMC04")
	wCAMC05 = Request.QueryString("CAMC05")
	wCAMC06 = Request.QueryString("CAMC06")
	wCAMC07 = Request.QueryString("CAMC07")

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	
	wURL = wURLACT & "?CLA001="
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&NOMTAB=" & wNOMTAB
	wURLX = wURLX & "&CAMC01=" & wCAMC01
	wURLX = wURLX & "&CAMC02=" & wCAMC02
	wURLX = wURLX & "&CAMC03=" & wCAMC03
	wURLX = wURLX & "&CAMC04=" & wCAMC04
	wURLX = wURLX & "&CAMC05=" & wCAMC05
	wURLX = wURLX & "&CAMC06=" & wCAMC06
	wURLX = wURLX & "&CAMC07=" & wCAMC07

	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = wURLX & "&STSIMP=S" 
	wURLT = wURLX & "&STSIMP=E" 

	
	wURLP = wURLPRI & "&PARBUS=S"
	
	wURLP = "X001Z002.ASP" & "?URLTIT=" & wURLTIT
	 %>

    <table BORDER="0" WIDTH="<%=Session("glTamano")%>" >
    <TR>
		<td CLASS="TDP" width="25%" align="center"><A href="<%=wURL %>" target="main1">Preparar Archivo</A></td>		  
		<td CLASS="TDP" width="25%" align="center"><A href="<%=wURLI %>" target="_blank">Imprimir</A></td>		  
		<td CLASS="TDP" width="25%" align="center"><A href="<%=wURLP %>" target="main1">Buscar</A></td>		  
		<td CLASS="TDP" width="25%" align="center"><A href="X001A001.ASP" target="_parent">Regresar</A></td>		  
    </TR>	
	</table>
</body>
</HTML>
