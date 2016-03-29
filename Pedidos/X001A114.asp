<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link href="calendario/styles.css" rel="stylesheet" type="text/css">
<link href="calendario/calendar.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendario/js/mootools.js"></script>
<script type="text/javascript" src="calendario/js/calendar.js"></script>


<script type="text/javascript">

    window.addEvent('domready', function() { myCal = new Calendar({ fecha: 'd/m/Y' }); });
    
    
    function mostrar_fecha(){
    	//alert(document.getElementById("FDE").style.visibility);
    
    //	if (document.frmGral.MOT.value=='2'){
		
	//		document.getElementById('FDE').style.visibility = 'hidden';    
    	
	//	}    
    
    }
        
</script>

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Z001.INC"-->
</HEAD>

	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCLABUS = trim(Request.QueryString("CLABUS"))
	wERROR  = trim(Request.QueryString("ERROR"))	
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  align=""center"" style=""text-align: center"" topmargin=""0"" leftmargin=""19"" rightmargin=""0"" >"
	'onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & "
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
		
	wTIT = "PQR" 
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wSTSPED = TRIM(Request.QueryString("STSPED"))

	wCTR = TRIM(Request.QueryString("CTR"))
	wCGR = TRIM(Request.QueryString("CGR"))
	wOBS = TRIM(Request.QueryString("OBS"))
	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
    wDisabled = ""	
    
    wFDE = Right("0" & day(date),2) & "/" &  Right("0" & month(date),2) & "/" & year(date)

		
	IF Session("glTipoUsuario") = "C" THEN
