<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

wCLA001 = TRIM(Request.QueryString("CLA001"))

%>

<!DOCTYPE html >
<html >

<head>
<meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<!--#include file="X001Z001.INC"-->

<link href="calendario/styles.css" rel="stylesheet" type="text/css"/>
<link href="calendario/calendar.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="calendario/js/mootools.js"></script>
<script type="text/javascript" src="calendario/js/calendar.js"></script>
<script type="text/javascript" src="calendar1.js"></script><!-- Date only with year scrolling -->


<title>Datos Basicos</title>
<style type="text/css" >

	body { margin: 0px 0px 0px 0px }

.auto-style1 {
	text-align: left;
	vertical-align: middle;  
}

.auto-style2 {
	margin-left: 280px;
	font-size: medium;
}


</style> 

<script type="text/javascript">

    window.addEvent('domready', function() { myCal = new Calendar({ fecha: 'd/m/Y' }); });
    
    

	function Vacio(q) {  

	    for ( i = 0; i < q.length; i++ ) {  
	        if ( q.charAt(i) != " " ) {  
	            return true  
	         }  
	    }  
	    return false  
	}

    function continuar(){
    	
    	if (frmGral.tPDI.value<1){
    		alert('Debe indicar un Producto de Interés');  	
    		}else{
    		window.open('X001P004.asp?CLA001=<%=wCLA001%>','main'); 
    	}
    		
	}

    function validar(){
    	
    	   	
    	if (frmGral.ddlP300706LIN.value=='0'){
  		   alert("Indique Linea.");
  		   frmGral.ddlP300706LIN.focus();
  		   return false
  		}
  		
		if (frmGral.ddlP300706TIP.value=='0'){
  		   alert("Indique Tipo.");
  		   frmGral.ddlP300706TIP.focus();
  		   return false
  		}
  		
		if (frmGral.ddlP300706MAR.value=='0'){
  		   alert("Indique Marca.");
  		   frmGral.ddlP300706MAR.focus();
  		   return false
  		}  		
		   
    }
    
    
</script>
    
</head>



<%


	
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wORG = TRIM(Request.QueryString("ORG"))
	wLIN = TRIM(Request.QueryString("LIN"))
	wTIP = TRIM(Request.QueryString("TIP"))

	strCnn	= Application("XDTA300_ConnectionString")
		
	
	SQL = "SELECT P300001NOM, P300001APE, P300001NIT, P300001PRO, P300001FNA, P300001EDA, "
	SQL = SQL & " P300001NOC, P300001CEL, P300001TEL, P300001EMA, P300001CIU, P300001CLI " 
	SQL = SQL & " FROM X300PF001 WHERE "
	SQL = SQL & " P300001CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " P300001COD = '" & trim(wCLA001) & "'" 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wP300001NOM = trim(rstQuery.Fields("P300001NOM"))
		wP300001APE = trim(rstQuery.Fields("P300001APE"))
		wP300001NIT = trim(rstQuery.Fields("P300001NIT"))
		wP300001PRO = trim(rstQuery.Fields("P300001PRO"))
		wP300001FNA = trim(rstQuery.Fields("P300001FNA"))
		wP300001EDA = trim(rstQuery.Fields("P300001EDA"))
			
		wP300001NOC = trim(rstQuery.Fields("P300001NOC"))
		wP300001CEL = trim(rstQuery.Fields("P300001CEL"))
		wP300001TEL = trim(rstQuery.Fields("P300001TEL"))
		wP300001EMA = trim(rstQuery.Fields("P300001EMA"))
		wP300001CIU = trim(rstQuery.Fields("P300001CIU"))
		wP300001CLI = trim(rstQuery.Fields("P300001CLI"))
			
	END IF
	rstQuery.Close 
	set rstQuery = nothing
		
	wP300001COD = wCLA001
		
	
%>



<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<form method="post" action="X001P003M1S.asp?CLA001=<%=wCLA001%>" name="frmGral" onsubmit="return validar();">

<table border="0" style="height: 100%" width="919" bgcolor="#FFFFFF" align="center"  > <tr><td valign="top" align="center" >

     	<table border="0" width="800" cellspacing="0" id="table5" align="center" >

        <tr>
		<td width="100%" >
<fieldset style="background-color: #FAFAF8 ">
<legend class="auto-style2" style="width: 92px"><strong>
SALES PRO</strong></legend>
<table style="width: 95%" align="center">
	<tr>
		<td style="width: 213px" class="auto-style1">ID Prospecto:</td>
		<td class="auto-style1"> <%=wP300001COD%> <input type="hidden" value="<%=wP300001COD%>" name="txP300001COD"></td>
	</tr>
		<tr>
		<td style="width: 213px" class="auto-style1">Nombres y Apellidos:</td>
		<td class="auto-style1"> <%=wP300001NOM & " " & wP300001APE%></td>
	</tr>

</table>
</fieldset>
<br/>
<fieldset style="background-color: #FAFAF8 ">
<legend><strong>Productos de Interés</strong></legend>

<table style="width: 95%" align="center">
<tr>
<td>
Linea
</td> 
<td>
Tipo de Producto
</td> 
<td>
Marca
</td>
<tr>
<td>
<select name="ddlP300706LIN" onchange="Cambiar_tipo();">
			<optgroup label="Seleccione Linea">
						<option value="0">Seleccione</option> 
				<%
													
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT P300706LIN, P300707DEC "
									SQL = SQL & " FROM X300PQ706 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " P300706CCI = '" & trim(Session("glCiaInternet")) & "' "
 													
 									SQL = SQL & " GROUP BY P300706LIN, P300707DEC  " 					
									SQL = SQL & " ORDER BY  P300707DEC " 	
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),25)							
										IF TRIM(wLIN) = wCOD THEN
										   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL = ""
										END IF 
										Response.write "<OPTION value=" & "" & wCOD & " " & wSEL & ">" & wDES & "</OPTION>" 										
										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
		
		</optgroup>
		</select>
