<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>



<script language="Javascript">

function enviar() {

	
	//if (document.FrmBuscar.FAMILIA.value == '000')  {
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

	wURLB = "X001X121.ASP?URLTIT=" & wURLTIT
	wURLB = wURLB & "&CAMC01=" & wCAMC01
	wURLB = wURLB & "&CAMC02=" & wCAMC02  
	wURLB = wURLB & "&URLD=" & "X001X121.ASP"  


	
	%>
	 
<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLB%>" target="main1" >	 
	 <BODY   topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">
<!--ONLOAD="document.FrmBuscar.CODIGO.focus()"-->
  
  



<table border="0"  align="center"  width="919" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF" align="left" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">

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
    <td width="919" align= "center" style="border-left:1px solid #0066CC; border-right:1px solid #0066CC; border-top:1px solid #0066CC; border-button:1px solid #0066CC;">
      <table border="0" width="100%" bgcolor="#E9E9E9" style="border-width: 0px">
        <tr>
          <td width="60%" style="border-style: none; border-width: medium; " rowspan="4" >
            <p align="center">
			<font color="#000000" style="font-size: 8pt; font-weight:700">*Para 
			Visualizar </font>
			<span style="font-weight: 700; font-size: 8pt">Clientes debe colocar el código o parte 
			del nombre en la caja de texto y presionar el Botón &quot;Buscar&quot;</span></p>
          </td>
               </tr>
        <tr>
        
          <td width="10%" style="border-style: none; border-width: medium; " >
            <p align="right"><font size="2" style="font-size: 8pt">Cliente:</font></td>
          <td align="right" style="border-style: none; border-width: medium; "  >
				<SELECT name="FAMILIA" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt" size="1" onchange="Javascript:enviar()" ondblclick="Javascript:enviar()" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									wCCI = Session("glCiaInternet") 
									wCIA = Session("glCia") 
																		
									SQL = " SELECT A300002CCL, A300002RSO FROM X300AF002 " 	
									SQL = SQL & " WHERE "
									SQL = SQL & " A300002CCI = '" & wCCI & "' AND "
									SQL = SQL & " A300002CIA = '" & wCIA & "' AND "
									SQL = SQL & " A300002NIC = 'D001' "
									if Session("glTipoUsuario") = "C" then
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
									If Session("glTipoUsuario") <> "C" then
										Response.write "<OPTION value=""000"">TODOS</OPTION>" 	
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
										Response.write "<OPTION value=""" & wCOD & wSEL & """ >" & wCOD & "-" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
									

					</SELECT>

			
			</td>
        
        </tr>
        <tr>
        
          <td width="10%" style="border-style: none; border-width: medium; " >
            &nbsp;</td>
          <td align="right" style="border-style: none; border-width: medium; "  >
			<input type="text" name="DES" size="38"></td>
        
        </tr>
        <tr>
        
          <td width="10%" style="border-style: none; border-width: medium; " >
            &nbsp;</td>
          <td align="right" style="border-style: none; border-width: medium; " >
          <% IF Session("glTipoUsuario") = "A" AND Session("glCiaInternet") = "CAR" THEN %>
          	<input type="button" ="Lista RadarSystems" value="Lista RadarSystems" onclick="Javascript:window.open('X001X121_E.asp','_blank');">
          <% END IF %>
			<input type="button" name="Buscar" value="Buscar" onclick="Javascript:enviar()" ></td>
        
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