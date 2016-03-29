<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>

<script language="Javascript">

function enviar() {

	
	//if (document.FrmBuscar.FAMILIA.value == '000') {
		//alert('Seleccione una Familia');
	//}
	//else{
		document.FrmBuscar.submit(); 
	//}
	
	
}

</script>



<%

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wCAMC01 = Request.QueryString("CAMC01")
	wCAMC02 = Request.QueryString("CAMC02")
	wCVE = trim(Request.QueryString("CVE"))
	
	'response.write "Vendedor: " & wCVE
	
	wURL = wURLACT & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 & "&CLA003="
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&CAMC01=" & wCAMC01
	wURLX = wURLX & "&CAMC02=" & wCAMC02


	wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = wURLX & "&STSIMP=S" 
	wURLT = wURLX & "&STSIMP=E" 
	wURLI = wURLI & "&IMP=S"
	wURLI = wURLI & "&CVE=" & wCVE
	
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

	wURLB = "X001X128.ASP?URLTIT=" & wURLTIT
	wURLB = wURLB & "&CAMC01=" & wCAMC01
	wURLB = wURLB & "&CAMC02=" & wCAMC02  
	wURLB = wURLB & "&URLD=" & "X001X120.ASP"  
	wURLB = wURLB & "&CVE=" & wCVE

'response.write wURLI

	
	%>
	 
<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLB%>" target="main1" >	 
	 <BODY   topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<!--ONLOAD="document.FrmBuscar.CODIGO.focus()"-->
  
<table border="0" width="919" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF" align="center" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">

    <!--<td width="100%" >
     
      <table border="0" width="100%" bgcolor="#FE9900">
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
  <tr>
    <td WIDTH="919" align= "center" style="border-left:1px solid #0066CC; border-right:1px solid #0066CC; border-top:1px solid #0066CC; border-button:1px solid #0066CC;">
      <table border="0" width="100%" bgcolor="#E9E9E9" style="border-width: 0px">
        <tr>
          <td width="60%" style="border-style: none; border-width: medium; " rowspan="3" >
            <p align="center">
			<font color="#000000" style="font-size: 8pt; font-weight:700">*Para 
			Visualizar el Estado de Cuenta</font><span style="font-weight: 700; font-size: 8pt"> puede 
			utilizar la lista de clientes y presionar el Botón &quot;Buscar&quot;</span></p>
          </td>
          <!--<td width="12%" style="border-style: none; border-width: medium; " >
		
		  <INPUT NAME="CODIGO" size=12 value="<%'=Session("glBusqueda1")%>" tabindex="1" style="font-family: Tahoma; font-size: 8pt" >
          </td>-->
          
          <td width="10%" style="border-style: none; border-width: medium; " >
	<% If Session("glTipoUsuario") = "A" then %>        
            <p align="right"><span style="font-size: 8pt">Vendedor</span><font color="#000000" style="font-size: 8pt" >:</font></p>
    <% END IF %>
          </td>
          <td align="right" style="border-style: none; border-width: medium; "  >
          
    <% If Session("glTipoUsuario") = "A" then %>              
			<SELECT name="VENDEDORES" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:300" size="1" ondblclick="Javascript:enviar2();" onchange="Javascript:enviar2();"  > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									wCCI = Session("glCiaInternet") 
									wCIA = Session("glCia") 
																	
									wCVE = TRIM(Request.QueryString("CVE"))	

	
									SQL = " SELECT A300020CVE, A300020NOM FROM X300AF020 " 	
									SQL = SQL & " WHERE "
									SQL = SQL & " A300020CCI = '" & wCCI & "' AND "
									SQL = SQL & " A300020CIA = '" & wCIA & "' "
									SQL = SQL & " ORDER BY  A300020NOM " 																		
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									If Session("glTipoUsuario") <> "C" then
										Response.write "<OPTION value=000>Todos</OPTION>" 	
									End If 									
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300020CVE"))
										wDES = LEFT(trim(rstQuery.Fields("A300020NOM")),45)							
										IF wCVE = wCOD THEN
										   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL = ""
										END IF 
										Response.write "<OPTION value=" & wCOD & wSEL & " >" & wCOD & "-" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
									

					</SELECT>
			<% End If %>
          </td>
        </tr>
        
        
        
          <td width="10%" style="border-style: none; border-width: medium; " >
            <p align="right"><font color="#000000" style="font-size: 8pt" >
			Cliente:</font></p>
          </td>
          <td align="right" style="border-style: none; border-width: medium; "  >
			<SELECT name="FAMILIA" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:300" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:270" size="1" onchange="enviar();" ondblclick="enviar();" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									wCCI = Session("glCiaInternet") 
									wCIA = Session("glCia") 
									
									wCVE = TRIM(Request.QueryString("CVE"))	
																		
									SQL = " SELECT A300002CCL, A300002RSO FROM X300AF002 " 	
									SQL = SQL & " WHERE "
									SQL = SQL & " A300002CCI = '" & wCCI & "' AND "
									SQL = SQL & " A300002CIA = '" & wCIA & "' AND "
									SQL = SQL & " A300002NIC = 'D001' "
									if len(trim(wCVE)) > 0 AND wCVE <> "000" then
										SQL = SQL & " AND "
										SQL = SQL & " A300002CVE = '" & wCVE & "' "
									end if
									if Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "CP" then
										SQL = SQL & " AND "
										SQL = SQL & " A300002CCL = '" & Session("glUsuario") & "' "
									end if
									if Session("glTipoUsuario") = "V" then
										SQL = SQL & "  AND "
										SQL = SQL & " A300002CVE = '" & Session("glCodVendedor") & "' "
									end if
								    if Session("glTipoUsuario") = "U" then
										SQL = SQL & "  AND "
										SQL = SQL & "  Z300006PSU = '" & Session("glUsuario") & "' "		
									end if 																	
									SQL = SQL & " ORDER BY  A300002CCL " 																		
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									If Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "CP" then
										Response.write "<OPTION value=999>Todos</OPTION>" 	
										Response.write "<OPTION value=000>Todos Resumen</OPTION>" 	
									End If 									
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300002CCL"))
										wDES = LEFT(trim(rstQuery.Fields("A300002RSO")),45)							
										''IF TRIM(Session("glBusqueda3")) = wCOD THEN
										''   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										 '' ELSE 
										   wSEL = ""
										''END IF 
										Response.write "<OPTION value=" & wCOD & wSEL & " >" & wCOD & "-" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
									

					</SELECT>
          </td>


          
        

