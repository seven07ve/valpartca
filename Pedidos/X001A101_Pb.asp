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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<style type="text/css" media="screen,print,projection">

#FAMILIA option {padding:5px}
[selected] {
	color:#f00;
	font-weight:bold;
}


#SUBLINEA option {padding:5px}
[selected] {
	color:#f00;
	font-weight:bold;
}

#DESCRIPCION option {padding:5px}
[selected] {
	color:#f00;
	font-weight:bold;
}


.auto-style1 {
	font-size: 8pt;
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
	
	if (document.FrmBuscar.FAMILIA.value == '000' && document.FrmBuscar.DESCRIPCION.value == '') {
		alert('Indique un Criterio de Busqueda o Seleccione una Linea');
		return false
	}
	else{
		document.FrmBuscar.submit(); 
	}

	
	
}

function Validar() {


	var des = FrmBuscar.DESCRIPCION.value 
	var fam = FrmBuscar.FAMILIA.value 

	if ((des=='') && (fam=='000')) {
		alert('Indique un Criterio de Busqueda o Seleccione una Linea');
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
	
	wURL = wURLACT & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 & "&CLA003="
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&CAMC01=" & wCAMC01
	wURLX = wURLX & "&CAMC02=" & wCAMC02


	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = "X001A101_PRINT.asp?CAMC01=" & wCAMC01 & "&CAMC02=" & wCAMC02
	wURLT = wURLX & "&STSIMP=E" 

	
	wURLP = wURLPRI & "&PARBUS=S"
	
	wURLP = "X001A103B.ASP" & "?URLTIT=" & wURLTIT	
	wURLP = wURLP & "&CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02
	
	'wURLPS = "X001A102_01.ASP" & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 	 
	'wURLPSP = "X001A102_03.ASP" & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 	 
	
	wURLR = Session("glUrlRegresar")
	
	
	'wURLTIT = Request.QueryString("URLTIT") 
	'wCLA001 = Request.QueryString("CLA001") 
	'wCLA002 = Request.QueryString("CLA002") 
	'wTITULO = "Busqueda de Productos"

	wURLB = "X001A103BS.ASP?URLTIT=" & wURLTIT
	'wURLB = "X001A101_F.ASP?URLTIT=" & wURLTIT
	wURLB = wURLB & "&CAMC01=" & wCAMC01
	wURLB = wURLB & "&CAMC02=" & wCAMC02  
	wURLB = wURLB & "&URLD=" & "X001A103BS.ASP"  

	strCnn	= Application("XDTA300_ConnectionString")
	SQL = "SELECT B300100SPP "
	SQL = SQL & " FROM X300BF100 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300100CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " B300100NPE ='" & wCAMC02 & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	IF NOT rstQuery.EOF THEN
		wSPP = trim(rstQuery.Fields("B300100SPP"))
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
 'response.write wSPP 
 
 	wCLA004 = trim(Request.QueryString("CLA004"))
 	wCLA005 = trim(Request.QueryString("CLA005"))
 	wCLA006 = trim(Request.QueryString("CLA006"))
 	wCLA007 = trim(Request.QueryString("CLA007"))
 	'response.write "Inventario: " & wCLA005
	
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

<% IF LEN(TRIM(wCLA005)) > 0 THEN %>

<tr>
    <td width="100%" bgcolor="#FFFF40"  >
	<p align="center" style="margin-top: 4; margin-bottom: 4; margin-left: 4" >    
	
	<% IF Session("glTipoUsuario") = "C" THEN %> 
			<font color="#000000" style="font-size: 8pt; font-weight:700">
    DISP:  
     </font>  
      
     
			<font color="#FF0000" style="font-size: 8pt; font-weight:700">
    		Productos con Existencia.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
    		
    		<% END IF%>
    		
			<font color="#000000" style="font-size: 8pt; font-weight:700">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#FF0000" style="font-size: 9pt; font-weight:700"> 
				&quot;PRECIOS SUJETOS A CAMBIO SIN PREVIO AVISO&quot;</font> 

    <!--
    B/O:  
     </font>  
      
     
			<font color="#FF0000" style="font-size: 8pt; font-weight:700">
    		Backorders del Cliente.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
			<font color="#000000" style="font-size: 8pt; font-weight:700">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trans.:  
     </font>  
      
     
			<font color="#FF0000" style="font-size: 8pt; font-weight:700">
    		Material en transito por recibir en los proximos dias.</font><font color="#000000" style="font-size: 8pt; font-weight:700">
    		
    		-->
     </font>  
      
     
	</p> 
      </td> 
  </tr>


<% END IF %>
   
 <tr>
    <td width="99%" align= "center" style="border-left:1px solid #0066CC; border-right:1px solid #0066CC; border-top:1px solid #0066CC; ">
      <table border="0" width="919" bgcolor="#E9E9E9" style="border-width: 0px">
     
<% IF wSPP = "0" THEN  %>  
	<tr>
	
	<td width="300px">
	<table width="300px"><tr>
	<td width="4%" >
            <p align="right"><span class="auto-style1">Línea</span><font color="#000000" style="font-size: 8pt" >:</font></p>
          </td>
          <td align="right" >
			<SELECT name="FAMILIA" id="FAMILIA"  style="font-family: Tahoma; font-size: 8pt; width: 300px;" size="1" onchange="Cambiar_SubLinea();" ondblclick="Cambiar_SubLinea();"  onkeypress="return KeyPress(event);" > <!--onchange="Javascript:enviar();" ondblclick="Javascript:enviar();" -->
			<optgroup label="Lineas de Productos">
						<%
								
									wLIN = TRIM(Request.QueryString("FAMILIA"))
									
									IF LEN(TRIM(wLIN)) = 0 THEN
										wLIN = wCLA005	
									END IF 
														
																		
									IF Session("glMostrarTodasFamilias") = "0" THEN
 										SQL = " SELECT B300123FAM, B300120DEC FROM X300BQ123 " 																		
							 			SQL = SQL & " WHERE "
							 			SQL = SQL & " B300123CCI = '" & trim(Session("glCiaInternet")) & "' AND "
							 			SQL = SQL & " B300123CCL = '" & trim(Session("glUsuario")) & "' "
	 									SQL = SQL & " ORDER BY  B300120DEC "		
									ELSE
 										SQL = " SELECT B300120NPS, B300120DEC FROM X300BF120 " 																	
 										SQL = SQL & " WHERE "
							 			SQL = SQL & " B300120CCI = '" & trim(Session("glCiaInternet")) & "' "
 										SQL = SQL & " ORDER BY  B300120DEC " 					
									END IF 				
									'response.write sql														
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=""000"">TODAS</OPTION>" 										
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),55)							
										IF wLIN = wCOD THEN
										   wSEL = """ Selected "
										   'RESPONSE.WRITE wCLA005
										  ELSE 
										   wSEL = """"
										END IF 
										Response.write "<OPTION value=""" & wCOD & "" & wSEL & ">" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                    				LOOP
                    				rstQuery.CLOSE
                    				SET rstQuery = NOTHING																									
		
									%>
									
					</optgroup >
					</SELECT>
					</td></tr>
					
					
					<tr>
	<td width="4%" >
            <p align="right"><span class="auto-style1">Sub-Línea</span><font color="#000000" style="font-size: 8pt" >:</font></p>
          </td>
          <td align="right" >
			<SELECT name="SUBLINEA" id="SUBLINEA"  style="font-family: Tahoma; font-size: 8pt; width: 300px;" size="1" onkeypress="return KeyPress(event);" > <!--onchange="Javascript:enviar();" ondblclick="Javascript:enviar();" -->
			<optgroup label="Sub-Lineas de Productos">
						<%
																										
																		
									wLIN = TRIM(Request.QueryString("FAMILIA"))
									
									
									IF LEN(TRIM(wLIN)) = 0 THEN
										wLIN = wCLA005	
									END IF 


									SQL = " SELECT B300121NLP, B300121DEC FROM X300BF121 " 			
									SQL = SQL & " WHERE "
									SQL = SQL & " B300121CCI = '" & Session("glCiaInternet") & "' AND "			
									SQL = SQL & " B300121STS = '1' AND "																	
									SQL = SQL & " B300121NPS = '" & wLIN & "'" 
 									SQL = SQL & " ORDER BY  B300121DEC " 					

									'RESPONSE.WRITE SQL & "ok"
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									'Response.write "<OPTION value=""000"">       </OPTION>" 
									'IF Session("glMostrarTodasFamilias") <> "0" THEN
										Response.write "<OPTION value=""000"">TODAS</OPTION>" 
									'END IF										
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),55)							
										IF wCLA007 = wCOD THEN
										   wSEL = """ Selected "
										   'RESPONSE.WRITE wCLA005
										  ELSE 
										   wSEL = """"
										END IF 
										Response.write "<OPTION value=""" & wCOD & "" & wSEL & ">" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
		
									%>
									
