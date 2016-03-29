<%@ Language=VBScript %>
<%

'Response.Expires = -1
'Response.Expiresabsolute = Now() - 1
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
    frmGral.btnGuardar.disabled = false; 

    

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
  		
  		var cel;
  		cel = frmGral.txP300001TEM.value;
  		if (cel.length<7){
  		   alert("Indique los 7 Digitos del Telefono de Contacto.");
  		   frmGral.txP300001TEM.focus();
  		   return false
  		}

    	
    	calculare(frmGral);
    	
    	//frmGral.btnGuardar.disabled = true; 
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
	wPAR = TRIM(Request.QueryString("PAR"))

	strCnn	= Application("XDTA300_ConnectionString")
	
	wExisteC = "N"
	wCLIENTE = "NO"
		
	IF wORG <> "P" THEN
		
		
		
		SQL = "SELECT A300002CCL, A300002RSO FROM X300AF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300002CCI = '" & Session("glCiaInternet") & "' AND "
		IF wORG = "C" THEN
			SQL = SQL & " A300002CCL = '" & trim(wCLA001) & "'" 
			ELSE
			SQL = SQL & " A300002RIF = '" & trim(wCLA001) & "'" 
		END IF 
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wExisteC = "S"
			wCLIENTE = "SI"
			wP300001NOM = trim(rstQuery.Fields("A300002RSO"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing
		
		wExisteP = "N"
		
		
		wP300001NIT = wCLA001
		IF wORG = "C" THEN
			wP300001NIT = wCLA002
		END IF
		
		SQL = "SELECT P300001COD FROM X300PF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300001CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300001NIT = '" & trim(wCLA001) & "'" 
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wExisteP = "S"
			wCLA001 = trim(rstQuery.Fields("P300001COD"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing

		
	END IF 
	
	IF wExisteP = "S" OR wORG = "P" THEN
		
		SQL = "SELECT P300001NOM, P300001APE, P300001NIT, P300001PRO, P300001FNA, P300001EDA, "
		SQL = SQL & " P300001NOC, P300001CEL, P300001TEL, P300001EMA, P300001CIU, P300001CLI, "
		SQL = SQL & " P300001EMP, P300001NEM, P300001TEM, P300001DEM, P300001SEC "
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
			
			wP300001EMP = trim(rstQuery.Fields("P300001EMP"))
			wP300001NEM = trim(rstQuery.Fields("P300001NEM"))
			wP300001TEM = trim(rstQuery.Fields("P300001TEM"))
			wP300001DEM = trim(rstQuery.Fields("P300001DEM"))
			wP300001SEC = trim(rstQuery.Fields("P300001SEC"))
			
		END IF
		rstQuery.Close 
		set rstQuery = nothing
		
		
		
		wP300001COD = wCLA001
		
	
	END IF 
	
	IF wP300001CLI = "N" OR wExisteC = "N" THEN
		SQL = "SELECT A300002CCL, A300002RSO FROM X300AF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300002CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " A300002RIF = '" & trim(wP300001NIT) & "'" 
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wExisteC = "S"
			wCLIENTE = "SI"
		END IF
		rstQuery.Close 
		set rstQuery = nothing
	END IF 					
	
	IF wExisteP = "N" THEN
		wP300001COD = "Nuevo"		
	End If 
		
	wP300001CLI = wExisteC
	
%>



<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<form method="post" action="X001P001S.asp" name="frmGral" onsubmit="return validar();">

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
</table>
</fieldset>
<br/>
<fieldset style="background-color: #FAFAF8 ">
<legend><strong>Datos Basicos</strong></legend>

<table style="width: 95%" align="center">
	<tr>
		<td style="width: 213px" class="auto-style1">Es Cliente:</td>
		<td class="auto-style1"> <%=wCLIENTE%><input type="hidden" name="txP300001CLC" value="<%=wP300001CLI%>"> </td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Nombres:</td>
		<td class="auto-style1"> 
		<input id="txP300001NOM" type="text" name="txP300001NOM" autofocus value="<%=wP300001NOM%>" style="width: 258px" required/></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Apellidos:</td>
		<td class="auto-style1"> 
		<input id="txP300001APE" type="text" name="txP300001APE" style="width: 258px" value="<%=wP300001APE%>" required /></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Nit:</td>
		<td class="auto-style1"> <input id="txP300001NIT" type="text" name="txP300001NIT"  value="<%=wP300001NIT%>" required /></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Profesión:</td>
		<td class="auto-style1"> <input id="txP300001PRO" type="text" name="txP300001PRO" value="<%=wP300001PRO%>" /></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Fecha de Nacimiento:</td>
		<td class="auto-style1"> 
		<input id="txP300001FNA" type="text" name="txP300001FNA" value="<%=wP300001FNA%>" required maxlength="10" style="width: 82px" onchange="calculare(this.form);" onblur="calculare(this.form);" onkeyup="formato_fecha(this);"/>
		<a href="javascript:cal1.popup();"><img height="16" alt="Haga Click Aqui para Seleccionar Fecha" src="img/cal.gif" width="16" border="0"></a></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Edad:</td>
		<td class="auto-style1"> 
		<input id="txP300001EDA" type="text" name="txP300001EDA" style="width: 50px" value="<%=wP300001EDA%>" /></td>
	</tr>
</table>

</fieldset>

<br/>

<fieldset style="background-color: #FAFAF8 ">
<legend><strong>Datos Contacto</strong></legend>

<table style="width: 95%" align="center">
	<tr>
		<td style="width: 213px" class="auto-style1">Nombre y Apellido:</td>
		<td class="auto-style1"> 
		<input id="txP300001NOC" type="text" name="txP300001NOC" style="width: 258px" value="<%=wP300001NOC%>" required/></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Celular:</td>
		<td class="auto-style1"> <input id="txP300001CEL" type="text" name="txP300001CEL" value="<%=wP300001CEL%>" required /></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Telefono:</td>
		<td class="auto-style1"> <input id="txP300001TEL" type="text" name="txP300001TEL" value="<%=wP300001TEL%>" required/></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Email:</td>
		<td class="auto-style1"> 
		<input id="txP300001EMA" type="text" name="txP300001EMA" style="width: 258px" value="<%=wP300001EMA%>" required/></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Ciudad:</td>
		<td class="auto-style1"> <select name="ddlP300001CIU">
			<optgroup label="Seleccione una Ciudad">
				<%
														
											
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT P300705COD, P300705DES FROM X300PF705 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " P300705CCI = '" & trim(Session("glCiaInternet")) & "' "
 									SQL = SQL & " ORDER BY  P300705DES " 					
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),25)							
										IF TRIM(wP300001CIU) = wCOD THEN
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
		</select></td>
	</tr>
	</table>
</fieldset>

<br/>

<fieldset style="background-color: #FAFAF8 ">
<legend><strong>Datos Empresa</strong></legend>

<table style="width: 95%" align="center">
	<tr>
		<td style="width: 213px" class="auto-style1">Nombre:</td>
		<td class="auto-style1"> 
		<input id="txP300001EMP" type="text" name="txP300001EMP" style="width: 258px" value="<%=wP300001EMP%>" required/></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Nit/Rif:</td>
		<td class="auto-style1"> <input id="txP300001NEM" type="text" name="txP300001NEM" value="<%=wP300001NEM%>" required /></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Telefono:</td>
		<td class="auto-style1"> <input id="txP300001TEM" type="text" name="txP300001TEM" value="<%=wP300001TEM%>" required/></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Dirección:</td>
		<td class="auto-style1"> 
		<input id="txP300001DEM" type="text" name="txP300001DEM" style="width: 258px" value="<%=wP300001DEM%>" required/></td>
	</tr>
	<tr>
		<td style="width: 213px" class="auto-style1">Sector:</td>
		<td class="auto-style1"> <select name="ddlP300001SEC">
			<optgroup label="Seleccione un Sector" >
				<%
														
											
									
									strCnn	= Application("XDTA300_ConnectionString")
									SQL = " SELECT P300702CON, P300702DES FROM X300PF702 " 																	
 									SQL = SQL & " WHERE "
							 		SQL = SQL & " P300702CCI = '" & trim(Session("glCiaInternet")) & "' "
 									SQL = SQL & " ORDER BY  P300702DES " 					
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=""""></OPTION>" 
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),25)							
										IF TRIM(wP300001SEC) = wCOD THEN
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
		</select></td>
	</tr>
	</table>
</fieldset>

<br/>

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>
<td><input name="btnGuardar" type="submit" value="Continuar"  /></td>

<td>
<% IF wPAR = "1" THEN %>
<input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001P999.ASP?CLA001=<%=wCLA001%>&PAR=1','main');" />
<%ELSE%>
<input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001Z204.ASP?URL=1','main');" />
<%END IF %>
<input type="hidden" name="aplaza" /> 
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
	var cal1 = new calendar1(document.forms['frmGral'].elements['txP300001FNA']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
			
//-->
</script>
</body>

</html>
