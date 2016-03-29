<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<script language="Javascript">

function enviar() {

		document.FrmBuscar.submit(); 
	
	
	
}

</script>

<body align="center" style="text-align: center" topmargin="2" leftmargin="0" rightmargin="0"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>"   >

<%

	wNOMTAB = Request.QueryString("NOMTAB")

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wSTSPED = Request.QueryString("STSPED")
	wMES = TRIM(Request.QueryString("MES"))
	
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
	
	IF LEN(TRIM(wMES)) = 0 THEN
		wMES = Right("00" & Month(Now),2)
	END IF 
	
		
	Select Case wMES
		Case "01"
			wSEL01 = "Selected"
		Case "02"
			wSEL02 = "Selected"
		Case "03"
			wSEL03 = "Selected"
		Case "04"
			wSEL04 = "Selected"
		Case "05"
			wSEL05 = "Selected"
		Case "06"
			wSEL06 = "Selected"
		Case "07"
			wSEL07 = "Selected"
		Case "08"
			wSEL08 = "Selected"
		Case "09"
			wSEL09 = "Selected"	
		Case "10"
			wSEL10 = "Selected"
		Case "11"
			wSEL11 = "Selected"
		Case "12"
			wSEL12 = "Selected"			
	End Select 

	%>
    
<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLX%>" target="main1" >

    
   
       <table width="919" bgcolor="#000000" border="0"  cellpadding="0" cellspacing="0" align="center"  >
<tr>
<td>

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">




    <table bordercolor="#CACACA" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" cellspacing="0" BORDER="1" WIDTH="919" height="45"   style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px"  >

    <TR>
		<!--<td CLASS="TDP" width="25%" align="center"><A href="<%=wURL %>" target="main">Crear Pedido</A></td>-->		  
		<td CLASS="TDP" width="42%" align="center" height="25"><A href="<%=wURLP %>" target="main1">
		Buscar</A></td>		  
		<!--<td CLASS="TDP" width="25%" align="center"><A href="X001A001.ASP" target="_parent">Atras</A></td>-->
		<td CLASS="TDP" width="25%" align="center"><A href="javascript:imprimir();">
		Imprimir</A></td>
		<!--<font onclick="javascript:imprimir();" color="#0000FF" style="CURSOR: pointer">Imprimir</font></td>-->
		<td CLASS="TDP" width="42%" align="center"><A href="javascript:history.back()" target="_parent">
		Regresar</A></td>	
		<% IF wSTSPED = "1" AND (Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "V" OR Session("glTipoUsuario") = "D" OR Session("glTipoUsuario") = "P") THEN %>
		
		<td class="TDP" width="16%" align="center">
		<SELECT name="MES" style="font-family: Tahoma; font-size: 8pt" size="1" onchange="Javascript:enviar();" ondblclick="Javascript:enviar();" > 

	<!--<option value="0" >TODOS</option>-->
	<option value="01" <%=wSEL01%> >ENERO</option>
	<option value="02" <%=wSEL02%> >FEBRERO</option>
	<option value="03" <%=wSEL03%> >MARZO</option>
	<option value="04" <%=wSEL04%> >ABRIL</option>
	<option value="05" <%=wSEL05%> >MAYO</option>
	<option value="06" <%=wSEL06%> >JUNIO</option>
	<option value="07" <%=wSEL07%> >JULIO</option>
	<option value="08" <%=wSEL08%> >AGOSTO</option>
	<option value="09" <%=wSEL09%> >SEPTIEMBRE</option>
	<option value="10" <%=wSEL10%> >OCTUBRE</option>
	<option value="11" <%=wSEL11%> >NOVIEMBRE</option>
	<option value="12" <%=wSEL12%> >DICIEMBRE</option>
	</select>
			
			

          <% IF Session("glTipoUsuario") = "A" THEN %>
          <!--	<input type="button" ="Exportar" value="Exportar" onclick="Javascript:exportar();">-->
          <% END IF %>

		</td>	  		  
		<% END IF %>
    </TR>	
    <% IF wSTSPED = "0" THEN %> 
    
    	<% IF Session("glTipoUsuario") <> "P" THEN %>
 			<tr>   
    		<td colspan="4" CLASS="TDP" height="25"  >
    		<p align='center' style='margin-top: 0px'><font face='Tahoma' style='font-size: 8pt'><b>
			*Para eliminar un pago debe seleccionar el tilde y presionar el 
			botón X con el Mouse.</b></font>
    		</td>
    		</tr>
    	<% END IF %>
    <% END IF %>
	</table>
		
	</td> 
</tr> 
</table>

</td>
</tr> 
</p> 

<script language="javascript" >

function exportar(){

	var url = 'X001A108.asp?STSIMP=E&MES=' + FrmBuscar.MES.value; 
	
	window.open(url,'_blank');

}

function imprimir(){

	var url2 = '<%=wURLI%>&MES=' + FrmBuscar.MES.value; 
	
	window.open(url2,'pagos');

}

</script>


</td>

        </tr>
        
        
        
        
               </table>

    

    </td>				
  </tr>
</table>
 
</FORM> 
	
</body>
</HTML>
