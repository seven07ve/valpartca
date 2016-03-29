<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>A</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<body align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>"  >

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
	wURLTO = "X001X122.asp"
	
	wURLP = wURLPRI & "&PARBUS=S"
	
	wURLP = "X001Z902.ASP" & "?URLTIT=" & wURLTIT
	 %>


       <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" height="100%" >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">


    <table bordercolor="#ffffff" cellpadding="4"  bgcolor="<%=Request.Cookies("CAR")("Color2")%>" BORDER="1" width="919"  style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px" width="790" >
    <TR>
		<%	
		IF  wNOMTAB = "X300ZF001" THEN
			if Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G" then %>
				<td CLASS="TDP" width="20%" align="center"><A href="<%=wURL %>" target="_parent">Agregar Registro</A></td>		  
			<% ELSE %>
				<td CLASS="TDP" width="20%" align="center">Agregar Registro</td>		  			
			<% END IF %>
			<td CLASS="TDP" width="20%" align="center"><A href="<%=wURLI %>" target="_blank">Imprimir</A></td>		  
			<td CLASS="TDP" width="20%" align="center"><A href="<%=wURLP %>" target="main1">Buscar</A></td>		
			<td CLASS="TDP" width="20%" align="center"><A href="<%=wURLTO %>" target="main1">Total Usuarios</A></td>	  
			<td CLASS="TDP" width="20%" align="center"><A href="X001X001.ASP" target="_parent">Atras</A></td>		  
			<% ELSE %>
			 <td CLASS="TDP" width="35%" align="center"><A href="<%=wURLI %>" target="_blank">Imprimir</A></td>		  
			 <td CLASS="TDP" width="30%" align="center"><A href="<%=wURLP %>" target="main1">Buscar</A></td>		  
			 <td CLASS="TDP" width="35%" align="center"><A href="X001X001.ASP" target="_parent">Atras</A></td>		  
		<% END IF %>		
		
    </TR>	
	</table>
	
	
	</td> 
</tr> 
</table>

</td>
</tr> 
<!--<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>-->
</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
</table>

</body>
</HTML>

<html></html>