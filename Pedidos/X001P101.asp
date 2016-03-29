<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

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


.auto-style3 {
	padding: 10;
}


.auto-style4 {
	text-align: right;
	vertical-align: middle;
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

    function validar(){

   	 	if (document.frmGral.ddlP300100FPA.value=='0'){
  		   alert("Por favor, Seleccione Forma de Pago.");
  		   frmGral.ddlP300100FPA.focus();  
  		   return false
  		}
		
		
   	 	if (document.frmGral.ddlP300100BAN.value=='0'){
  		   alert("Por favor, Seleccione Entidad Bancaria.");
  		   frmGral.ddlP300100BAN.focus();  
  		   return false
  		}


   	 	if (document.frmGral.ddlP300100MFA.value=='0'){
  		   alert("Por favor, Seleccione Mes de Facturación.");
  		   frmGral.ddlP300100MFA.focus();  
  		   return false
  		}
  		
  		
   	 	if (document.frmGral.ddlP300100COP.value=='0'){
  		   alert("Por favor, Califique la Oportunidad.");
  		   frmGral.ddlP300100COP.focus();  
  		   return false
  		}


    	if (document.frmGral.ddlP300100FPA.value=='04'){
  		   alert("Por favor, indique comentario.");
  		   frmGral.txP300100CPE.focus();  
  		   return false
  		}
  	
	  		
		   
    }
    
    
</script>
    
</head>



<%


	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wORG = TRIM(Request.QueryString("ORG"))
	wLIN = TRIM(Request.QueryString("LIN"))
	wTIP = TRIM(Request.QueryString("TIP"))

	strCnn	= Application("XDTA300_ConnectionString")
		
	
	SQL = "SELECT P300001NOM, P300001APE, P300001NIT, P300001PRO, P300001FNA, P300001EDA, "
	SQL = SQL & " P300001NOC, P300001CEL, P300001TEL, P300001EMA, P300001COP, P300001EIC " 
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
		wP300001COP = trim(rstQuery.Fields("P300001COP"))
		wP300001EIC = trim(rstQuery.Fields("P300001EIC"))
			
	END IF
	rstQuery.Close 
	set rstQuery = nothing
		
	wP300001COD = wCLA001
	wPROCESO = "Nuevo"


	
	IF LEN(TRIM(wCLA002)) > 0 THEN
	
		wPROCESO = "Actualizar"
	
		SQL = "SELECT P300100FPA, P300100BAN, P300100MFA, P300100COP, P300100CPE " 
		SQL = SQL & " FROM X300PF100 WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CCL = '" & trim(wCLA001) & "' AND "
		SQL = SQL & " P300100NPE = '" & trim(wCLA002) & "' "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wP300100FPA = trim(rstQuery.Fields("P300100FPA"))
			wP300100BAN = trim(rstQuery.Fields("P300100BAN"))
			wP300100MFA = trim(rstQuery.Fields("P300100MFA"))
			wP300100COP = trim(rstQuery.Fields("P300100COP"))
			wP300100CPE = trim(rstQuery.Fields("P300100CPE"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing
		
		
					
	  ELSE
		
		wCLA002 = "Nuevo"
	
	END IF 		
	
%>



<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<form method="post" action="X001P100S.asp?CLA001=<%=wCLA001%>" name="frmGral" onsubmit="return validar();">

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
<br/>
<fieldset style="background-color: #FAFAF8 ">
<legend><strong>Detalle de Oportunidad</strong></legend>

<table style="width: 95%; " align="center" cellpadding="7" class="auto-style3" >
<tr>
		<td style="width: 197px" class="auto-style1">Nro.:</td>
		<td class="auto-style1"> 
		<%=wCLA002%>
		<INPUT NAME="NRO" id="NRO" size=15 value="<%=wCLA002%>" TYPE="Hidden" >
		</td>
		<td  class="auto-style4" colspan="2">
		<input name="btnAgregar" type="button" value="Buscar y Agregar" onclick="javascript:window.open('X001P902.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>&PAR=1','main');" />
		</td>
	
	</tr>

</table>

<table style="width: 95%; " align="center" cellpadding="7" class="auto-style3" >


<%
		'''******************CARGAR PRODUCTOS DE OPORTUNIDAD DEL PROSPECTO*****************************
	
		SQL = " SELECT P300101ITE, P300101CPR, P300101DEL, P300101UVE, P300101MNE, P300101PPR " 																	
		SQL = SQL & " FROM X300PF101 WHERE "
		SQL = SQL & " P300101CCI = '" & trim(Session("glCiaInternet")) & "' AND "
		SQL = SQL & " P300101NPE = '" & wCLA002 & "'"
		SQL = SQL & " ORDER BY  P300101ITE " 					
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		wColumna = 1
		wCuenta = 0
		DO WHILE NOT rstQuery.EOF 
			wITE = trim(rstQuery.Fields(0))
			wCPR = trim(rstQuery.Fields(1))
			wDEL = trim(rstQuery.Fields(2))
			wUVE = trim(rstQuery.Fields(3))
			wMNE = trim(rstQuery.Fields(4))
			wPPR = trim(rstQuery.Fields(5))
			wUVE = FormatNumber(wUVE,0)
			wPPR = FormatNumber(wPPR,0)
			wMNE = FormatNumber(wMNE,2) 
			If wColumna = 1 Then
				%>
				
				<tr>
				<td style="width: 5%;text-align : center">
				<b>Posición:</b>
				</td>
				<td style="width: 20%;text-align : center">
				<b>Código</b>
				</td>
				<td style="width: 35%;text-align : left">
				<b>Descripción</b>
				</td>
				<td style="width: 10%;text-align : right">
				<b>Cantidad</b>				
				</td>
				<td style="width: 10%;text-align : right">
				<b>% Desc.</b>				
				</td>
				<td style="width: 20%;text-align : right">
				<b>Monto</b>
				</td> 
				</tr>
				
				<%
			End If  

			%>
			
				<tr>
				<td style="width: 5%;text-align : center">
				<%=wITE%>
				</td>
				<td style="width: 20%;text-align : center">
				<A href="X001P101_A.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>&CLA003=<%=wITE%>&CLA004=<%=wCPR%>" target="main" style="text-decoration: none"> 
				<%=wCPR%>
				</A>
				</td>
				<td style="width: 35%;text-align : left">
				<%=wDEL%>
				</td>
				<td style="width: 10%;text-align : right">
				<%=wUVE%>
				</td>
				<td style="width: 10%;text-align : right">
				<%=wPPR%>
				</td>
				<td style="width: 20%;text-align : right">
				<%=wMNE%>
				</td> 
				</tr>
			<%
										
						
			'If wColumna = 3 Then		
				%><%
		   	'	wColumna = 0	
			'End If			
					
			wColumna = wColumna + 1	
			wCuenta = wCuenta + 1	
		rstQuery.MoveNext  
       	LOOP
       	rstQuery.CLOSE
       	SET rstQuery = NOTHING
    

	IF wCuenta = 0 THEN
       	%>
       	
       	
				<tr>
				<td style="width: 90%;text-align : center">
				No hay productos asociados a la oportunidad.<br><br> Para añadir presione el Botón <b>"Buscar y Agregar"</b>.
				</td>
				</tr>
       	<%
       	
       	END IF
%>
</table>
</td>	
	</tr>



</table>
</fieldset>

<br/>
<INPUT NAME="PROCESO" id="PROCESO" size=15 value="<%=wPROCESO%>" TYPE="Hidden" >

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>
<td><!--<input name="btnContinuar" type="submit"value="Guardar" />--></td>
<td><input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001P999.asp?CLA001=<%=wCLA001%>&PAR=1','main');" />	
</td>
<% IF wCuenta > 0 THEN 

	wURLD = "X001P101I.ASP" & "?PAR=0000000ABABABACACACAGAGAGAFAFAF101111110101010101" 
	wURLD = wURLD & "000001010101000000000SDAADDDADSFWFWWFEFWCWWF000001111111111CAR001010101"
	wURLD = wURLD & "000001010101000000000SDAADDDADSFWFWWFEFWCWWF000001111111111CAR001010101"
	wURLD = wURLD & "01DWD141111455888&CLA001=" & wCLA001 & "&CLA002=" & wCLA002 				
		

%>
<td><input name="btnImprimir" type="button" value="Imprimir" onclick="javascript:window.open('<%=wURLD%>','_blank','toolbar=0,location=0,directories=0,resizable=1');" />	
</td>
<% END IF %>


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


</td> 
</tr> 
</table> 
</td>
</tr>
</table>
</form>

</body>


</html>
