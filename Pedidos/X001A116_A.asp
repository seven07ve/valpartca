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
		
	wTIT = "Posición PQR" 
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wCLA003 = TRIM(Request.QueryString("CLA003"))
	wCLA004 = TRIM(Request.QueryString("CLA004"))
	wSTSPED = TRIM(Request.QueryString("STSPED"))

	wCTR = TRIM(Request.QueryString("CTR"))
	wCGR = TRIM(Request.QueryString("CGR"))
	wOBS = TRIM(Request.QueryString("OBS"))
	wCAN = TRIM(Request.QueryString("CAN"))
	wTUS = TRIM(Request.QueryString("TUS"))
	wLOT = TRIM(Request.QueryString("LOT"))
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
	wE300002CTR = "0"
	IF LEN(TRIM(wCTR)) > 0 THEN
		wE300002CTR = wCTR
	END IF 
	wE300002CGR = "0"
	IF LEN(TRIM(wCGR)) > 0 THEN
		wE300002CGR = wCGR
	END IF 
	IF LEN(TRIM(wOBS)) > 0 THEN
		wE300002OBS = wOBS
	END IF 
	IF LEN(TRIM(wCAN)) > 0 THEN
		wE300002CAN = wCAN
	END IF 
	IF LEN(TRIM(wTUS)) > 0 THEN
		wE300002TUS = wTUS
	END IF 
	IF LEN(TRIM(wLOT)) > 0 THEN
		wE300002LOT = wLOT
	END IF 
	'response.write wE300001CGR & " -" & wCGR 
	wSEL = " selected"

	strCnn	= Application("XDTA300_ConnectionString")
    SQL = "SELECT E300001CTR "
	SQL = SQL & " FROM X300EF001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " E300001CCI ='" & wCCI & "' AND "
	SQL = SQL & " E300001CIA ='" & wCIA & "' AND "
	SQL = SQL & " E300001CCL ='" & wCLA001 & "' AND "
	SQL = SQL & " E300001COD ='" & wCLA002 & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wE300001CTR = trim(rstQuery.Fields("E300001CTR"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
		
		
	IF LEN(TRIM(wCLA003)) > 0 THEN
		wProceso = "Actualizar"
		wNRO = wCLA003
		
		SQL = "SELECT E300002CGR, E300002COG, E300002OBS, E300002LOT, "
		SQL = SQL & " E300002CPR, E300002CAN, E300002DEL "
		SQL = SQL & " FROM X300EF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
		SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
		SQL = SQL & " E300002NFA ='" & wCLA003 & "' AND "
		SQL = SQL & " E300002COD ='" & wCLA002 & "'"
		'response.write sql
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wE300002CGR = trim(rstQuery.Fields("E300002CGR"))
			wE300002COG = trim(rstQuery.Fields("E300002COG"))
			wE300002CAN = trim(rstQuery.Fields("E300002CAN"))
			wE300002CPR = trim(rstQuery.Fields("E300002CPR"))
			wE300002LOT = trim(rstQuery.Fields("E300002LOT"))
			wE300002OBS = trim(rstQuery.Fields("E300002OBS"))
			wE300002TUS = trim(rstQuery.Fields("E300002DEL"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
	
		
		wDisabled = " disabled"
		'response.write wE300002CGR & "<br>" & wE300002COG
		wCGR = wE300002CGR
		wCTR = wE300002CTR 
		
		
		
		wFDE = Right("0" & day(wFDE),2) & "/" &  Right("0" & month(wFDE),2) & "/" & year(wFDE)
		
		wSELUNO1 = "": wSELDOS1 = "": wSELTRES1 = ""
		
	
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

	SQL = "SELECT A300003DEL, A300003NLP "
	SQL = SQL & " FROM X300AF003 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300003CCI ='" & wCCI & "' AND "
	SQL = SQL & " A300003CIA ='" & wCIA & "' AND "
	SQL = SQL & " A300003CPR ='" & wCLA004 & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wA300003DEL = trim(rstQuery.Fields("A300003DEL"))
		wA300003NLP = trim(rstQuery.Fields("A300003NLP"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	


	'wERROR = "Cliente no Existe"

	wURL = "X001A116_AS.ASP"
	
	
	
	wTIT = wProceso & " " & wTIT
	
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
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Nro. PQR:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1"><%=wCLA002%>
          
    
		  
          </P></td>
         </tr>

		 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Cliente:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1"><%=wCLA001%> - <%=wA300002RSO%>
          
          <font color="#FF0000"><b><%=wERROR%></b></FONT>
		  
          </P></td>
         </tr>
         
		
		<tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Nro. Posición:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1"><%=wNRO%>
          
    
		  
          </P></td>
         </tr>

 <% IF wE300001CTR = "R" THEN %>
		 		 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Producto:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1"><%=wCLA004%> - <%=wA300003DEL%>
          
		  
          </P></td>
         </tr>
         
         		 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Cantidad:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1">
          
		  
          <input name="CAN" size="10" type="text" value="<%=wE300002CAN%>"></P></td>
         </tr>

				 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Tiempo de Uso:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1">
          
		  
          <input name="TUS" type="text" value="<%=wE300002TUS%>" size="30"></P></td>
         </tr>


				 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Lote:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1">
          
		  
          <input name="LOT" type="text" value="<%=wE300002LOT%>" size="30"></P></td>
         </tr>

         
         <% END IF %>
      

         <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Grupo:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="CGR" onchange="javascript:cambiar_codigos();" <%=wDisabled%>>
					<option value="0" >Seleccione...</option>

				<%
				
								
									
	                                SQL = "SELECT A300035CGR, A300035DGR "
							        SQL = SQL & " FROM X300AF035 "
							        SQL = SQL & " WHERE "
							        SQL = SQL & " A300035CAT ='9' AND "
							        SQL = SQL & " A300035CCI ='" & wCCI & "' AND "
							        SQL = SQL & " A300035CGR IN ( SELECT B300127CGR "
							        SQL = SQL & " FROM X300BF127 WHERE  "
							        SQL = SQL & " B300127CCI ='" & wCCI & "' ) "
							        IF wE300001CTR = "R" THEN
								        SQL = SQL & " AND  A300035CPC IN ( SELECT B300126CPC "
								        SQL = SQL & " FROM X300BF126 WHERE  "
								        SQL = SQL & " B300126CCI ='" & wCCI & "' AND "
								        SQL = SQL & " B300126NLP ='" & wA300003NLP & "' ) "
								    END IF 
							        'ACTIVAR PARA PRUEBAS INTEGRALES
							        'SQL = SQL & " AND LEFT(A300035CPC,1) = '" & wCTR & "'"
							        SQL = SQL & " GROUP BY A300035CGR, A300035DGR "
							        RESPONSE.WRITE SQL 
        							Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn									
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = trim(rstQuery.Fields(1))
										IF TRIM(wE300002CGR) = wCOD THEN
										   wSEL2 = " selected"
										   RESPONSE.WRITE TRIM(wE300002CGR) & " - " & wCOD  
										  ELSE 
										   wSEL2 = ""
										END IF 
										Response.write "<OPTION value=" & """" & wCOD & """" & wSEL2 & " >" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
				%>
				</SELECT>			
          </td>
         </tr>
         
          <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Codigo:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="COG" <%=wDisabled%>>
					<option value="0">Seleccione...</option>

				<%
				
								
									
      	                            SQL = "SELECT A300035COD, A300035DCO "
							        SQL = SQL & " FROM X300AF035 "
							        SQL = SQL & " WHERE "
							        SQL = SQL & " A300035CAT ='9' AND "
							        SQL = SQL & " A300035CCI ='" & wCCI & "' AND "
							        SQL = SQL & " A300035CGR ='" & wCGR & "' AND "
							        SQL = SQL & " A300035CGR IN ( SELECT B300127CGR "
							        SQL = SQL & " FROM X300BF127 WHERE  "
							        SQL = SQL & " B300127CCI ='" & wCCI & "' ) " 
							        SQL = SQL & " GROUP BY A300035COD, A300035DCO "
							        'response.write sql 
        							Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn									
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = trim(rstQuery.Fields(1))							
										IF TRIM(wE300002COG) = wCOD THEN
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
          
		   <textarea rows="2" cols="16" name="OBS" style="height:74;width:400;"><%=wE300002OBS%></textarea> 
          </P></td>
         </tr>




		<% If Session("glTipoUsuario") <> "C" AND wPROCESO ="Actualizar" AND wE300001SPP = "1" Then %>	
		 <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Estatus:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="STS">
				<option value="1" <%=wSELUNO1%>>Abierto</option>
				<option value="2" <%=wSELDOS1%>>Proceso</option>
				<option value="3" <%=wSELTRES1%>>Cerrado</option>
				</select> 
          </td>
         </tr>
         
         <tr>
          <td class="TDS" width="28%" ><p CLASS="P1" align="left">Comentario:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1">
          
		   <textarea rows="2" cols="16" name="CRE" style="height:74;width:400;"><%=wE300002OBS%></textarea> 
          </P></td>
         </tr>
		<% End If %>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center"  >
		  <INPUT TYPE="Hidden" NAME="CLA001" value="<%=wCLA001%>">          
		  <INPUT TYPE="Hidden" NAME="CLA002" value="<%=wCLA002%>">
		  <INPUT TYPE="Hidden" NAME="CLA003" value="<%=wCLA003%>">          
		  <INPUT TYPE="Hidden" NAME="CPR" value="<%=wCLA004%>">          
		  <INPUT TYPE="Hidden" NAME="STSPED" value="<%=wSTSPED%>">        		  
		  
          <!--#include file="X001Y005.PRC"-->
          
         
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

		var url = 'X001A116_A.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>&CLA004=<%=wCLA004%>&CGR='+ frmGral.CGR.value+'&OBS=' + frmGral.OBS.value;
		//+'&CAN=' + frmGral.CAN.value+'&TUS=' + frmGral.TUS.value+'&LOT=' + frmGral.LOT.value;
		alert(url);
		window.open(url,'main');

	}
	
	function cambiar_codigos(){
		
		if ('<%=wE300001CTR%>' == 'R'){
			var url = 'X001A116_A.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>&CLA004=<%=wCLA004%>&CGR=' + frmGral.CGR.value+'&OBS=' + frmGral.OBS.value+'&CAN=' + frmGral.CAN.value+'&TUS=' + frmGral.TUS.value+'&LOT=' + frmGral.LOT.value;
		}else{
			var url = 'X001A116_A.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>&CLA004=<%=wCLA004%>&CGR=' + frmGral.CGR.value+'&OBS=' + frmGral.OBS.value;
		}
		
		window.open(url,'main');

	}

 
		  

</SCRIPT>

</BODY>
</HTML>
