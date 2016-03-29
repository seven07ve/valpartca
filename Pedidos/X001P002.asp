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
    	
    	
    	if (Vacio(frmGral.txP300001NOM.value)==false){
  		   alert("Indique El Nombre.");
  		   frmGral.txP300001NOM.focus();
  		   return false
  		}
  		
		if (Vacio(frmGral.txP300001APE.value)==false){
  		   alert("Indique El Apellido.");
  		   frmGral.txP300001APE.focus();
  		   return false
  		}
  		
		if (Vacio(frmGral.txP300001NIT.value)==false){
  		   alert("Indique El Nit o Rif.");
  		   frmGral.txP300001NIT.focus();
  		   return false
  		}
  		
		if (Vacio(frmGral.txP300001FNA.value)==false){
  		   alert("Indique La Fecha de Nacimiento.");
  		   frmGral.txP300001FNA.focus();
  		   return false
  		}
  		
		if (Vacio(frmGral.txP300001NOC.value)==false){
  		   alert("Indique El Nombre del Contacto.");
  		   frmGral.txP300001NOC.focus();
  		   return false
  		} 
  		
		
		if (Vacio(frmGral.txP300001CEL.value)==false){
  		   alert("Indique El Celular de Contacto.");
  		   frmGral.txP300001CEL.focus();
  		   return false
  		}
  		
  		var cel;
  		cel = frmGral.txP300001CEL.value;
  		if (cel.length<10){
  		   alert("Indique los 10 Digitos del Celular de Contacto.");
  		   frmGral.txP300001CEL.focus();
  		   return false
  		}
  		
  		if (Vacio(frmGral.txP300001TEL.value)==false){
  		   alert("Indique El Telefono de Contacto.");
  		   frmGral.txP300001TEL.focus();
  		   return false
  		}
  		
  		var cel;
  		cel = frmGral.txP300001TEL.value;
  		if (cel.length<7){
  		   alert("Indique los 7 Digitos del Telefono de Contacto.");
  		   frmGral.txP300001TEL.focus();
  		   return false
  		}
  		 		
  		if (Vacio(frmGral.txP300001EMA.value)==false){
  		   alert("Indique El Email.");
  		   frmGral.txP300001EMA.focus();
  		   return false
  		}   
  
    	var email = frmGral.txP300001EMA.value;  
  		if (/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/.test(email)){
  	      //alert("La dirección de email " + valor + " es correcta.");
  	      //return true
  		  }else{
  		      alert("La dirección de email es Incorrecta.");
  		      frmGral.txP300001EMA.focus();
  	      return false
  		}
    
    }
    
    
</script>
    
</head>



<%


	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wORG = TRIM(Request.QueryString("ORG"))
	wPAR = TRIM(Request.QueryString("PAR"))

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
<form method="post" action="X001P002S.asp" name="frmGral">

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
		<td class="auto-style1"> <%=wP300001COD%> <input type="hidden" value="<%=wP300001COD%>" name="txP300001COD">
		<input type="hidden" value="<%=wPAR%>" name="txPAR"></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Nombres y Apellidos:</td>
		<td class="auto-style1"> <%=wP300001NOM & " " & wP300001APE%></td>
	</tr>
			
</table>
</fieldset>
<br/>
<fieldset style="background-color: #FAFAF8 ">
<legend><strong>Deportes</strong></legend>

<table style="width: 95%" align="center">


<%
	
		SQL = " SELECT P300700CON, P300700DES FROM X300PF700 " 																	
		SQL = SQL & " WHERE "
		SQL = SQL & " P300700CCI = '" & trim(Session("glCiaInternet")) & "' AND "
		SQL = SQL & " P300700TIP = '1' "
		SQL = SQL & " ORDER BY  P300700DES " 					
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		wColumna = 1
		wCuentaDEP = 1
		DO WHILE NOT rstQuery.EOF 
			wCOD = trim(rstQuery.Fields(0))
			wDES = trim(rstQuery.Fields(1))
			
			wChecked = ""						
			SQL = "SELECT P300002CON "
			SQL = SQL & " FROM X300PF002 WHERE "
			SQL = SQL & " P300002CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " P300002CON = '" & wCOD & "' AND "
			SQL = SQL & " P300002TIP = '1' AND "
			SQL = SQL & " P300002COD = '" & trim(wCLA001) & "'" 
			Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
			rstQuery2.Open sql , strCnn
			IF NOT rstQuery2.EOF THEN
				wChecked = "checked"
			END IF
			rstQuery2.Close 
			set rstQuery2 = nothing
	
	
			wCTR = "chDEP" & wCuentaDEP
			wCT2 = "txDEP" & wCuentaDEP
			
			If wColumna = 1 Then
				%><tr><%
			End If  

			%>
				<td style="width: 200px" class="auto-style1"><input name="<%=wCTR%>" type="checkbox" title="<%=wDES%>" <%=wChecked%> > <%=wDES%>
				<input name="<%=wCT2%>" value="<%=wCOD%>" type="hidden"></td>
			<%
										
						
			If wColumna = 3 Then		
				%></tr><%
		   		wColumna = 0	
			End If			
					
			wColumna = wColumna + 1	
			wCuentaDEP = wCuentaDEP + 1	
		rstQuery.MoveNext  
       	LOOP
       	rstQuery.CLOSE
       	SET rstQuery = NOTHING	