'	   wB300100CCL = Session("glUsuario")
'	   wA300002RSO = Session("glUsuarioNombre")
	END IF 

	
	wProceso = "Agregar"
	
	wNRO = "Nuevo"
	wE300001CTR = "0"
	IF LEN(TRIM(wCTR)) > 0 THEN
		wE300001CTR = wCTR
	END IF 
	wE300001CGR = "0"
	IF LEN(TRIM(wCGR)) > 0 THEN
		wE300001CGR = wCGR
	END IF 
	IF LEN(TRIM(wOBS)) > 0 THEN
		wE300001OBS = wOBS
	END IF 
	'response.write wE300001CGR & " -" & wCGR 
	wSEL = " selected"

	strCnn	= Application("XDTA300_ConnectionString")
    
	IF LEN(TRIM(wCLA002)) > 0 THEN
		wNRO = wCLA002
		wProceso = "Actualizar"
		
		SQL = "SELECT E300001STS, E300001CTR, E300001OBS, E300001SPP, "
		SQL = SQL & " E300001CRE, E300001CGR, E300001COG, E300001SCO, "
		SQL = SQL & " ISNULL(E300001FDE, getdate()) AS E300001FDE "
		SQL = SQL & " FROM X300EF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " E300001CCI ='" & wCCI & "' AND "
		SQL = SQL & " E300001CIA ='" & wCIA & "' AND "
		SQL = SQL & " E300001CCL ='" & wCLA001 & "' AND "
		SQL = SQL & " E300001COD ='" & wCLA002 & "'"
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wE300001STS = trim(rstQuery.Fields("E300001STS"))
			wE300001CTR = trim(rstQuery.Fields("E300001CTR"))
			wE300001OBS = trim(rstQuery.Fields("E300001OBS"))
			wE300001SPP = trim(rstQuery.Fields("E300001SPP"))
			wE300001CRE = trim(rstQuery.Fields("E300001CRE"))			
			wE300001CGR = trim(rstQuery.Fields("E300001CGR"))			
			wE300001COG = trim(rstQuery.Fields("E300001COG"))
			wE300001SCO = trim(rstQuery.Fields("E300001SCO"))
			wFDE = trim(rstQuery.Fields("E300001FDE"))	
					
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		wDisabled = " disabled"
		wCGR = wE300001CGR
		wCTR = wE300001CTR 
		
		wFDE = Right("0" & day(wFDE),2) & "/" &  Right("0" & month(wFDE),2) & "/" & year(wFDE)
		
		wSELUNO1 = "": wSELDOS1 = "": wSELTRES1 = ""
		
		IF wE300001STS = "1" THEN
			wSELUNO1 = " selected"
		END IF 
		
		IF wE300001STS = "2" THEN
			wSELDOS1 = " selected"
		END IF 
		
		IF wE300001STS = "3" THEN
			wSELTRES1 = " selected"
		END IF 
		
		wSELUNO2 = "": wSELDOS2 = "": 
		
		IF wE300001SCO = "1" THEN
			wSELUNO2 = " selected"
		END IF 
		
		IF wE300001SCO = "2" THEN
			wSELDOS2 = " selected"
		END IF 
	
	END IF  
		
	
	
	SQL = "SELECT A300002RSO "
	SQL = SQL & " FROM X300AF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300002CCI ='" & wCCI & "' AND "
	SQL = SQL & " A300002CIA ='" & wCIA & "' AND "
	SQL = SQL & " A300002CCL ='" & wCLA001 & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wA300002RSO = trim(rstQuery.Fields("A300002RSO"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	


	'wERROR = "Cliente no Existe"

	wURL = "X001A114_AS.ASP"
	
	
	
	
	
	%>

	<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" onsubmit="return validar();"  >

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">



    
    
    <p style="margin-top: 0">&nbsp;</p>

    
    <table align="center" BORDER="1" WIDTH="650" cellspacing="0" cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="8"   >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="30" >
			<p CLASS="P1" style="margin-top: 3px; margin-bottom: 3px" ><%= wTIT %></p></td>		  
		 </TR>	
 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Nro.:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1"><%=wNRO%>
          
    
		  
          </P></td>
         </tr>

		 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Cliente:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1"><%=wCLA001%> - <%=wA300002RSO%>
          
          <font color="#FF0000"><b><%=wERROR%></b></FONT>
		  
          </P></td>
         </tr>
         
      



		 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Tipo:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="MOT" onchange="javascript:cambiar_grupos();" <%=wDisabled%>>
				<option value="0" >Seleccione...</option>

				<%
				
									strCnn	= Application("XDTA300_ConnectionString")
									
	                                SQL = "SELECT A300050CTR, A300050DEL, A300050STS "
							        SQL = SQL & " FROM X300AF050 "
        							Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn									
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(2))
										wDES = LEFT(trim(rstQuery.Fields(1)),25)							
										IF TRIM(wE300001CTR) = wCOD THEN
										   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL = ""
										END IF 
										Response.write "<OPTION value=" & wCOD & wSEL & " >" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
				%>
				
				</SELECT>
          </td>
         </tr>
         
         <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Grupo de 
		  Código:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="CGR" onchange="javascript:cambiar_codigos();" <%=wDisabled%>>
					<option value="0" >Seleccione...</option>

				<%
				
								
									
	                                SQL = "SELECT A300035CGR, A300035DGR "
							        SQL = SQL & " FROM X300AF035 "
							        SQL = SQL & " WHERE "
							        SQL = SQL & " A300035CAT ='D' AND "
							        SQL = SQL & " A300035CCI ='" & wCCI & "' AND "
							        SQL = SQL & " A300035CGR IN ( SELECT B300127CGR "
							        SQL = SQL & " FROM X300BF127 WHERE  "
							        SQL = SQL & " B300127CCI ='" & wCCI & "' ) "
							        'ACTIVAR PARA PRUEBAS INTEGRALES
							        'SQL = SQL & " AND LEFT(A300035CPC,1) = '" & wCTR & "'"
							        SQL = SQL & " GROUP BY A300035CGR, A300035DGR "
							        'RESPONSE.WRITE SQL 
        							Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn									
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = trim(rstQuery.Fields(1))
										IF TRIM(wE300001CGR) = wCOD THEN
										   wSEL2 = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL2 = ""
										END IF 
										Response.write "<OPTION value=" & wCOD & wSEL2 & " >" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
				%>
				</SELECT>			
          </td>
         </tr>
         
          <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Código:</p>
			  </td>
          <td class="TDD" width="68%" >
				<select size="1" name="COG" <%=wDisabled%>>
					<option value="0">Seleccione...</option>

				<%
				
								
									
      	                            SQL = "SELECT A300035COD, A300035DCO "
							        SQL = SQL & " FROM X300AF035 "
							        SQL = SQL & " WHERE "
							        SQL = SQL & " A300035CAT ='D' AND "
							        SQL = SQL & " A300035CCI ='" & wCCI & "' AND "
							        SQL = SQL & " A300035CGR ='" & wCGR & "'" 
							        SQL = SQL & " GROUP BY A300035COD, A300035DCO "
        							Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn									
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = trim(rstQuery.Fields(1))							
										IF TRIM(wE300001COG) = wCOD THEN
										   wSEL3 = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL3 = ""
										END IF 
										Response.write "<OPTION value=" & wCOD & wSEL3 & " >" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
				%>
				</SELECT>			
          </td>
         </tr>
    
         <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Observación:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1">
          
		   <textarea rows="2" cols="16" name="OBS" style="height:74;width:400;"><%=wE300001OBS%></textarea> 
          </P></td>
         </tr>




		<% If Session("glTipoUsuario") <> "C" AND wPROCESO ="Actualizar" AND wE300001SPP = "1" Then %>	
		 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Estatus:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="STS" DISABLED>
				<option value="1" <%=wSELUNO1%>>Abierto</option>
				<option value="2" <%=wSELDOS1%>>Proceso</option>
				<option value="3" <%=wSELTRES1%>>Cerrado</option>
				</select> 
          </td>
         </tr>
         <!--
         <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Comentario:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1">
          
		   <textarea rows="2" cols="16" name="CRE" style="height:74;width:400;"><%=wE300001CRE%></textarea> 
          </P></td>
         </tr>-->
		<% End If %>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center"  >
          
          
		  <INPUT TYPE="Hidden" NAME="CLA001" value="<%=wCLA001%>">          
		  <INPUT TYPE="Hidden" NAME="CLA002" value="<%=wCLA002%>">          
		  <INPUT TYPE="Hidden" NAME="STSPED" value="<%=wSTSPED%>">        		  
		  
          <% If wPROCESO ="Actualizar" AND wE300001SPP = "1" Then %>
			<input value="Regresar" type="button" onclick="javascript:history.back();"
          <% ELSE %>
			          <!--#include file="X001Y005.PRC"-->          
          <%END IF %>
          
         
 </td>
         </tr>

	</table>

 </td>
         </tr>

	</table>
	<p align="center">
		<p>&nbsp;</td>
	</tr>
	</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
</table>
</FORM>


<SCRIPT LANGUAGE="javascript">

	function validar(){
	
		if (document.frmGral.MOT.value=='0'){   
			alert("Debe Seleccionar el Tipo de PQR");
			document.frmGral.MTO.focus();  
			return false
		
		}else{		
	
			if (document.frmGral.CGR.value=='0'){   
				alert("Debe Seleccionar el Grupo");
				document.frmGral.CGR.focus();  
				return false
		
			}else{
	
				if (document.frmGral.COG.value=='0'){   
					alert("Debe Seleccionar el Codigo");
					document.frmGral.COG.focus();  
					return false
			
				}else{
					return true		
				}
			}	
		}

	}


	function cmdSubmit_onclick(){
		if (validar()==true){
			document.frmGral.cmdSubmit.disabled=true; 
			document.frmGral.submit();
		}
	}

	function cmdBuscarCliente_onclick(){
		document.frmGral.PROCESO.value = "Buscar";
		document.frmGral.submit()
	}
	
	function Inicio(wCL1, wURL){

	if (wCL1 == ""){
		document.frmGral.wCLA.focus()
	  }else{
	    document.frmGral.wDES.focus()
	}	

	window.status = wURL

	}


	function cmdEliminar_onclick(){

		if (confirm("¿Esta Seguro de Eliminar este Registro?")){ 
		/*if (confirm("¿Desea Crear una Copia de este Pedido antes de ser Eliminado?")){ 
			javascript:window.open('<%=wURLC%>&E=S','main')
		}else{*/
			document.frmGral.PROCESO.value = "Eliminar";
			document.frmGral.submit()
		//}	
		}	
	
	}
		 
	function cambiar_grupos(){

		var url = 'X001A114.asp?CLA001=<%=wCLA001%>&CTR='+ frmGral.MOT.value +'&CGR=' + frmGral.CGR.value+'&OBS=' + frmGral.OBS.value;
		
		window.open(url,'main');

	}
	
	function cambiar_codigos(){

		var url = 'X001A114.asp?CLA001=<%=wCLA001%>&CTR='+ frmGral.MOT.value +'&CGR=' + frmGral.CGR.value+'&OBS=' + frmGral.OBS.value;
		
		window.open(url,'main');

	}

 
		  

</SCRIPT>

</BODY>
</HTML>
