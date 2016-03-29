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

#MODELO option {padding:5px}
[selected] {
	color:#f00;
	font-weight:bold;
}


.auto-style1 {
	font-size: 8pt;
}
.auto-style2 {
	font-size: 8pt;
}


</style>

</head>

<script language="javascript">

function hideDiv() {
	
	if (document.getElementById) { // DOM3 = IE5, NS6
		document.getElementById('Mensaje').style.visibility = 'hidden';
	}
	else {
		if (document.layers) { // Netscape 4
			document.hideShow.visibility = 'hidden';
		}
		else { // IE 4
			document.all.hideShow.style.visibility = 'hidden';
		}
	}
}

function showDiv() {

	if (document.getElementById) { // DOM3 = IE5, NS6
		document.getElementById('Mensaje').style.visibility = 'visible';
	}
	else {
		if (document.layers) { // Netscape 4
			document.hideShow.visibility = 'visible';
		}
		else { // IE 4
			document.all.hideShow.style.visibility = 'visible';
		}
	}
}


function enviar() {

	
	if (document.FrmBuscar.FAMILIA.value == '000' && document.FrmBuscar.DESCRIPCION.value == '') {
		alert('Indique un Criterio de Busqueda o Seleccione una Linea');
		return false
	}
	else{
		document.FrmBuscar.submit(); 
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
	wPARCON = Request.QueryString("PARCON")
	
	
	wURL = wURLACT & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 & "&CLA003="
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&CAMC01=" & wCAMC01
	wURLX = wURLX & "&CAMC02=" & wCAMC02


	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = wURLX & "&STSIMP=S" 
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

	wURLB = "X001X100.ASP?URLTIT=" & wURLTIT
	wURLB = wURLB & "&CAMC01=" & wCAMC01
	wURLB = wURLB & "&CAMC02=" & wCAMC02  
	wURLB = wURLB & "&PARCON=" & wPARCON  
	wURLB = wURLB & "&URLD=" & "X001X100.ASP"  
	'response.write Session("glMostrarTodasFamilias")	
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	wCLA004 = trim(Request.QueryString("CLA004"))
 	wCLA005 = trim(Request.QueryString("CLA005"))
 	wCLA006 = trim(Request.QueryString("CLA006"))
 	wCLA007 = trim(Request.QueryString("CLA007"))
 
	Response.write wPARCON

	
	%>
	 <BODY   topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >	 
<FORM NAME="FrmBuscar" METHOD="post"  ACTION="<%=wURLB%>" target="main1"   onsubmit="return enviar()">	 

<!--ONLOAD="document.FrmBuscar.CODIGO.focus()"-->
  
    


<table border="0" width="919" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF" align="center" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
<% IF wPARCON <> "1" THEN %>
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
    		
			<font color="#000000" style="font-size: 10pt; font-weight:700">
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#FF0000" style="font-size: 9pt; font-weight:700"> 
				&quot;PRECIOS SUJETOS A CAMBIO SIN PREVIO AVISO&quot;</font></p> 
    <!--  <table border="0" width="100%" bgcolor="#FE9900">
        <tr>
        <td width="10%" align="right">
		<IMG alt ="" border=0 src="images/Buscar2.ico" >
		</td>
		<td width="90%" >
		<p align="left"><font color="white">
		<%=wTITULO%></font></p>
		</td>
		</tr>
		</table>
	</td>
	</tr>		-->
  </td> 
  </tr>
  <% END IF %>
  <tr>
    <td WIDTH="919" align= "center" style="border-left:1px solid #0066CC; border-right:1px solid #0066CC; border-top:1px solid #0066CC; border-button:1px solid #0066CC;">
      <table border="0" width="100%" bgcolor="#E9E9E9" style="border-width: 0px">
        <tr>
        
        	<td width="300px">
	<table width="300px"><tr>
	<td width="4%" >
            <p align="right"><span class="auto-style1">Línea</span><font color="#000000" style="font-size: 8pt" >:</font></p>
          </td>
          <td align="right" >
			<SELECT name="FAMILIA" id="FAMILIA"  style="font-family: Tahoma; font-size: 8pt; width: 300px;" size="1"  onkeypress="return KeyPress(event);" > <!--onchange="Cambiar_SubLinea();" ondblclick="Cambiar_SubLinea();" onchange="Javascript:enviar();" ondblclick="Javascript:enviar();" -->
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
					
				<!--	
					<tr>
	<td width="4%" >
            <p align="right"><span class="auto-style1">Sub-Línea</span><font color="#000000" style="font-size: 8pt" >:</font></p>
          </td>
          <td align="right" >
			<SELECT name="SUBLINEA" id="SUBLINEA"  style="font-family: Tahoma; font-size: 8pt; width: 300px;" size="1" onkeypress="return KeyPress(event);" onchange="Javascript:enviar();" ondblclick="Javascript:enviar();" >  
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
					</td></tr>-->
					</table>
          </td>
          
          
          <td rowspan="2" valign="top">
          
          <table border="0" cellspacing="2" cellpadding="0" width="98%" height="100%">
       <!--
          <tr>
          
          <td width="4%"  height="30px">
            <p align="right"><span class="auto-style1">Vehiculo</span><font color="#000000" style="font-size: 8pt" >:</font></p>
          </td>
          <td align="right" >
			<SELECT name="MODELO" id="MODELO"  style="font-family: Tahoma; font-size: 8pt; width: 200px;" size="1" onchange="Javascript:enviar();" ondblclick="Javascript:enviar();" >  
			<optgroup label="Vehiculos">
						<%
																										
																		
									wCLA008 = TRIM(Request.QueryString("MODELO"))
									
									
								
									SQL = " SELECT B300124CGR, B300124DEC FROM X300BF124 " 			
									SQL = SQL & " WHERE "
									SQL = SQL & " B300124CCI = '" & Session("glCiaInternet") & "' AND "			
									SQL = SQL & " B300124STS = '1' "																	
									SQL = SQL & " ORDER BY  B300124DEC " 					

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
										IF wCLA008 = wCOD THEN
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
					</td>
          
          
          </tr>-->
          <tr>
          <td colspan="2" height="35px" valign="middle" >
          <table border="0" cellspacing="0" cellpadding="0" width="100%">
          <tr>
          <td style="border-style: none; border-width: medium; width: 56%;" valign="middle" >
          <% IF wPARCON <> "1" THEN %>
            <p align="right">
			<span class="auto-style2"><strong>Únicamente Productos con 
			Existencia</strong></span><font color="#000000" class="auto-style2" ><strong>:</strong></font></p>
		  <% ELSE %>
		  <div id="Mensaje"  style="z-index: 1; visibility: visible" >
			 <p align="center" >
			 <img src=images/loadinfo.net.gif> 
			<font color="#000000" style="font-size: 8pt; font-weight:700">*Por 
			 favor espere hasta que los Productos se muestren en pantalla</font></p>		
			</div>
		  <% END IF %>
          </td>
          <!--<td width="12%" style="border-style: none; border-width: medium; " >
		
		  <INPUT NAME="CODIGO" size=12 value="<%'=Session("glBusqueda1")%>" tabindex="1" style="font-family: Tahoma; font-size: 8pt" >
          </td>
          

		-->	 
          <td width="12%" style="border-style: none; border-width: medium; " >
            <p align="left"><font color="#000000" style="font-size: 8pt" >
             <% IF wPARCON <> "1" THEN %>
             
             		<%
		IF LEN(TRIM(wCLA006)) = 0 THEN
			wCLA006 = false
		END IF 
		
		IF cbool(wCLA006) = true or wCLA006 = "1" THEN
			wCLA006 = " checked "
		END IF
		
		%>
 
 			<input type="checkbox" name="PIN" value="1" <%=wCLA006%> ></font></p>
			     <% END IF %>
   
		  </td>
		  
		  </tr>
          </table> 
          </td>
          </tr>
          </table>
          
          </td>

          
		  
          <td width="14%" style="border-style: none; border-width: medium; " >
		 <INPUT type="text" class="tb1" NAME="DESCRIPCION" size=20 value="<%=wCLA004%>" tabindex="1" style="font-size: 8pt; font-family: Tahoma;height: 29px">    
      </td>
        
          <td width="10%" colspan=2 style="border-style: none; border-width: medium; ">
          <p align="center">
          <INPUT TYPE="button" onclick="Javascript:enviar();"  NAME="send" VALUE="Buscar" tabindex="2" style="font-family: Tahoma; font-size: 10pt; float:left; width:70; height:28px">          
          </td>
        </tr>
        <tr>
        <td colspan="6" height="25" ><p align="center">
			<font color="#000000" style="font-size: 8pt; font-weight:700">
			*Recuerde Indicar un Criterio o seleccionar una Línea para Buscar 
			Productos</font></p>
</td>
        </tr>
      </table>
    </td>
  </tr>
  </table>


	
	



</FORM> 	
</body>

<script language="javascript">

function Cambiar_SubLinea(){
	
	var url = 'X001X100_P.asp'
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

<% IF wPARCON = "1" THEN %>

	<SCRIPT language="javascript"  >
		
		enviar();
	
	</SCRIPT>

<% END IF %>


</HTML>