%>





	
</table>

</fieldset>

<br/>

<fieldset style="background-color: #FAFAF8 ">
<legend><strong>Hobbies</strong></legend>

<table style="width: 95%" align="center">
	
	
	<%
	
		SQL = " SELECT P300700CON, P300700DES FROM X300PF700 " 																	
		SQL = SQL & " WHERE "
		SQL = SQL & " P300700CCI = '" & trim(Session("glCiaInternet")) & "' AND "
		SQL = SQL & " P300700TIP = '2' "
		SQL = SQL & " ORDER BY  P300700DES " 					
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		wColumna = 1
		wCuentaHOB = 1
		DO WHILE NOT rstQuery.EOF 
			wCOD = trim(rstQuery.Fields(0))
			wDES = trim(rstQuery.Fields(1))
			
			wChecked = ""						
			SQL = "SELECT P300002CON "
			SQL = SQL & " FROM X300PF002 WHERE "
			SQL = SQL & " P300002CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " P300002CON = '" & wCOD & "' AND "
			SQL = SQL & " P300002TIP = '2' AND "
			SQL = SQL & " P300002COD = '" & trim(wCLA001) & "'" 
			Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
			rstQuery2.Open sql , strCnn
			IF NOT rstQuery2.EOF THEN
				wChecked = "checked"
			END IF
			rstQuery2.Close 
			set rstQuery2 = nothing
			
			wCTR = "chHOB" & wCuentaHOB
			wCT2 = "txHOB" & wCuentaHOB
			
			If wColumna = 1 Then
				%><tr><%
			End If  

			%>
				<td style="width: 200px" class="auto-style1"><input name="<%=wCTR%>" type="checkbox" title="<%=wDES%>" <%=wChecked%>> <%=wDES%>
				<input name="<%=wCT2%>" value="<%=wCOD%>" type="hidden">
				</td>
			<%
										
						
			If wColumna = 3 Then		
				%></tr><%
		   		wColumna = 0	
			End If			
					
			wColumna = wColumna + 1	
			wCuentaHOB = wCuentaHOB + 1	
		rstQuery.MoveNext  
       	LOOP
       	rstQuery.CLOSE
       	SET rstQuery = NOTHING	

%>



	</table>
</fieldset>

<br/>

<fieldset style="background-color: #FAFAF8 ">
<legend><strong>¿Como nos Conoció?</strong></legend>

<table style="width: 95%" align="center">
	
	
	<%
	
		SQL = " SELECT P300700CON, P300700DES FROM X300PF700 " 																	
		SQL = SQL & " WHERE "
		SQL = SQL & " P300700CCI = '" & trim(Session("glCiaInternet")) & "' AND "
		SQL = SQL & " P300700TIP = '3' "
		SQL = SQL & " ORDER BY  P300700DES " 					
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		wColumna = 1
		wCuentaPRO = 1
		DO WHILE NOT rstQuery.EOF 
			wCOD = trim(rstQuery.Fields(0))
			wDES = trim(rstQuery.Fields(1))
			
			wChecked = ""						
			SQL = "SELECT P300002CON "
			SQL = SQL & " FROM X300PF002 WHERE "
			SQL = SQL & " P300002CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " P300002CON = '" & wCOD & "' AND "
			SQL = SQL & " P300002TIP = '3' AND "
			SQL = SQL & " P300002COD = '" & trim(wCLA001) & "'" 
			Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
			rstQuery2.Open sql , strCnn
			IF NOT rstQuery2.EOF THEN
				wChecked = "checked"
			END IF
			rstQuery2.Close 
			set rstQuery2 = nothing
			
			wCTR = "chPRO" & wCuentaPRO
			wCT2 = "txPRO" & wCuentaPRO
			
			If wColumna = 1 Then
				%><tr><%
			End If  

			%>
				<td style="width: 200px" class="auto-style1"><input name="<%=wCTR%>" type="checkbox" title="<%=wDES%>" <%=wChecked%> > <%=wDES%>
				<input name="<%=wCT2%>" value="<%=wCOD%>" type="hidden">
				</td>
			<%
										
						
			If wColumna = 3 Then		
				%></tr><%
		   		wColumna = 0	
			End If			
					
			wColumna = wColumna + 1	
			wCuentaPRO = wCuentaPRO + 1	
		rstQuery.MoveNext  
       	LOOP
       	rstQuery.CLOSE
       	SET rstQuery = NOTHING	

%>


	
	</table>
</fieldset>

<INPUT NAME="tDEP" id="tDEP" size=15 value="<%=wCuentaDEP%>" TYPE="Hidden" >	
<INPUT NAME="tHOB" id="tHOB" size=15 value="<%=wCuentaHOB%>" TYPE="Hidden" >	
<INPUT NAME="tPRO" id="tPRO" size=15 value="<%=wCuentaPRO%>" TYPE="Hidden" >		

<br/>

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>
<td><input name="btnContinuar" type="submit" value="Continuar"  /></td>
<td>

<% IF wPAR = "2" THEN %>
<input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001P999.ASP?CLA001=<%=wCLA001%>&PAR=1','main');" />
<%ELSE%>
<input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001P001.asp?CLA001=<%=wCLA001%>&ORG=P&PAR=1','main');" />
<%END IF %>


</td>

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


</td> 
</tr> 
</table> 
</td>
</tr>
</table>
</form>
</body>

</html>
