<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<body align="center" style="text-align: center" topmargin="2" leftmargin="0" rightmargin="0"   >

<%

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wCLA001 = Request.QueryString("CLA001")
	wCLA002 = Request.QueryString("CLA002")
	wCLA003 = Request.QueryString("CLA003")
	wCLA004 = Request.QueryString("CLA004")
	wCLA005 = Request.QueryString("CLA005")
	
	wURL = wURLACT & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 & "&CLA003="
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&CLA001=" & wCLA001
	wURLX = wURLX & "&CLA002=" & wCLA002
	wURLX = wURLX & "&CLA003=" & wCLA003
	wURLX = wURLX & "&CLA004=" & wCLA004
	wURLX = wURLX & "&CLA005=" & wCLA005

	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = wURLX & "&STSIMP=S" 
	wURLT = wURLX & "&STSIMP=E" 

	
	wURLP = wURLPRI & "&PARBUS=S"
	
	wURLP = "X001A103B.ASP" & "?URLTIT=" & wURLTIT	
	wURLP = wURLP & "&CLA001=" & wCLA001 & "&CLA002=" & wCLA002
	
	wURLR = "X001A101_S.ASP" & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 
	'Session("glUrlRegresar")
	 %>

    <table bordercolor="#0066CC" bgcolor="#FE9900" BORDER="1" width="790"  style="border-style: inset; border-width: 3px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="790" >
    <TR>
		<td CLASS="TDP" width="35%" align="center"><A href="<%=wURLP %>" target="main">Nueva Busqueda</A></td>
		<td CLASS="TDP" width="30%" align="center"><A href="<%=wURLI %>" target="_blank">Imprimir</A></td>		  
		<td CLASS="TDP" width="35%" align="center"><A href="<%=wURLR %>" target="_parent">Regresar</A></td>		  
    </TR>	
	</table>
</body>
</HTML>
