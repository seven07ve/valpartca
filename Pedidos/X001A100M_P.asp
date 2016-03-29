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
</head>
<script language="Javascript">

function enviar() {

		document.FrmBuscar.submit(); 
	
	
	
}

</script>
<body align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>"   >

<%

	wNOMTAB = Request.QueryString("NOMTAB")

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wSTSPED = Request.QueryString("STSPED")
	
	wURL = wURLACT & "?CLA001="
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&NOMTAB=" & wNOMTAB
	wURLX = wURLX & "&STSPED=" & wSTSPED

	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = wURLX & "&STSIMP=S" 
	wURLT = wURLX & "&STSIMP=E" 

	
	wURLP = wURLPRI & "&PARBUS=S"
	
	wURLP = "X001Z902.ASP" & "?URLTIT=" & wURLTIT
	 %>
    <%'=Session("glTamano")%>
    
      <FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLX%>" target="main1" >
        <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" height="100%"   >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">


    <table width="919" align="center"  border="0" cellpadding="0" cellspacing="0"  >


<tr>
<td align="center">


    <table bordercolor="#0066CC" align="center" cellpadding="5"  bgcolor="<%=Request.Cookies("CAR")("Color2")%>" BORDER="1" width="919"  style="border-style: inset; border-width: 1px; padding-left: 2px; padding-right: 2px; padding-top: 1px; padding-bottom: 1px"  >

    <TR>
		<!--<td CLASS="TDP" width="25%" align="center"><A href="<%=wURL %>" target="main">Crear Pedido</A></td>
		<td CLASS="TDP" width="25%" align="center"><A href="<%=wURLI %>" target="_blank">Imprimir</A></td>-->		  
		<td CLASS="TDP" width="50%" align="center"><A href="<%=wURLP %>" target="main1">Buscar</A></td>		  
		<!--<td CLASS="TDP" width="25%" align="center"><A href="X001A001.ASP" target="_parent">Atras</A></td>-->
		<td CLASS="TDP" width="50%" align="center"><A href="javascript:history.back()" target="_parent">
		Atrás</A></td>	
			<% IF Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "V" OR Session("glTipoUsuario") = "D" THEN %>
		
		<td class="TDP" width="16%" align="center">
		<SELECT name="MES" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt" size="1" onchange="Javascript:enviar();" ondblclick="Javascript:enviar();" > 

<option value="9" >TODOS</option>
<option value="0" selected >MES ACTUAL</option>
<option value="1" >MES ANTERIOR</option>
<option value="2" >MES TRANSANTERIOR</option>

					</SELECT>

		</td>	  		  
		<% END IF %>
	  		  
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
</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
  
</table>
  </form>
	
</body>
</HTML>
