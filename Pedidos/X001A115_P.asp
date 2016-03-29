<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<style type="text/css">
.auto-style1 {
	margin-top: 4px;
	margin-bottom: 2px;
}
.auto-style2 {
	margin-top: 1px;
	margin-bottom: 1px;
}
</style>
</head>


<script language="Javascript">

function enviar() {

	
	/*if (document.FrmBuscar.FAMILIA.value == '000') {
		alert('Seleccione una Familia');
	}
	else{
		document.FrmBuscar.submit(); 
	}*/
	
	if (document.FrmBuscar.DESCRIPCION.value == '') {
		alert('Indique un Criterio de Busqueda');
		return false
	}
	else{
		document.FrmBuscar.submit(); 
	}

	
	
}

function Validar() {


	var des = FrmBuscar.DESCRIPCION.value 


	if ((des=='')) {
		alert('Indique un Criterio de Busqueda');
		return false;	
	}
}


function KeyPress(e){
	
	tecla = (document.all) ? e.keyCode : e.which;
	var result = Validar()
	//alert(window.event.keyCode);
	//if (window.event.keyCode == 13){ 
	if (tecla == 13){ 		
		if (result==false){
			return false;	
		}else{	
			document.FrmBuscar.submit();	  			
		}
	} 
}	

</script>


<%

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wCAMC01 = Request.QueryString("CAMC01")
	wCAMC02 = Request.QueryString("CAMC02")
	wSTSPED = Request.QueryString("STSPED")
	
	wURL = wURLACT & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 & "&CLA003="
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&CAMC01=" & wCAMC01
	wURLX = wURLX & "&CAMC02=" & wCAMC02


	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = "X001A115_I.asp?CAMC01=" & wCAMC01 & "&CAMC02=" & wCAMC02
	wURLT = wURLX & "&STSIMP=E" 

	
	wURLP = wURLPRI & "&PARBUS=S"	
	wURLP = "X001A116_A.ASP" & "?URLTIT=" & wURLTIT	
	wURLP = wURLP & "&CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02
	
	
	
	
	'wURLTIT = Request.QueryString("URLTIT") 
	'wCLA001 = Request.QueryString("CLA001") 
	'wCLA002 = Request.QueryString("CLA002") 
	'wTITULO = "Busqueda de Productos"

	

	strCnn	= Application("XDTA300_ConnectionString")
	SQL = "SELECT E300001SPP, E300001NFA, E300001CTR "
	SQL = SQL & " FROM X300EF001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " E300001CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " E300001COD ='" & wCAMC02 & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	IF NOT rstQuery.EOF THEN
		wSPP = trim(rstQuery.Fields("E300001SPP"))
		wNFA = trim(rstQuery.Fields("E300001NFA"))
		wCTR = trim(rstQuery.Fields("E300001CTR"))
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	wURLP = wURLPRI & "&PARBUS=S"	
	IF wCTR = "R" THEN
		wURLP = "X001Z203.ASP" 
	ELSE
		wURLP = "X001A116_A.ASP" 
	END IF 
	
	IF wSPP = "0" THEN
		wURLR = "X001A113_S.asp?NOMTAB=X300BQ100"
		ELSE
		wURLR = "X001A113_S.asp?NOMTAB=X300BQ100S"
	END IF 
	wURLR = wURLR & "&CTR=" & wSPP
	
	wURLP = wURLP & "?URLTIT=" & wURLTIT	
	wURLP = wURLP & "&CLA001=" & wCAMC01 
	wURLP = wURLP & "&CLA002=" & wCAMC02

 
 	wURLB = "X001A116.ASP?URLTIT=" & wURLTIT	
	wURLB = wURLB & "&CLA001=" & wCAMC01
	wURLB = wURLB & "&CLA002=" & wCAMC02 	
	wURLB = wURLB & "&CLA003=" & wNFA	
	wURLB = wURLB & "&STSPED=" & wSTSPED  
	wURLB = wURLB & "&URLD=" & "X001A103BS.ASP"  
 
 	wCLA004 = trim(Request.QueryString("CLA004"))
 	wCLA005 = trim(Request.QueryString("CLA005"))
 	wCLA006 = trim(Request.QueryString("CLA006"))
 	'response.write "Inventario: " & wCLA006
 	
 	IF wCTR = "2" THEN
 		wCLA004 = wNFA
 	END IF 
	
	%>
	 
<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLB%>" target="main" onsubmit="return Validar()">	 
	 <BODY   topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">
  

 <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center"  height="100%">
<tr>
<td valign="top"  >

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">



<table width="100%" align="center"  border="0" cellpadding="0" cellspacing="0"  >


<tr>
<td align="center">


<table border="0" width="790" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF" align="center">

   
 <tr>
    <td width="99%" align= "center" style="border-left:1px solid #0066CC; border-right:1px solid #0066CC; border-top:1px solid #0066CC; ">
      <table border="0" width="919" bgcolor="#E9E9E9" style="border-width: 0px">
     

<tr>
          <td width="100%" height="25" style="border-style: none; border-width: medium; " >
            <p align="center" class="auto-style2">
			<font color="#000000" style="font-size: 8pt; font-weight:700">
			<% IF wSPP = "0" THEN  %>  			
			*Para Actualizar o Eliminar un Item o Posición debe Seleccionar en la Columna "Item" el Nro. con el Mouse.</font></p>
			<p align="center" class="auto-style1" >
			<font color="#000000" style="font-size: 8pt; font-weight:700">
			*Recuerde que para Enviar el PQR a la Empresa debe Pulsar El Botón "Procesar"
			<% END IF%>  
			</font></p>
          </td>
                  
                  </tr>


      </table>
    </td>
  </tr>
  <tr>
<td align= "center" >
    <table bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" BORDER="1" width="919"  style="border-style: inset; border-width: 1px; padding-left: 2px; padding-right: 2px; padding-top: 1px; padding-bottom: 1px" width="790" >
    <TR>
		<% IF wSPP = "0" THEN  %>  
		<td CLASS="TDP" width="35%" align="center"><A href="<%=wURLP %>" target="main">Agregar Item</A></td>
		<% END IF %>  
		<td CLASS="TDP" height="30" width="30%" align="center"><A href="<%=wURLR %>" target="_parent">Encabezado de PQR'S</A></td>		  
		<td CLASS="TDP" width="30%" align="center"><A href="<%=wURLI %>" target="_blank">Imprimir</A>&nbsp;</td>		  					
    </TR>	
	</table>	
	
	</td> 
</tr>
</table>


	
	
</td> 
</tr> 
</table>
 
</td>
</tr> 
<td>
&nbsp;</td>
</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
</table>



</FORM> 	
</body>




<% 
'RESPONSE.WRITE Session("glBusqueda3") & "##"
%>

</HTML>