</optgroup >
					</SELECT>
					</td></tr>
					</table>
          </td>
        
          <td width="53%"  >
          <p align="right">
			<span style="font-size: 8pt"><strong>Únicamente Productos con 
			Existencia</strong></span><font color="#000000" style="font-size: 8pt" >:</font></p>
          <!--<td width="12%" style="border-style: none; border-width: medium; " >
		
		  <INPUT NAME="CODIGO" size=12 value="<%'=Session("glBusqueda1")%>" tabindex="1" style="font-family: Tahoma; font-size: 8pt" >
          </td>
          
		
		-->
		<%
		IF LEN(TRIM(wCLA006)) = 0 THEN
			wCLA006 = false
		END IF 
		
		IF cbool(wCLA006) = true or wCLA006 = "1" THEN
			wCLA006 = " checked "
		END IF
		
		%>
           <td width="12%" style="border-style: none; border-width: medium; " >
            <p align="left"><font color="#000000" style="font-size: 8pt" >
			<input type="checkbox" name="PIN" value="1" <%=wCLA006 %>></font></p>
          </td>

          <td width="16%" align="right"  >
		  <INPUT type="text" NAME="DESCRIPCION" id="DESCRIPCION" size=35 value="<%=wCLA004%>" tabindex="1" style="font-size: 8pt; font-family: Tahoma; height: 29px; width: 173px;" >
          </td>
        
          	
        	<td width="11%" colspan=2 style="border-style: none; border-width: medium; ">
          <p align="center">
          <INPUT TYPE="submit" NAME="send" VALUE="Buscar" tabindex="2" style="font-family: Tahoma; font-size: 10pt; float:left; width:70; height:28px">          
          </td>
        </tr>
        <tr>
        <td  colspan="6">
         <p align="center">
			<font color="#000000" style="font-size: 8pt; font-weight:700">
			*Recuerde Indicar un Criterio o seleccionar una Línea para Buscar y 
			Agregar Productos</font></p>
          </td>
        </td>
        
        </tr>

