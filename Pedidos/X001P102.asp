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


<title>Seguimiento</title>
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


		if (document.frmGral.txP300102FEC.value==''){
  		   alert("Por favor, Indique fecha.");
  		   frmGral.txP300102FEC.focus();  
  		   return false
  		}


   	 	if (document.frmGral.txP300102COM.value==''){
  		   alert("Por favor, Indique Comentario.");
  		   frmGral.txP300102COM.focus();  
  		   return false
  		}
		
		
   	 	if (document.frmGral.ddlP300102CAL.value=='0'){
  		   alert("Por favor, Seleccione Calificación.");
  		   frmGral.ddlP300102CAL.focus();  
  		   return false
  		}
  		
  		var fechaInicio = document.getElementById("txP300102FEC2").value;
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
		}
  		
  	
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
		
		SQL = "SELECT P300102ACT, P300102FEC, P300102COM, P300102DEM, P300102DEO, " 
		SQL = SQL & " P300102CAL, P300102MEF, P300102FAC, P300102PUS FROM X300PF102 WHERE "
		SQL = SQL & " P300102CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300102CCL = '" & trim(wCLA001) & "' AND "
		SQL = SQL & " P300102NPE = '" & trim(wCLA002) & "' "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wP300102ACT = trim(rstQuery.Fields("P300102ACT"))
			wP300102FEC = trim(rstQuery.Fields("P300102FEC"))
			wP300102COM = trim(rstQuery.Fields("P300102COM"))
			wP300102DEM = trim(rstQuery.Fields("P300102DEM"))
			wP300102CAL = trim(rstQuery.Fields("P300102CAL"))
			wP300102MEF = trim(rstQuery.Fields("P300102MEF"))
			wP300102DEO = trim(rstQuery.Fields("P300102DEO"))
			wP300102FAC = trim(rstQuery.Fields("P300102FAC"))
			wP300102PUS = trim(rstQuery.Fields("P300102PUS"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing
		
		IF wP300102MEF = "0" THEN
			wP300102MEF = wP300100MFA 
		END IF 
		
		IF wP300102DEO <> "0" THEN
		
			SQL = "SELECT P300712DES FROM X300PF712 WHERE " 
			SQL = SQL & " P300712CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " P300712COD = '" & trim(wP300102DEO) & "' "
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
			rstQuery.Open sql , strCnn
			IF NOT rstQuery.EOF THEN
				wP300712DES = trim(rstQuery.Fields("P300712DES"))
			END IF
			rstQuery.Close 
			set rstQuery = nothing			
			
		END IF 
		
		IF NOT ISNULL(wP300102FAC) THEN 
			wP300102FAC = Right("00" & Day(wP300102FAC),2) & "-" & Right("00" & Month(wP300102FAC),2) & "-" & Year(wP300102FAC) & " " & Timevalue(wP300102FAC)
		END IF 
		
		wP300102FEC = Right("00" & Day(wP300102FEC),2) & "-" & Right("00" & Month(wP300102FEC),2) & "-" & Year(wP300102FEC)
		wP300102FEC2 = Right("00" & Day(now),2) & "-" & Right("00" & Month(now),2) & "-" & Year(now)

		
		SELECT CASE wP300102MEF
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
		
		SELECT CASE wP300102DEM 
			CASE "S"
				wSELDEM01 = " selected"
			CASE "N"
				wSELDEM02 = " selected"	 
		END SELECT
		
		SELECT CASE wP300102CAL 
			CASE "1"
				wSELCAL01 = " selected"
			CASE "2"
				wSELCAL02 = " selected"
			CASE "3"
				wSELCAL03 = " selected"
			CASE "4"
				wSELCAL04 = " selected"
			CASE "5"
				wSELCAL05 = " selected"
		END SELECT

					
	  ELSE
		
		wCLA002 = "Nuevo"
	
	END IF 		
	
%>



<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<form method="post" action="X001P102S.asp?CLA001=<%=wCLA001%>" name="frmGral" onsubmit="return validar();">

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
<legend><strong>Seguimiento de Oportunidad</strong></legend>

<table style="width: 95%; " align="center" cellpadding="7" class="auto-style3" >
<tr>
		<td style="width: 213px" class="auto-style1">Nro.:</td>
		<td class="auto-style1"> 
		<%=wCLA002%>
		<INPUT NAME="NRO" id="NRO" size=15 value="<%=wCLA002%>" TYPE="Hidden" >
		</td>
	</tr>
<tr>
		<td style="width: 213px" class="auto-style1">Actividad:</td>
		<td class="auto-style1"> 
		<select name="ddlP300102ACT">
				<optgroup label="Seleccione Forma de Pago">
								<%								
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT P300711COD, P300711DES "
									SQL = SQL & " FROM X300PF711 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " P300711CCI = '" & trim(Session("glCiaInternet")) & "' "
									SQL = SQL & " ORDER BY  P300711DES " 	
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),50)							
										IF TRIM(wP300102ACT) = wCOD THEN
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
		<td style="width: 213px" class="auto-style1">Fecha:</td>
		<td class="auto-style1"> 
			<input id="txP300102FEC" type="text" name="txP300102FEC" value="<%=wP300102FEC%>" required style="width: 82px" onkeyup="formato_fecha(this);" maxlength="10"/>
		<input id="txP300102FEC2" type="hidden" name="txP300102FEC2" value="<%=wP300102FEC2%>">
		<a href="javascript:cal1.popup();"><img height="16" alt="Haga Click Aqui para Seleccionar Fecha" src="img/cal.gif" width="16" border="0"></a>
		</td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Comentarios:</td>
		<td class="auto-style1"> 
			<input id="txP300102COM" type="text"  name="txP300102COM" style="width: 416px" value="<%=wP300102COM%>" maxlength="150" />

		</td>
	</tr>
	
	<tr>
		<td style="width: 213px" class="auto-style1">Demo:</td>
		<td class="auto-style1"> 
			<select name="ddlP300102DEM">
				<optgroup label="Seleccione">
				<OPTION value="S" <%=wSELDEM01%>>SI</OPTION>
				<OPTION value="N" <%=wSELDEM02%>>NO</OPTION>
				
				
				
		</optgroup>
		</select>
		</td>
	</tr>

	<tr>
		<td style="width: 213px" class="auto-style1">Calificación:</td>
		<td class="auto-style1"> 
			<select name="ddlP300102CAL">
				<optgroup label="Seleccione">
						<option value="0"></option>
				<OPTION value="1" <%=wSELCAL01%>>1</OPTION>
				<OPTION value="2" <%=wSELCAL02%>>2</OPTION>
				<OPTION value="3" <%=wSELCAL03%>>3</OPTION>
				<OPTION value="4" <%=wSELCAL04%>>4</OPTION>
				<OPTION value="5" <%=wSELCAL05%>>5</OPTION>
				
				
				
		</optgroup>
		</select>
		</td>
	</tr>
	
	<tr>
		<td style="width: 213px" class="auto-style1">Mes de Facturación:</td>
		<td class="auto-style1"> 
			<select name="ddlP300102MEF">
				<optgroup label="Seleccione Mes de Facturación">
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
	
	
	<% IF Session("glTipoUsuario") <> "V" THEN %>
	
	<tr>
		<td style="width: 213px" class="auto-style1">Descalificar:</td>
		<td class="auto-style1"> 
		<select name="ddlP300102DEO">
		<optgroup label="Seleccione">
		<option value="0">NO</option>
				
								<%								
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT P300712COD, P300712DES "
									SQL = SQL & " FROM X300PF712 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " P300712CCI = '" & trim(Session("glCiaInternet")) & "' "
									SQL = SQL & " ORDER BY  P300712DES " 	
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),50)							
										IF TRIM(wP300102DEO) = wCOD THEN
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
	<%ELSE%>
		<% IF wP300102DEO <> "0" THEN%>
		<tr>
		<td style="width: 213px" class="auto-style1">Descalificación:</td>
		<td class="auto-style1"> 
		<%=wP300712DES%> 
		</td></tr>
			<% END IF %>	
	<% END IF %>
	<% IF NOT ISNULL(wP300102PUS) THEN%> 
	<tr>
		<td style="width: 213px" class="auto-style1">Actualizado el:</td>
		<td class="auto-style1"> 
		<%=wP300102FAC%> por <%=wP300102PUS%> 
	</td></tr>
	<% END IF %>
</table>
</fieldset>

<br/>
<INPUT NAME="PROCESO" id="PROCESO" size=15 value="<%=wPROCESO%>" TYPE="Hidden" >

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>
<% IF wP300102DEO <> "0" OR Session("glTipoUsuario") <> "V" THEN %>
<td><input name="btnContinuar" type="submit"value="Guardar" /></td>
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
	var cal1 = new calendar1(document.forms['frmGral'].elements['txP300102FEC']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
			
//-->
</script>

</body>


</html>
