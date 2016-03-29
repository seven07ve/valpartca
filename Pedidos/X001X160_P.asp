<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<script language="javascript"  src="Jscript.js">
</script> 


<script language="Javascript">

 

function enviar() {

	
	if (document.FrmBuscar.FAMILIA.value == '000') {
		alert('Seleccione una Familia');
	}
	else{
		document.FrmBuscar.submit(); 
	}
	
	
}

</script>


<%

	wURLACT = Request.QueryString("URLACT")
	wNOMTAB = Request.QueryString("NOMTAB")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wCAMC01 = Request.QueryString("CAMC01")
	wCAMC02 = Request.QueryString("CAMC02")
	wCAMC03 = Request.QueryString("CAMC03")
	wCAMC04 = Request.QueryString("CAMC04")
	wCAMC05 = Request.QueryString("CAMC05")
	wCAMC06 = Request.QueryString("CAMC06")
	wCAMC07 = Request.QueryString("CAMC07")
	wCAMC08 = Request.QueryString("CAMC08")
	
	wPARBUS01 = TRIM(Request.QueryString("PARBUS01"))
	wPARBUS02 = TRIM(Request.QueryString("PARBUS02"))
	wPARBUS03 = TRIM(Request.QueryString("PARBUS03"))
	wPARBUS04 = TRIM(Request.QueryString("PARBUS04"))


	wURL = wURLACT & "?CLA001="  & "&CLA002=" & Session("glCiaInternet") & "&CLA003=" & Session("glUsuario")  	
	
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
	wURLX = wURLX & "&PARBUS01=" & wPARBUS01
	wURLX = wURLX & "&PARBUS02=" & wPARBUS02
	wURLX = wURLX & "&PARBUS03=" & wPARBUS03
	wURLX = wURLX & "&PARBUS04=" & wPARBUS04

	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = wURLX & "&STSIMP=S"
	wURLI = wURLX & "&IMP=S"
	

	wURLT = wURLX & "&STSIMP=E" 
	
	'wURLP = wURLPRI & "&PARBUS=S"
	IF wNOMTAB = "X300AF003" THEN
		wURLP = "X001X160B.ASP" 
		ELSE
		wURLP = "X001Z902.ASP" 
	END IF 
	wURLP = wURLP & "?URLTIT=" & wURLTIT
	wURLP = wURLP & "&NOMTAB=" & wNOMTAB
	wURLP = wURLP & "&CAMC01=" & wCAMC01
	wURLP = wURLP & "&CAMC02=" & wCAMC02
	wURLP = wURLP & "&CAMC03=" & wCAMC03
	wURLP = wURLP & "&CAMC04=" & wCAMC04 
	wURLP = wURLP & "&CAMC05=" & wCAMC05
	wURLP = wURLP & "&CAMC06=" & wCAMC06  
	wURLP = wURLP & "&CAMC07=" & wCAMC07
	wURLP = wURLP & "&URLACT=" & wURLACT 
	
	
	wURLb = wURLP & "&NOMTAB=" & wNOMTAB
	
	

	
	'wURLP = "X001A103B.ASP" & "?URLTIT=" & wURLTIT	
	'wURLP = wURLP & "&CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02
	
	wURLR = Session("glUrlRegresar")
	
	wURLB = "X001X160.ASP?URLTIT=" & wURLTIT
	wURLB = wURLB & "&NOMTAB=" & wNOMTAB
	wURLB = wURLB & "&CAMC01=" & wCAMC01
	wURLB = wURLB & "&CAMC02=" & wCAMC02  
	wURLB = wURLB & "&CAMC03=" & wCAMC03
	wURLB = wURLB & "&CAMC04=" & wCAMC04 
	wURLB = wURLB & "&CAMC05=" & wCAMC05
	wURLB = wURLB & "&CAMC06=" & wCAMC06  
	wURLB = wURLB & "&CAMC07=" & wCAMC07
	wURLB = wURLB & "&CAMC08=" & wCAMC08   
	wURLB = wURLB & "&URLD=" & "X001X160.ASP"  
	wURLB = wURLB & "&URLACT=" & wURLACT 

	Session("glUrlBuscarDetalle") = wURLB 

	
	%>
	 <BODY   topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">	 
<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLB%>" target="main1" >	 

<!--ONLOAD="document.FrmBuscar.CODIGO.focus()"-->
  
  <table border="0" width="920" height="80"  cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF" align="center" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">

<tr>
<td align="center">




 <table bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" cellspacing="0" BORDER="1" WIDTH="920" height="30"   style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px" WIDTH="760"  >
    <TR>
		
			<% IF wNOMTAB <> "X300AF003" THEN %>
			<td CLASS="TDP" width="20%" align="center"><font color="#0000FF" onclick="window.open('<%=wURL%>','_parent');" style="CURSOR: pointer;">Agregar Registro</font></td>
			<% END IF %>
			
			<td CLASS="TDP" width="20%" align="center"><font color="#0000FF" onclick="window.open('<%=wURLP%>','main1');" style="CURSOR: pointer;">Buscar</font></td>			  
			<td CLASS="TDP" width="20%" align="center"><font color="#0000FF" onclick="window.open('X001X002.ASP','_parent');" style="CURSOR: pointer;">Regresar</font></td>
			<td CLASS="TDP" width="20%" align="center"><font color="#0000FF" onclick="window.open('<%=wURLI%>','_blank');" style="CURSOR: pointer;">Imprimir</font></td>		  		  
					
		
    </TR>	
	</table>


	
</td> 
</tr> 



</FORM> 	
</body>


</HTML>