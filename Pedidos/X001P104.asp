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


<title>Cierre de Oportunidad</title>
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


		if ((document.frmGral.ddlP300100INS.value=='N') && (document.frmGral.ddlP300100RIN.value=='0')){
  		   alert("Por favor, Indique Razón de Insatisfacción.");
  		   frmGral.ddlP300100RIN.focus();  
  		   return false
  		}

		
   	 	if (document.frmGral.ddlP300100CUR.value=='0'){
  		   alert("Por favor, Seleccione el Cumplimiento del Recaudo.");
  		   frmGral.ddlP300100CUR.focus();  
  		   return false
  		}
  		
  		if (confirm('¿Desea Registar una Nueva Oportunidad? \n \n Si su respuesta es afirmativa Presione ACEPTAR en caso contrario presione CANCELAR.')) {
  			//return false
  			frmGral.NUEVA.value = 'S';  
		}
  		
  		/*var fechaInicio = document.getElementById("txP300102FEC2").value;
 	    var fechaFin = document.getElementById("txP300102FEC").value;
 
  		var diaInicio=fechaInicio.substring(0,2);
	    var mesInicio=fechaInicio.substring(3,5);
        var anoInicio=fechaInicio.substring(6,10);
         
      	var diaFin=fechaFin.substring(0,2);
      	var mesFin=fechaFin.substring(3,5);
      	var anoFin=fechaFin.substring(6,10);
        var f1 =  new Date(anoInicio,mesInicio,diaInicio);
      	var f2 =  new Date(anoFin,mesFin,diaFin);
      	var difDias = Math.floor((f2.getTime()-f1.getTime()) / (1000 * 60 * 60 * 24))+1;
      	
      	
       	if ((difDias<1) || (difDias>31)){
		   alert("Por favor, indique una Fecha No Superior a 31 dias con respecto a la fecha actual.");
  		   frmGral.txP300102FEC.focus();  
  		   return false
		}*/
  		
  	
    }
    
    
</script>

<script type="text/javascript"> 
//<![CDATA[
<!--
function formato_fecha(dator){
	var longitud=dator.value.length;
	if(!longitud) return;
		var modifica=0;
		var positor=dator.value.search('-');
		var charcero=dator.value.charAt(0);
		var chartres=dator.value.charAt(3);
		var charcuatro=dator.value.charAt(4);
		var charseis=dator.value.charAt(6);
		var mayorcero=parseInt(charseis);
	switch(longitud){
	case 2: if(positor == 1) {dator.value='0'+charcero+'-'; break;}
		if(nonumber(dator.value.charAt(1))) {dator.value=charcero; break}
			dator.value+='-'; rango_fecha(dator); break;
	case 5: if(charcuatro == '-') { dator.value=dator.value.substr(0,3)+'0'+chartres+'-'; break;}
		if(nonumber(charcuatro)) { modifica=4; break;}
			dator.value+='-'; rango_fecha(dator); break;
	case 1: if(charcero > 3) {dator.value='0'+charcero+'-'; break;}
	if(nonumber(charcero)) dator.value='';
	break;
	case 4: if(chartres > 1) dator.value=dator.value.substr(0,3)+'0'+chartres+'-';
		if(nonumber(chartres)) modifica=3;
	break;
	case 7: if(!mayorcero || (nonumber(charseis))) modifica=6; break;
	case 8: if(nonumber(dator.value.charAt(7))) modifica=7; break;
	case 9: if(nonumber(dator.value.charAt(8))) modifica=8; break;
	case 10: if(nonumber(dator.value.charAt(9))) modifica=9; break
	rango_fecha(dator); break;
}
	if(modifica) dator.value=dator.value.substr(0,modifica);
	}
 
function nonumber(digito){
	if(digito < '0' || digito > '9') return true;
	return false;
}
 
function rango_fecha(dator){
	var dt=dator.value.length;
	var barra_a='-';
	var barra_b='-';
	if(!dt) return;
	var st=dator.value.split('-');
	if(dt > 2) if(st[0] > 31) st[0]=31;
	if(dt > 5) {
	if(st[1] > 12) st[1]=12;
	if((st[1] == 4) || (st[1] == 6) || (st[1] == 9) || (st[1] == 11)){
	if(st[0] > 30) st[0]=30;
	}
	}
	if(dt > 9){
	if(st[2] > 2500) st[2]='2011';
	if(st[1] == 2){
	if (!(st[2] % 4) && (st[2] % 100) || !(st[2] % 400)){
	if(st[0] > 29) st[0]=29;
	}
	else {
	if(st[0] > 28) st[0]=28;
	}
	}
	}
	if(dt < 7) st[2]='';
	if(dt < 6) barra_a='';
	if(dt < 4) st[1]='';
	if(dt < 3) barra_b='';
	dator.value=st[0]+barra_a+st[1]+barra_b+st[2];
	return st[0];
}
 
