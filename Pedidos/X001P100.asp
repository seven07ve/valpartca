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


    	if ((document.frmGral.ddlP300100FPA.value=='04')||(document.frmGral.txP300100CPE.value==''){
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
		
		SELECT CASE wP300100MFA 
			CASE "01"
				wSEL01 = " selected"
			CASE "02"
				wSEL02 = " selected"
			CASE "03"
				wSEL03 = " selected"
			CASE "04"
				wSEL04 = " selected"
			CASE "05"
				wSEL05 = " selected"
			CASE "06"
				wSEL06 = " selected"
			CASE "07"
				wSEL07 = " selected"
			CASE "08"
				wSEL08 = " selected"
			CASE "09"
				wSEL09 = " selected"
			CASE "10"
				wSEL10 = " selected"
			CASE "11"
				wSEL11 = " selected"
			CASE "12"
				wSEL12 = " selected"		 
		END SELECT
		
		SELECT CASE wP300100COP 
			CASE "1"
				wSEL01_COP = " selected"
			CASE "2"
				wSEL02_COP = " selected"
			CASE "3"
				wSEL03_COP = " selected"
			CASE "4"
				wSEL04_COP = " selected"
			CASE "5"
				wSEL05_COP = " selected"
			CASE "6"
				wSEL06_COP = " selected"	 
		END SELECT

					
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
<legend><strong>Encabezado de Oportunidad</strong></legend>

<table style="width: 95%; " align="center" cellpadding="7" class="auto-style3" >
<tr>
		<td style="width: 213px" class="auto-style1">Nro.:</td>
		<td class="auto-style1"> 
		<%=wCLA002%>
		<INPUT NAME="NRO" id="NRO" size=15 value="<%=wCLA002%>" TYPE="Hidden" >
		</td>
	</tr>
<tr>
		<td style="width: 213px" class="auto-style1">Forma de Pago:</td>
		<td class="auto-style1"> 
		<select name="ddlP300100FPA">
				<optgroup label="Seleccione Forma de Pago">
						<option value="0"></option>
			<%								
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT P300710COD, P300710DES "
									SQL = SQL & " FROM X300PF710 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " P300710CCI = '" & trim(Session("glCiaInternet")) & "' "
									SQL = SQL & " ORDER BY  P300710DES " 	

									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),25)							
										IF TRIM(wP300100FPA) = wCOD THEN
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
	</tr>
<tr>
		<td style="width: 213px" class="auto-style1">Entidad:</td>
		<td class="auto-style1"> 
			<select name="ddlP300100BAN">
				<optgroup label="Seleccione Entidad Bancaria">
						<option value="0"></option>
			<%								
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT A300034CBN, A300034DEL "
									SQL = SQL & " FROM X300AF034 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " A300034CCI = '" & trim(Session("glCiaInternet")) & "' "
									SQL = SQL & " ORDER BY  A300034DEL " 	

									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),25)							
										IF TRIM(wP300100BAN) = wCOD THEN
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
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Mes de Facturación:</td>
		<td class="auto-style1"> 
			<select name="ddlP300100MFA">
				<optgroup label="Seleccione Mes de Facturación">
						<option value="0"></option>
				<OPTION value="01" <%=wSEL01%>>ENERO</OPTION>
				<OPTION value="02" <%=wSEL02%>>FEBRERO</OPTION>
				<OPTION value="03" <%=wSEL03%>>MARZO</OPTION>
				<OPTION value="04" <%=wSEL04%>>ABRIL</OPTION>
				<OPTION value="05" <%=wSEL05%>>MAYO</OPTION>
				<OPTION value="06" <%=wSEL06%>>JUNIO</OPTION>
				<OPTION value="07" <%=wSEL07%>>JULIO</OPTION>
				<OPTION value="08" <%=wSEL08%>>AGOSTO</OPTION>
				<OPTION value="09" <%=wSEL09%>>SEPTIEMBRE</OPTION>
				<OPTION value="10" <%=wSEL10%>>OCTUBRE</OPTION>
				<OPTION value="11" <%=wSEL11%>>NOVIEMBRE</OPTION>
				<OPTION value="12" <%=wSEL12%>>DICIEMBRE</OPTION>
				
				
				
		</optgroup>
		</select>
		</td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1" >Calificación de 
		Oportunidad:</td>
		<td class="auto-style1"> 
		<select name="ddlP300100COP" >
				<optgroup label="Seleccione La Calificación">
						<option value="0"></option>
				<OPTION value="1" <%=wSEL01_COP%> >1</OPTION>
				<OPTION value="2" <%=wSEL02_COP%> >2</OPTION>
				<OPTION value="3" <%=wSEL03_COP%> >3</OPTION>
				<OPTION value="4" <%=wSEL04_COP%> >4</OPTION>
				<OPTION value="5" <%=wSEL05_COP%> >5</OPTION>
								
				
		</optgroup>
		</select>

		</td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Comentarios:</td>
		<td class="auto-style1"> 
		<input id="txP300100CPE" type="text"  name="txP300100CPE" style="width: 416px" value="<%=wP300100CPE%>" maxlength="150" required  />
				
		</td>
	</tr>



</table>
</fieldset>

<br/>
<INPUT NAME="PROCESO" id="PROCESO" size=15 value="<%=wPROCESO%>" TYPE="Hidden" >

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>
<td><input name="btnContinuar" type="submit"value="Guardar" /></td>
<td><input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001P999.asp?CLA001=<%=wCLA001%>&PAR=1','main');" /></td>
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
