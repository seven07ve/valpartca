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

function Validar() {


	var ven = FrmBuscar.VENDEDORES.value 
	var par = FrmBuscar.PAR.value 
	var fam = FrmBuscar.FAMILIA.value 

	if ((par=='') && (ven=='000') && (fam=='999')) {
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


<!--#include file="X001Z001.INC"-->

<%

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wCAMC01 = Request.QueryString("CAMC01")
	wCAMC02 = Request.QueryString("CAMC02")
	wCVE = trim(Request.QueryString("CVE"))
	wPAR = trim(Request.QueryString("PAR"))
	'response.write "Vendedor: " & wCVE
	'response.write "PARAMETRO: " & wPAR
	
	strCnn	= Application("XDTA300_ConnectionString")

	
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
	wURLI = wURLI & "&PAR=" & wPAR
	
	wURLE = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLE = wURLX & "&STSIMP=E"  
	wURLE = wURLE & "&IMP=S"
	wURLE = wURLE & "&CVE=" & wCVE
	wURLE = wURLE & "&PAR=" & wPAR
	
	wURLT = wURLX & "&STSIMP=E" 

	
	wURLP = wURLPRI & "&PARBUS=S"
	
	wURLP = "X001A103B.ASP" & "?URLTIT=" & wURLTIT	
	wURLP = wURLP & "&CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02
	
	
	wURLR = Session("glUrlRegresar")
	
	
	wURLB = "X001X132.ASP?URLTIT=" & wURLTIT
	wURLB = wURLB & "&CAMC01=" & wCAMC01
	wURLB = wURLB & "&CAMC02=" & wCAMC02  
	wURLB = wURLB & "&URLD=" & "X001X120.ASP"  
	wURLB = wURLB & "&CVE=" & wCVE
	wURLB = wURLB & "&PAR=" & wPAR

'response.write wURLI

	
	%>
	 
<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLB%>" target="main1" onSubmit="javascript:return Validar()" >	 
	 <BODY bgcolor="<%=Request.Cookies("CAR")("Color1")%>" bottommargin="0"  align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0"  >
<!--ONLOAD="document.FrmBuscar.CODIGO.focus()"-->
         
         
    


<table width="919" align="center"  border="0" cellpadding="0" cellspacing="0"  >


<tr>
<td align="center">


<table border="0" width="100%" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF" align="left" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">

    
  <tr>
    <td WIDTH="919" align= "center" style="border-left:1px solid #0066CC; border-right:1px solid #0066CC; border-top:1px solid #0066CC; border-button:1px solid #0066CC;">
         
	<table align="center"  BORDER="1" WIDTH="100%">
  
        <tr>
          <td  CLASS="TDP" width="60%" style="border-style: none; " rowspan="3" >
            <p align="center">
        <font color="#000000" style="font-size: 8pt; font-weight:700">*Para 
			Visualizar los Pedidos seleccione y presione el Botón &quot;Buscar&quot;</span>    
			
			</p>
          </td>
<tr>         
        <% If Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G" or Session("glTipoUsuario") = "U" then %>        

	<td CLASS="TDP" width="10%" style="border-style: none; " >
            <p align="right"><span style="font-size: 8pt">Vendedor:</span></p>
          </td>
          <td CLASS="TDP"  align="right" style="border-style: none; "  >
			<SELECT name="VENDEDORES" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:270" size="1" ondblclick="Javascript:enviar2();" onChange="Javascript:enviar2();"  > 
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
										wDES = ucase(LEFT(trim(rstQuery.Fields("A300020NOM")),45))
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
          </td>
        
        <% End If %>
</tr>
          <td  CLASS="TDP" width="10%" style="border-style: none; " >
            <p align="right"><font color="#000000" style="font-size: 8pt" >Cliente:</font></p>
          </td>
          <td  CLASS="TDP" align="right" style="border-style: none; " >
			<SELECT name="FAMILIA" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:270" size="1" onchange="enviar();" ondblclick="enviar();" > 
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
										'SQL = SQL & "  AND "
										'SQL = SQL & "  Z300006PSU = '" & Session("glUsuario") & "' "		
									end if 																	
									SQL = SQL & " ORDER BY  A300002CCL " 																		
									'Response.write sql
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									If Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "CP" then
										Response.write "<OPTION value=999>Todos</OPTION>" 	
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
        </tr>
        <tr>
        <td CLASS="TDP" style="border-style: none; border-width: medium; " >
        
        <p align="center">&nbsp;</td>
        <td CLASS="TDP" style="border-style: none; border-width: medium; " >&nbsp;
        </td>
        <td CLASS="TDP" style="border-style: none; border-width: medium; ">
        <input type="text" size="40" name="PAR" value="<%=wPAR%>"  > 
        </td>
          
        </tr>
        <tr>
        
          
          <td  CLASS="TDP" align="right" style="border-style: none; border-width: medium; " colspan=3 >
			<span style="font-weight: 700; font-size: 8pt">

			<input type="button" name="Buscar" value="Imprimir" onClick="window.open('<%=wURLI%>&PAR='+document.FrmBuscar.PAR.value,'_blank','menubar=0,resizable=1,location=0,status=0,scrollbars=1,directories=0');">&nbsp;
			<input type="button" name="Exportar" value="Exportar" onClick="window.open('<%=wURLE%>','_blank','menubar=0,resizable=1,location=0,status=0,scrollbars=1,directories=0');">&nbsp;
			<input type="submit" name="Buscar" value="Buscar" ></span></td>
        
  </tr>
      </table>
    </td>
  </tr>
  </table>


	
	
</td> 
</tr> 
</table>
   


  
</FORM> 	
</body>

<script language="Javascript">

function enviar2() {



	var url = "X001X132_P.asp?URLACT=<%=wURLACT%>&URLIMP=<%=wURLIMP%>&URLPRI=<%=wURLPRI%>&URLTIT=<%=wURLTIT%>&CAMC01=<%=wCAMC01%>&CAMC02=<%=wCAMC02%>&PAR=<%=wPAR%>&CVE="+document.FrmBuscar.VENDEDORES.value
	
	
	window.open(url,"footer");
	
	
}

</script>


<% 
'RESPONSE.WRITE Session("glBusqueda3") & "##"
%>

</HTML>