<tr>
	<td width="14%" style="border-style: none; border-width: medium; " >
            <p align="right"><font color="#000000" style="font-size: 8pt" ></font></p>
          </td>
          <td width="16%" style="border-style: none; border-width: medium; " align="right"   >
          <% If Session("glTipoUsuario") = "A" then %>
		  <INPUT NAME="DES" size=15 value="<%'=Session("glBusqueda2")%>" tabindex="1" style="font-size: 8pt; font-family: Tahoma; width:300">
          <% END IF %>
          </td>
        
          <!--<td width="11%" colspan=2 style="border-style: none; border-width: medium; ">
          <p align="center">
          <INPUT TYPE="submit" NAME="send" VALUE="Buscar y Agregar" tabindex="2" style="font-family: Tahoma; font-size: 10pt; float:left; width:116; height:26">          
          </td>-->
        </tr>
        <tr>
        
          <td width="10%" style="border-style: none; border-width: medium; " >
            &nbsp;</td>
            <td width="10%" style="border-style: none; border-width: medium; " >
            &nbsp;</td>
          <td align="right" style="border-style: none; border-width: medium; "  >
			<span style="font-weight: 700; font-size: 8pt">
			
			<input type="button" name="Imprimir" value="Imprimir" onclick="javascript:window.open('<%=wURLI%>');" >			
			<input type="button" name="Buscar" value="Buscar" onclick="enviar();" ></span></td>
        
        </tr>
      </table>
    </td>
  </tr>
  </table>


	

</FORM> 	
</body>

<script language="Javascript">

function enviar2() {



	var url = "X001X128_P.asp?URLACT=<%=wURLACT%>&URLIMP=<%=wURLIMP%>&URLPRI=<%=wURLPRI%>&URLTIT=<%=wURLTIT%>&CAMC01=<%=wCAMC01%>&CAMC02=<%=wCAMC02%>&CVE="+document.FrmBuscar.VENDEDORES.value;
	
	
	window.open(url,"footer");
	
	
}

</script>


<% 
'RESPONSE.WRITE Session("glBusqueda3") & "##"
%>

</HTML>