<% ELSE %>

<tr>
          <td width="100%" style="border-style: none; border-width: medium; " >
            <p align="center">
			<font color="#000000" style="font-size: 8pt; font-weight:700">*Si 
			desea Agregar Productos debe Crear un Nuevo Pedido</font></p>
          </td>
                  
                  </tr>


<% END IF%>

      </table>
    </td>
  </tr>
  <tr>
<td align= "center" >
    <table bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" BORDER="0" cellspacing="1" cellpadding="3" width="919"  style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px"  >
    <TR>
		<!--<td CLASS="TDP" width="35%" align="center"><A href="<%=wURLP %>" target="main">Agregar Item</A></td>-->
		<td CLASS="TDP" width="50%" align="center" height="25"><A href="<%=wURLR %>" target="_parent">
		Encabezado de Pedidos</A></td>		  
		<td CLASS="TDP" width="50%" align="center"><A href="<%=wURLI %>" target="_blank">
		Imprimir</A></td>		  					
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
</td>
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
'RESPONSE.WRITE SQL
'RESPONSE.WRITE wCLA006


%>


<script language="javascript">

function Cambiar_SubLinea(){
	
	var url = 'X001A101_P.asp'
	url+= '?FAMILIA=' + document.FrmBuscar.FAMILIA.value;
	url+= '&CLA004=' + document.FrmBuscar.DESCRIPCION.value;
	url+= '&CLA006=' + document.FrmBuscar.PIN.checked;
	//url+= '&CLA007=' + document.FrmBuscar.SUBLINEA.value;
	url+= '&URLACT=<%=wURLACT%>'
	url+= '&URLIMP=<%=wURLIMP%>'	
	url+= '&URLPRI=<%=wURLPRI%>'	
	url+= '&URLTIT=<%=wURLTIT%>'
	url+= '&CAMC01=<%=wCAMC01%>'
	url+= '&CAMC02=<%=wCAMC02%>'
		
	

	
	window.open(url,'footer') 
	//document.parentWindow.location.href = url;   
	
}
</script>


</HTML>