function calculare(form){
	form.txP300001EDA.value=calcular_edad(form);
}
 
function calcular_edad(form){
	var fecha=form.txP300001FNA.value;
	var array_fecha = fecha.split('-');
	if (array_fecha.length!=3) return (0);
	var ano = parseInt(array_fecha[2]);
	if (isNaN(ano)) return (0);
	var mes = parseInt(array_fecha[1]);
	if(!mes){
	mes=parseInt(fecha[4]);
	}
	if (isNaN(mes)) return (0);
	var dia = parseInt(array_fecha[0]);
	if(!dia){
	dia=parseInt(fecha[1]);
	}
	if (isNaN(dia)) return (0);
	if (ano <= 99){
	 
	ano +=1900;form.fecha_a.value=form.fecha_a.value.substr(0,6)+ano;
	 
	formato_fecha(form.fecha_a);
	}
	 
		
	var date = new Date();
	var str = date.getDate() + "-";
    str += (date.getMonth() + 1) + "-";    
    str += date.getFullYear();
    
   	//alert(str);
	
	var hoy=str; //form.fecha_b.value;
	var array_hoy = hoy.split('-');
	if (array_hoy.length!=3) return (0);
	var anhoy = parseInt(array_hoy[2]);
	if (isNaN(anhoy)) return (0);
	var meshoy = parseInt(array_hoy[1]);
	if(!meshoy){
	meshoy=parseInt(hoy[4]);
	}
	if (isNaN(meshoy)) return (0);
	var dihoy = parseInt(array_hoy[0]);
	if(!dihoy){
	dihoy=parseInt(hoy[1]);
	}
	if (isNaN(dihoy)) return (0);
	if (anhoy <= 99){
	anhoy+=1900;
 
	//form.fecha_b.value=form.fecha_b.value.substr(0,6)+anhoy;
 
	//formato_fecha(form.fecha_b);
	}
 
	var edad = anhoy - ano - 1;
	var mesus="0";
	var dius="0";
	form.aplaza.value='35/'+mes+'/'+ano;
	var dias_mes=parseInt(rango_fecha(form.aplaza));
 
	if (meshoy > mes){
	edad++;
	mesus = meshoy - mes - 1;
	if (dihoy >= dia){
	mesus++;
	}
	}
	if(meshoy < mes){
	mesus = 12 - (mes - meshoy);
	if(dihoy < dia) mesus--;
	}
	if (meshoy == mes) {
	if (dihoy >= dia) {
	edad++;
	}
	else mesus=11;
	}
	if (dihoy >= dia) dius=dihoy-dia;
	if (dihoy < dia){
	dius = dias_mes - (dia - dihoy);
	}
 
	//form.meses.value=mesus;
	//form.dias.value=dius;
	//form.frac_ano.value=parseFloat(edad+mesus/12+dius/12/dias_mes).toFixed(2);
	//alert(parseFloat(edad+mesus/12+dius/12/dias_mes).toFixed(2));
	return edad;
	}
	// -->
	//]]>
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
	wNUEVA = "N"


	
	IF LEN(TRIM(wCLA002)) > 0 THEN
	
		wPROCESO = "Actualizar"
		wP300100INS = "S"
		SQL = "SELECT P300100FPA, P300100BAN, P300100MFA, P300100COP, P300100CPE, "
		SQL = SQL & " P300100STS, P300100FCI, P300100INS, P300100RIN, P300100PUC,  " 
		SQL = SQL & " P300100CUR FROM X300PF100 WHERE "
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
			wP300100STS = trim(rstQuery.Fields("P300100STS"))
			wP300100FCI = trim(rstQuery.Fields("P300100FCI"))
			wP300100INS = trim(rstQuery.Fields("P300100INS"))
			wP300100RIN = trim(rstQuery.Fields("P300100RIN"))
			wP300100PUC = trim(rstQuery.Fields("P300100PUC"))
			wP300100CUR = trim(rstQuery.Fields("P300100CUR"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing
		
		'response.write wP300100CUR
					
		
		wSELINS01 = ""
		wSELINS02 = "" 
		SELECT CASE wP300100INS 
			CASE "S"
				wSELINS01 = " selected"
			CASE "N"
				wSELINS02 = " selected"	 
		END SELECT
		
		IF wP300100STS = "2" THEN 
			wP300100FCI = Right("00" & Day(wP300100FCI),2) & "-" & Right("00" & Month(wP300100FCI),2) & "-" & Year(wP300100FCI) & " " & Timevalue(wP300100FCI)
		END IF 	
		

					
	  ELSE
		
		wCLA002 = "Nuevo"
	
	END IF 		
	
%>



<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<form method="post" action="X001P104S.asp?CLA001=<%=wCLA001%>" name="frmGral" onsubmit="return validar();">

		<input id="txP300102FEC2" type="hidden" name="txP300102FEC2" value="<%=wP300102FEC2%>">

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
<legend><strong>Cierre de Oportunidad</strong></legend>

<table style="width: 95%; " align="center" cellpadding="7" class="auto-style3" >
<tr>
		<td style="width: 213px" class="auto-style1">Nro.:</td>
		<td class="auto-style1"> 
		<%=wCLA002%>
		<INPUT NAME="NRO" id="NRO" size=15 value="<%=wCLA002%>" TYPE="Hidden" >
		</td>
	</tr>
<tr>
		<td style="width: 213px" class="auto-style1">Se entrego producto a 
		Satisfacción:</td>
		<td class="auto-style1"> 
		<select name="ddlP300100INS">
				<optgroup label="Seleccione">
				<option value="S" <%=wSELINS01%>>SI</option>
				<OPTION value="N" <%=wSELINS02%>>NO</OPTION>				
		</optgroup>

			
		</select>
		</td>
	</tr>

	<tr>
		<td style="width: 213px" class="auto-style1">Razón de la Insatisfacción:</td>
		<td class="auto-style1"> 
			<select name="ddlP300100RIN">
				<optgroup label="Seleccione">
					<OPTION value="0"></OPTION>
								<%								
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT P300713COD, P300713DES "
									SQL = SQL & " FROM X300PF713 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " P300713CCI = '" & trim(Session("glCiaInternet")) & "' "
									SQL = SQL & " ORDER BY  P300713DES " 	
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),50)							
										IF TRIM(wP300100RIN) = wCOD THEN
										   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL = ""
										END IF 
										Response.write "<OPTION value=" & """" & wCOD & """" & wSEL & ">" & wDES & "</OPTION>" 										
										
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
		<td style="width: 213px" class="auto-style1">Cumplimiento del Recaudo:</td>
		<td class="auto-style1"> 
			<select name="ddlP300100CUR">
				<optgroup label="Seleccione">
				
				<%
				
				For i=10 to 100
						IF TRIM(wP300100CUR) = TRIM(i) THEN
						    wSEL = " selected"
						  ELSE 
						  wSEL = ""
						END IF 

						Response.write "<OPTION value=" & """" & i & """" & wSEL & ">" & i & "</OPTION>"
 					i = i + 9
 				next
				
				%>
				
				
		</optgroup>
		</select>
		</td>
	</tr>
	
	<% IF wP300100STS = "2" THEN%> 
	<tr>
		<td style="width: 213px" class="auto-style1">Cerrado el:</td>
		<td class="auto-style1"> 
		<%=wP300100FCI%> por <%=wP300100PUC%> 
	</td></tr>
	<% END IF %>
</table>
</fieldset>

<br/>
<INPUT NAME="PROCESO" id="PROCESO" size=15 value="<%=wPROCESO%>" TYPE="Hidden" >
<INPUT NAME="NUEVA" id="NUEVA" size=15 value="<%=wNUEVA%>" TYPE="Hidden" >

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>
<% IF wP300100STS <> "2" THEN %>
<td><input name="btnContinuar" type="submit"value="Cerrar Oportunidad" /></td>
<% END IF %>
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
<script type="text/javascript" language="javascript">
<!-- // create calendar object(s) just after form tag closed
	 // specify form element as the only parameter (document.forms['formname'].elements['inputname']);
	 // note: you can have as many calendar objects as you need for your application
	//var cal1 = new calendar1(document.forms['frmGral'].elements['txP300102FEC']);
	//cal1.year_scroll = true;
	//cal1.time_comp = false;
	
			
//-->
</script>

</body>


</html>
