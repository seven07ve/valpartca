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

	function Enviar(e){
	
		frmGral.PROCESO.value = e.value; 
		if (e.value=='Eliminar'){
			if (confirm("¿Esta Seguro de Eliminar este Registro?")){ 
				frmGral.submit()
			}	
		}else{	
			frmGral.submit()  
		}
	}
	
    function validar(e){

		 tecla = (document.all) ? e.keyCode :e.which;
		 //alert(tecla);
		 
		 //return (tecla!=13); 
   	 	if (tecla==undefined){
   	 		return false
   	 	}
   	 	/*if (document.frmGral.ddlP300100FPA.value=='0'){
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
  		*/
	  		
		   
    }
    
    
</script>
    
</head>



<%


	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wCLA003 = TRIM(Request.QueryString("CLA003"))
	wCLA004 = TRIM(Request.QueryString("CLA004"))
	
	wERROR = TRIM(Request.QueryString("ERROR"))

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
	
	
	SQL = "SELECT P300100STS " 
	SQL = SQL & " FROM X300PF100 WHERE "
	SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " P300100NPE = '" & trim(wCLA002) & "' AND "
	SQL = SQL & " P300100CCL = '" & trim(wCLA001) & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wSTS = trim(rstQuery.Fields("P300100STS"))	
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	

	SQL = "SELECT P300101DEL, P300101PIM, P300101PUN, P300101UVE, " 
	SQL = SQL & " P300101PPR FROM X300PF101 WHERE "
	SQL = SQL & " P300101CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " P300101NPE = '" & trim(wCLA002) & "' AND "
	SQL = SQL & " P300101CPR = '" & trim(wCLA004) & "' AND "
	SQL = SQL & " P300101ITE = '" & trim(wCLA003) & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wPUN = trim(rstQuery.Fields("P300101PUN"))
		wPIM = trim(rstQuery.Fields("P300101PIM"))
		wDEL = trim(rstQuery.Fields("P300101DEL"))
		wCAN = trim(rstQuery.Fields("P300101UVE"))
		wPPR = trim(rstQuery.Fields("P300101PPR"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	SQL = "SELECT Z300002PMD, Z300002PGE  " 
	SQL = SQL & " FROM X300ZF002 WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wPMD = trim(rstQuery.Fields("Z300002PMD"))
		wPGE = trim(rstQuery.Fields("Z300002PGE"))	
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
						
	
%>



<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>';frmGral.CAN.focus();" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<form method="post" action="X001P101_AS.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>&CLA003=<%=wCLA003%>&CLA004=<%=wCLA004%>" name="frmGral" onsubmit="return validar(event);">

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
<legend><strong>Detalle Producto Oportunidad</strong></legend>

<table style="width: 95%; " align="center" cellpadding="7" class="auto-style3" >
<tr>
		<td style="width: 213px" class="auto-style1">Nro.:</td>
		<td class="auto-style1"> 
		<%=wCLA002%>   <%=wERROR%>
		<INPUT NAME="NRO" id="NRO" size=15 value="<%=wCLA002%>" TYPE="Hidden" >
		</td>
	</tr>
	
	<tr>
		<td style="width: 213px" class="auto-style1">Posición:</td>
		<td class="auto-style1"> 
		<%=wCLA003%>
		<INPUT NAME="ITE" id="NRO" size=15 value="<%=wCLA003%>" TYPE="Hidden" >
		</td>
	</tr>

<tr>
		<td style="width: 213px" class="auto-style1">Código:</td>
		<td class="auto-style1"> 
		<%=wCLA004%>
		<INPUT NAME="CPR" id="NRO" size=15 value="<%=wCLA004%>" TYPE="Hidden" >
		</td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Descripción:</td>
		<td class="auto-style1"> 
		<% IF wPGE = wCLA004 THEN %>
		<INPUT NAME="txDEL" id="txDEL" size="60" value="<%=wDEL%>" TYPE="text" maxlength="300" >
		<%ELSE%>
		<%=wDEL%>
		<%END IF%>
		</td>
	</tr>


<tr>
		<td style="width: 213px" class="auto-style1">% Impuesto:</td>
		<td class="auto-style1"> 
		<%=wPIM%>
		
		</td>
	</tr>
<tr>
	<td style="width: 213px" class="auto-style1">% Descuento:</td>
	<td class="auto-style1"> 

<% IF Session("glTipoUsuario") <> "V" THEN%>
<input type="text" name="txPPR" id="txPPR" value="<%=wPPR%>" style="width: 29px" >
<%ELSE %>	
	<select name="ddlPPR">
				<optgroup label="Seleccione">
				
				<%
				
				For i=0 to wPMD 
						IF TRIM(wPPR) = TRIM(i) THEN
						    wSEL = " selected"
						  ELSE 
						  wSEL = ""
						END IF 

						Response.write "<OPTION value=" & """" & i & """" & wSEL & ">" & i & "</OPTION>"
 					'i = i + 9
 				next
				
				%>
				
				
		</optgroup>
	</select>
	<%END IF %>
	
	</td>
</tr>

<tr>
		<td style="width: 213px" class="auto-style1">Precio Unitario:</td>
		<td class="auto-style1"> 
		<% IF wPGE = wCLA004 THEN %>
		<input type="text" name="txPUN" id="txPUN" value="<%=wPUN%>" style="width: 100px">
		<% ELSE %>
		<%=FormatNumber(wPUN,2)%>
		<% END IF %>		
		</td>
	</tr>
	
	<tr>
		<td style="width: 213px" class="auto-style1">Cantidad:</td>
		<td class="auto-style1"> 
		<input type="text" name="CAN" id="CAN" value="<%=wCAN%>" style="width: 50px">
		
		</td>
	</tr>

	

</table>
</fieldset>

<br/>
<INPUT NAME="PROCESO" id="PROCESO" size=15 value="<%=wPROCESO%>" TYPE="Hidden" >

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>

<% IF wSTS = "0" OR wSTS = "1" THEN %>
<td><input name="btnContinuar" type="button" value="Guardar" onclick="javascript:Enviar(this);"/></td>
<td><input name="btnEliminar" type="button" value="Eliminar" onclick="javascript:Enviar(this);"/></td>
<% END IF %>
<td><input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001P101.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>&PAR=1','main');" /></td>
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