<td>
<select name="ddlP300706TIP"  onchange="Cambiar_marca()">
			<optgroup label="Seleccione un Tipo de Producto">
						<option value="0">Seleccione</option> 
				<%
														
											
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT P300706TIP, P300708DEC "
									SQL = SQL & " FROM X300PQ706 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " P300706CCI = '" & trim(Session("glCiaInternet")) & "' AND "
							 		SQL = SQL & " P300706LIN = '" & trim(wLIN) & "' "				
 									SQL = SQL & " GROUP BY P300706TIP, P300708DEC  " 					
									SQL = SQL & " ORDER BY  P300708DEC " 	

									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),25)							
										IF TRIM(wTIP) = wCOD THEN
										   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL = ""
										END IF 
										Response.write "<OPTION value=" & "" & wCOD & " " & wSEL & ">" & wDES & "</OPTION>" 										
										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
		
		</optgroup>
		</select>
</td>
<td>
<select name="ddlP300706MAR" >
			<optgroup label="Seleccione Marca">
			<option value="0">Seleccione</option> 
				<%
														
											
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT P300706MAR, P300709DEC "
									SQL = SQL & " FROM X300PQ706 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " P300706CCI = '" & trim(Session("glCiaInternet")) & "' AND "
							 		SQL = SQL & " P300706LIN = '" & trim(wLIN) & "' AND "				
							 		SQL = SQL & " P300706TIP = '" & trim(wTIP) & "' "				
 									SQL = SQL & " GROUP BY P300706MAR, P300709DEC  " 					
									SQL = SQL & " ORDER BY  P300709DEC " 	
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),25)							
										IF TRIM(wMAR) = wCOD THEN
										   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL = ""
										END IF 
										Response.write "<OPTION value=" & "" & wCOD & " " & wSEL & ">" & wDES & "</OPTION>" 										
										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
		
		</optgroup>
		</select>
</td>
<td>
<input name="btnAgregar" type="submit" value="Añadir" />
</td>
</tr>




	
</table>

</fieldset>

<br/>

<fieldset style="background-color: #FAFAF8 ">


<table style="width: 95%" align="center">
	
	
	<%
		'''******************CARGAR PRODUCTOS DE INTERES AÑADIDOS*****************************
	
		SQL = " SELECT P300003CON, P300707DEC, P300708DEC, P300709DEC FROM X300PQ003" 																	
		SQL = SQL & " WHERE "
		SQL = SQL & " P300003CCI = '" & trim(Session("glCiaInternet")) & "' AND "
		SQL = SQL & " P300003COD = '" & wCLA001 & "'"
		SQL = SQL & " ORDER BY  P300003FAC " 					
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		wColumna = 1
		wCuenta = 0
		DO WHILE NOT rstQuery.EOF 
			wCON = trim(rstQuery.Fields(0))
			wDLI = trim(rstQuery.Fields(1))
			wDTI = trim(rstQuery.Fields(2))
			wDMA = trim(rstQuery.Fields(3))
			
			
			'If wColumna = 1 Then
				%><tr><%
			'End If  

			%>
				<td style="width: 200px; text-align:center" class="auto-style1" >

				<table style="width: 100%">
				<tr>
				<td style="width: 28%">
				<%=wDLI%>
				</td>
				<td style="width: 28%">
				<%=wDTI%>
				</td>
				<td style="width: 28%">
				<%=wDMA%>
				</td>
				<td style="width: 16%;text-align : center">
				<img onclick="javascript:window.open('X001P003M1S.asp?CLA001=<%=wCLA001%>&PRO=E&CON=<%=wCON%>','main');" src="images/Delete.gif" alt="Eliminar" style="cursor: pointer">			
				</td> 
				</tr>
				</table>
				</td>
			<%
										
						
			'If wColumna = 3 Then		
				%></tr><%
		   	'	wColumna = 0	
			'End If			
					
			wColumna = wColumna + 1	
			wCuenta = wCuenta + 1	
		rstQuery.MoveNext  
       	LOOP
       	rstQuery.CLOSE
       	SET rstQuery = NOTHING	
       	
       	
       	'*****************************************************************************************************

%>



	</table>
</fieldset>


<INPUT NAME="tDEP" id="tPDI" size=15 value="<%=wCuenta%>" TYPE="Hidden" >	
<!--
<INPUT NAME="tHOB" id="tHOB" size=15 value="<%=wCuentaHOB%>" TYPE="Hidden" >	
<INPUT NAME="tPRO" id="tPRO" size=15 value="<%=wCuentaPRO%>" TYPE="Hidden" >	-->	

<br/>

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>
<td><input name="btnContinuar" type="button" value="Continuar"  onclick="javascript:continuar();" /></td>
<td><input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001P002.asp?CLA001=<%=wCLA001%>','main');" /></td>
</tr>
</table> 
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>


</td> 
</tr> 
</table> 
</td>
</tr>
</table>
</form>

<script type="text/javascript">
	
	
	function Cambiar_tipo() {
		var url;	
	
		url = "X001P003M1.asp?CLA001=<%=wCLA001%>";
		url = url + "&LIN=" + frmGral.ddlP300706LIN.value;		    
		window.open(url,'main');
	
	}
	
	function Cambiar_marca() {
		
		var url;	
	
		url = "X001P003M1.asp?CLA001=<%=wCLA001%>";
		url = url + "&LIN=" + frmGral.ddlP300706LIN.value;		    
		url = url + "&TIP=" + frmGral.ddlP300706TIP.value;		    
		window.open(url,'main');
	
	}


</script>

</body>


</html>
