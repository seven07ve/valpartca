<%@ Language=VBScript %>

<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>


<!--#include file="X001Z001.INC"-->
<!--#include file="X001Z900.INC"-->
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<script language="JavaScript" src="calendar1.js"></script><!-- Date only with year scrolling -->
<script language="javascript" SRC="jScript.js">

   

</script>

<style type="text/css">

#flotante
{
	position: absolute;
	display:none;
	font-family:Arial;
	font-size:0.8em;
	border:1px solid #808080;
	background-color:#f1f1f1;
}

#bancos
{
	position: absolute;
	display:none;
	font-family:Arial;
	font-size:0.8em;
	border:1px solid #808080;
	background-color:#f1f1f1;
}


#cheques
{
	position: absolute;
	display:none;
	font-family:Arial;
	font-size:0.8em;
	border:1px solid #808080;
	background-color:#f1f1f1;
}

</style>

<script language="Javascript">

function showdiv(event,par)
{
	//determina un margen de pixels del div al raton
	margin=10;

	//La variable IE determina si estamos utilizando IE
	var IE = document.all?true:false;
	//Si no utilizamos IE capturamos el evento del mouse
	if (!IE) document.captureEvents(Event.MOUSEMOVE)

	var tempX = 0;
	var tempY = 0;

	if(IE)
	{ //para IE
		tempX = event.clientX + document.body.scrollLeft;
		tempY = event.clientY + document.body.scrollTop;
	}else{ //para netscape
		tempX = event.pageX;
		tempY = event.pageY;
	}
	if (tempX < 0){tempX = 0;}
	if (tempY < 0){tempY = 0;}

	//modificamos el valor del id "posicion" para indicar la posicion del mouse
	//document.getElementById('posicion').innerHTML="PosX = "+tempX+" | PosY = "+tempY;

	if (par==0){
		document.getElementById('flotante').style.top = (tempY+margin);
		document.getElementById('flotante').style.left = (tempX+margin);
		document.getElementById('flotante').style.display='block';
	}
	
	if (par==1){
		document.getElementById('bancos').style.top = (tempY+margin);
		document.getElementById('bancos').style.left = (tempX+margin);
		document.getElementById('bancos').style.display='block';
	}

	if (par==2){
		document.getElementById('cheques').style.top = (tempY+margin);
		document.getElementById('cheques').style.left = (tempX+margin);
		document.getElementById('cheques').style.display='block';
	}

	return;
}

function enviar() {

	document.frmGral.Procesar.disabled = true;
	document.frmGral.Cancelar.disabled = true;
	
	if (ValidarPantallaPagos()) {
		document.frmGral.submit(); 
		}else{
		document.frmGral.Procesar.disabled = false;
		document.frmGral.Cancelar.disabled = false;
	}
}

function validarletras(){

	var key=window.event.keyCode;

	if (key < 48 || key > 57){
		window.event.keyCode=0;
	}

}

function validarletras2(){

	var key=window.event.keyCode;
	//alert(key);
	//|| key == 46 
	if (key >= 48 && key <= 57 || key == 44){

	}else{
		window.event.keyCode=0;
	}

}


function sumar(val) {

	if (Validar2(val)) {
		
		return false  
	
	}else{
	
		var num = frmGral.MCO.value
    	num = num.replace(",",".");   
    	
    	var num01 = frmGral.MCO01.value
    	num01 = num01.replace(",","."); 
    	
    	var num02 = frmGral.MCO02.value
    	num02 = num02.replace(",","."); 
    	
    	var num03 = frmGral.MCO03.value
    	num03 = num03.replace(",",".");
    	
		var num04 = frmGral.MCO04.value
	    num04 = num04.replace(",",".");  
    
    	//alert(parseFloat(num) + ' - ' + parseFloat(num01) + ' - ' + parseFloat(num02))
    	//alert(num02)
    	//alert(num03)
    	//alert(num04)
    	
	   	num = parseFloat(num) + parseFloat(num01)
	    num = parseFloat(num) + parseFloat(num02)
	    num = parseFloat(num) + parseFloat(num03)
	    num = parseFloat(num) + parseFloat(num04)
	    
	    num = Math.round(num*100)/100
		//alert(num)
		frmGral.TMCO.value = num  
	
	}		
	
}


function ValidarPantallaPagos(){
    
    ///////////////////////////////
    var num = frmGral.MCO.value
    num = num.replace(",",".");    
    
    
    if( ('<%=Session("glTipoUsuario")%>'=='V') && (frmGral.NRC.value=='0') ){
        alert("Seleccione el Nro. del Talonario Físico.");
        frmGral.NRC.focus() 
        return false      
    } 
    
    if( (Vacio(frmGral.DOC.value) == false) && (num>0) ) {  
        alert("Introduzca el Documento.");
        frmGral.DOC.focus() 
        return false      
    }
    
    if( (Vacio(frmGral.NCH.value) == false) && (frmGral.CBC.value != '0') && (num>0) ) {  
        alert("Introduzca el Numero de Cheque.");
        frmGral.NCH.focus() 
        return false      
    }
    
    if( (Vacio(frmGral.DOC.value) == true) && (num<=0) ) {  
        alert("Introduzca el Monto.");
        frmGral.MCO.focus() 
        return false      
    }
    
    ///////////////////////////////
    var num01 = frmGral.MCO01.value
    num01 = num01.replace(",",".");    
    if( (Vacio(frmGral.DOC01.value) == false) && (num01>0) ) {  
        alert("Introduzca el Documento.");
        frmGral.DOC01.focus() 
        return false      
    }
    
    if( (Vacio(frmGral.NCH01.value) == false) && (frmGral.CBC01.value != '0') && (num>0) ) {  
        alert("Introduzca el Numero de Cheque.");
        frmGral.NCH01.focus() 
        return false      
    }

    
    if( (Vacio(frmGral.DOC01.value) == true) && (num01<=0) ) {  
        alert("Introduzca el Monto.");
        frmGral.MCO01.focus() 
        return false      
    }
    
    ///////////////////////////////
    var num02 = frmGral.MCO02.value
    num02 = num02.replace(",",".");
    if( (Vacio(frmGral.DOC02.value) == false) && (num02>0) ) {  
        alert("Introduzca el Documento.");
        frmGral.DOC02.focus() 
        return false      
    }
    
    if( (Vacio(frmGral.NCH02.value) == false) && (frmGral.CBC02.value != '0') && (num>0) ) {  
        alert("Introduzca el Numero de Cheque.");
        frmGral.NCH02.focus() 
        return false      
    }


    if( (Vacio(frmGral.DOC02.value) == true) && (num02<=0) ) {  
        alert("Introduzca el Monto.");
        frmGral.MCO02.focus() 
        return false      
    }
    
    ///////////////////////////////
    var num03 = frmGral.MCO03.value
    num03 = num03.replace(",",".");
    if( (Vacio(frmGral.DOC03.value) == false) && (num03>0) ) {  
        alert("Introduzca el Documento.");
        frmGral.DOC03.focus() 
        return false      
    }
    
	if( (Vacio(frmGral.NCH03.value) == false) && (frmGral.CBC03.value != '0') && (num>0) ) {  
        alert("Introduzca el Numero de Cheque.");
        frmGral.NCH03.focus() 
        return false      
    }

    
    if( (Vacio(frmGral.DOC03.value) == true) && (num03<=0) ) {  
        alert("Introduzca el Monto.");
        frmGral.MCO03.focus() 
        return false      
    }
    
    ///////////////////////////////
    var num04 = frmGral.MCO04.value
    num04 = num04.replace(",",".");
    if( (Vacio(frmGral.DOC04.value) == false) && (num04>0) ) {  
        alert("Introduzca el Documento.");
        frmGral.DOC04.focus() 
        return false      
    }
    
    if( (Vacio(frmGral.NCH04.value) == false) && (frmGral.CBC04.value != '0') && (num>0) ) {  
        alert("Introduzca el Numero de Cheque.");
        frmGral.NCH04.focus() 
        return false      
    }

    
    if( (Vacio(frmGral.DOC04.value) == true) && (num04<=0) ) {  
        alert("Introduzca el Monto.");
        frmGral.MCO04.focus() 
        return false      
    }
        
    num = parseFloat(num) + parseFloat(num01)
    num = parseFloat(num) + parseFloat(num02)
    num = parseFloat(num) + parseFloat(num03)
    num = parseFloat(num) + parseFloat(num04)
    //alert(num)    
     
    //Para Validar
    var num2 = frmGral.MCO2.value 
    //alert(num2)
    
    num2 = num2.replace(",","");
    num2 = num2.replace(",",".");

    /*if (parseInt(num) > parseInt(num2)) {
        alert("El Monto a Depositar o Transferir debe ser exacto al Monto adeudado.");
        frmGral.MCO.focus();
        return false
    }*/
	
	var afecha = frmGral.FECHA.value.split('-');  		
	var fechav = new Date(afecha[2],afecha[1],afecha[0]);
	
	var afecha0 = frmGral.FEC.value.split('-');  	
	var fecha0 = new Date(afecha0[2],afecha0[1],afecha0[0]);
	
	var afecha1 = frmGral.FEC01.value.split('-');  	
	var fecha1 = new Date(afecha1[2],afecha1[1],afecha1[0]);
	
	var afecha2 = frmGral.FEC02.value.split('-');  	
	var fecha2 = new Date(afecha2[2],afecha2[1],afecha2[0]);
	
	var afecha3 = frmGral.FEC03.value.split('-');  	
	var fecha3 = new Date(afecha3[2],afecha3[1],afecha3[0]);
	
	var afecha4 = frmGral.FEC04.value.split('-');  	
	var fecha4 = new Date(afecha4[2],afecha4[1],afecha4[0]);

	if (fecha0>fechav){
		alert('Fecha del Deposito ó Transferencia no puede ser Mayor a la Fecha Actual');
		frmGral.FEC.focus()  
		return false
	}
	
	if (fecha1>fechav){
		alert('Fecha del Deposito ó Transferencia no puede ser Mayor a la Fecha Actual');
		frmGral.FEC01.focus()  
		return false
	}
	
	if (fecha2>fechav){
		alert('Fecha del Deposito ó Transferencia no puede ser Mayor a la Fecha Actual');
		frmGral.FEC02.focus()  
		return false
	}
	
	if (fecha3>fechav){
		alert('Fecha del Deposito ó Transferencia no puede ser Mayor a la Fecha Actual');
		frmGral.FEC03.focus()  
		return false
	}
	
	if (fecha4>fechav){
		alert('Fecha del Deposito ó Transferencia no puede ser Mayor a la Fecha Actual');
		frmGral.FEC04.focus()  
		return false
	}
	
	//Inactivar al colocar en Producción
	//return false

    var men
	//if ((num < num2) || (num > num2)) {
    
    if (parseInt(num) <= 0) {
    	alert("El Monto a Depositar debe ser mayor a 0.");
        frmGral.MCO.focus();
        return false
    }
    
    if (parseInt(num) < parseInt(num2)) {
        
        men = "El Monto a Depositar o Transferir es Menor al Monto adeudado. \n\n ¿Está Usted de acuerdo?\n\n";
    	men += "Presione (Aceptar) si esta de acuerdo o (Cancelar) para corregir el Monto.\n\n" 
    	men += "RECUERDE NO COLOCAR EN EL MONTO SEPARADOR DE MILES Y UTILIZAR LA COMA (,) PARA DECIMALES." 
        
        //if (confirm(men)){
    		return true
    	/*}else{
    		frmGral.MCO.focus();
        	return false	
        }*/	
        
    }else{
    	if (parseInt(num) > parseInt(num2)) {
    		
    		men = "El Monto a Depositar o Transferir es Mayor al Monto adeudado. \n\n ¿Está Usted de acuerdo?\n\n";
    		men += "Presione (Aceptar) si esta de acuerdo o (Cancelar) para corregir el Monto.\n\n" 
    		men += "RECUERDE NO COLOCAR EN EL MONTO SEPARADOR DE MILES Y UTILIZAR LA COMA (,) PARA DECIMALES." 
    		if (confirm(men)){
    			//alert("ok");
    			return true
    		}else{
    			frmGral.MCO.focus();
        		return false	
        	}	
        }else{
        	return true
        }
    }
}


function esFechaValida(fecha){
    if (fecha != undefined && fecha.value != "" ){
        if (!/^\d{2}\-\d{2}\-\d{4}$/.test(fecha.value)){
            alert("Formato de fecha no Valido (dd-mm-aaaa)");
            fecha.focus();
            return false;
        }
        var dia  =  parseInt(fecha.value.substring(0,2),10);
        var mes  =  parseInt(fecha.value.substring(3,5),10);
        var anio =  parseInt(fecha.value.substring(6),10);
 
    switch(mes){
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            numDias=31;
            break;
        case 4: case 6: case 9: case 11:
            numDias=30;
            break;
        case 2:
            if (comprobarSiBisisesto(anio)){ numDias=29 }else{ numDias=28};
            break;
        default:
            alert("Fecha introducida es Errada");
            return false;
    }
 
        if (dia>numDias || dia==0){
            alert("Fecha introducida es Errada");
            return false;
        }
        return true;
    }
}
 
function comprobarSiBisisesto(anio){
if ( ( anio % 100 != 0) && ((anio % 4 == 0) || (anio % 400 == 0))) {
    return true;
    }
else {
    return false;
    }
}
</script>

</HEAD>

<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="17" rightmargin="0" topmargin="0"  bottommargin="0"    onload="frmGral.TDP.focus();">

<%

	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 
	
	wVEN = Request.Form("VENDEDOR") 

	wFECHA = RIGHT("00" & DAY(NOW),2) & "-" & RIGHT("00" & MONTH(NOW),2) & "-" & YEAR(NOW)

	wMCO = 0
    
	strCnn	= Application("XDTA300_ConnectionString")	
	SQL = "SELECT C300001CCL, C300001MCO, C300001OBS FROM dbo.X300CF001 "
	SQL = SQL & " WHERE "
	SQL = SQL & " C300001CCI = '" & wCCI & "' AND "
	SQL = SQL & " C300001NDC = '" & wCLA001  & "'"
	'response.write sql 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wCCL = trim(rstQuery.Fields("C300001CCL"))
		wMCO = CDBL(rstQuery.Fields("C300001MCO"))
		wOBS = trim(rstQuery.Fields("C300001OBS"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	SQL = "SELECT A300002CVE FROM dbo.X300AF002 "
	SQL = SQL & " WHERE "
	SQL = SQL & " A300002CCI = '" & wCCI & "' AND "
	SQL = SQL & " A300002CCL = '" & wCCL & "'"
	'response.write sql 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wCVE = trim(rstQuery.Fields("A300002CVE"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	

	wURL = "X001A107S.asp?CLA001=" & wCLA001  
	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >

    <div align="center">


       <table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center"  >
<tr>
<td>

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">

<br>
<div align="center">
<table BORDER="1" WIDTH="90%" cellspacing="0" bordercolor="#808080"   >
		 <TR>
		 <td CLASS="TDT" colspan=6 height="30">DOCUMENTOS</td>		  
		 </TR>	

    
    <%
    
    wC300002CCI = Session("glCiaInternet")
	wC300002CIA = Session("glCia")
	
	'*********************************************QUERY PARA FACTURAS*********************************************

    SQL = " SELECT C300002NFA, C300002MCO, C300002MNE, C300002PPP, "
	SQL = SQL & " C300002PIM, C300002ARI, C300002FVE, C300002BPP, "
	SQL = SQL & " C300002FEC, C300002TDO " 
	SQL = SQL & " FROM X300CF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300002CCI ='" & wC300002CCI & "' AND "
	SQL = SQL & " C300002CIA ='" & wC300002CIA & "' AND "
	SQL = SQL & " C300002NDC ='" & wCLA001 & "' AND "
	SQL = SQL & " C300002TDO <> 'N/C' "
	SQL = SQL & " ORDER BY C300002FAC DESC " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wColumna  = 1
    wCuenta = 0
	wTC03 = 0 
	wTC08 = 0
	wTC09 = 0
	DO WHILE NOT rstQuery.EOF 
	
		wNFA = TRIM(rstQuery.Fields("C300002NFA"))		
		wARI = TRIM(rstQuery.Fields("C300002ARI"))		
		wMFA = TRIM(rstQuery.Fields("C300002MNE"))		
		wPIM = TRIM(rstQuery.Fields("C300002PIM"))		
		wPRI = TRIM(rstQuery.Fields("C300002PPP"))		
		wFVE = TRIM(rstQuery.Fields("C300002FVE"))		
		wFEC = TRIM(rstQuery.Fields("C300002FEC"))		
		wPDE = TRIM(rstQuery.Fields("C300002BPP"))		
		wTDO = TRIM(rstQuery.Fields("C300002TDO"))		
		
		wNET = wMFA
									
			wVFA = "S"
	
			wColspan = "colspan=2"
			
			IF wARI = "S" THEN
			
				wColspan = ""			
				'Calculo de Retención
				wPI1 = wPIM * (wPRI/100)		
				wPI2 = wPIM * ((100-wPRI)/100)					
				wBI1 = wMFA * (wPI1/100)
				wBI2 = wMFA * (wPI2/100)
				
				'response.write wPIM & "-" & wPI1 & "-" & wPI2 & "-" & wBI1 & "-" & wBI2 & "-" & wMFA & "<br>"
				'wPIM = wPI2	
			ELSE				
				wBI2 = wMFA * (wPIM/100)
				wPI1 = 0
				wPI2 = wPIM				
			END IF 		
		
			'wNET = wMFA
			
			wMFA = wMFA + CDBL(wBI1) 
			wMFA = wMFA + CDBL(wBI2)			
			wTBI1 = wTBI1 + cdbl(wBI1)
			wTBI2 = wTBI2 + cdbl(wBI2)			
			wTMFA = wTMFA + cdbl(wMFA)
			wTNET = wTNET + cdbl(wNET)
			
			IF wCuenta = 0 THEN				
			
				Response.write "<tr>"			
				
        	  	Response.write "<td width=""6%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>&nbsp;</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Documento</b></p></td>"
        	  	Response.write "<td width=""6%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Tipo</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Emisión</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Vencimiento</b></p></td>"
        	  	'Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>% Desc. Apli.</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>Bolivares</b></p></td>"
       	  	
        	  	Response.write "</tr>"
        	  	
        	  	
          	END IF 
          	
          	If wColumna = 1 Then
          		'Response.write "<tr>"
          	End If	          	
          	
          	Response.write "<tr>"
          	
          	Response.write "<td width=""6%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write wColumna  
	 		Response.write "</td>"
	 		
          	Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wNFA  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""6%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wTDO  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wFEC  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wFVE  
	 		Response.write "</td>"
	 		
	 		'Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			'Response.write	wPDE  
	 		'Response.write "</td>"
	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:right"">&nbsp;"
			Response.write	formatnumber(wMFA,2) 
	 		Response.write "</td>"
	 			
	 		Response.write "</tr>"	 			
	 		
	 		If wColumna = 2 Then
	 			'Response.write "</tr>"
	 			'wColumna = 0	
	 		End If 
			
			'response.write SQL	
			'response.write wNFA & "-" & wMFA & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"
					
			
			wColumna  = wColumna  + 1
	
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	IF wARI = "N" THEN
		wPRI = 0
	END IF 
	
	Response.write "<tr>"
  	Response.write "<td width=""20%"" colspan=""5"" height=""25""><p CLASS=""P1"" align=""right""><b>SUB-TOTAL Bs.</b></p></td>"
    Response.write "<td width=""20%"" ><p CLASS=""P1"" align=""Right"">" & formatnumber(wTMFA,2) & "</p></td>"
    Response.write "</tr>"
    '**********************************************FIN QUERY PARA FACTURAS**********************************************
   
        
    '*******************************************QUERY PARA NOTAS DE CREDITO*********************************************
    
    SQL = " SELECT C300002NFA, C300002MCO, C300002MNE, C300002PPP, "
	SQL = SQL & " C300002PIM, C300002ARI, C300002FVE, C300002TDO " 
	SQL = SQL & " FROM X300CF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300002CCI ='" & wC300002CCI & "' AND "
	SQL = SQL & " C300002CIA ='" & wC300002CIA & "' AND "
	SQL = SQL & " C300002NDC ='" & wCLA001 & "' AND "
	SQL = SQL & " C300002TDO ='N/C' "
	SQL = SQL & " ORDER BY C300002FAC DESC " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wColumna  = 1
    wCuenta2 = 0
	wTC03 = 0 
	wTC08 = 0
	wTC09 = 0
	DO WHILE NOT rstQuery.EOF 
    	
		wNFA = TRIM(rstQuery.Fields("C300002NFA"))		
		wARI = TRIM(rstQuery.Fields("C300002ARI"))		
		wMNC = TRIM(rstQuery.Fields("C300002MNE"))	
		wPIM = TRIM(rstQuery.Fields("C300002PIM"))	
		'wMFA = wMFA / (1+(wPIM /100))			
		wPRI = TRIM(rstQuery.Fields("C300002PPP"))		
		wFVE = TRIM(rstQuery.Fields("C300002FVE"))		
		wTDO = TRIM(rstQuery.Fields("C300002TDO"))		
		wNET = wMNC
				
		IF wARI = "N" THEN
			wPRI = 0
		END IF 				
					
			wVFA = "S"	
			wColspan = "colspan=2"
			
			IF wARI = "S" THEN
				wColspan = ""			
				'Calculo de Retención
				wPI1 = wPIM * (wPRI/100)		
				wPI2 = wPIM * ((100-wPRI)/100)						
				wBI1 = wMNC * (wPI1/100)
				wBI2 = wMNC * (wPI2/100)				
				'response.write wPIM & "-" & wPI1 & "-" & wPI2 & "-" & wBI1 & "-" & wBI2 & "-" & wMFA & "<br>"
				'wPIM = wPI2	
			ELSE				
				wBI2 = wMNC * (wPIM/100)
				wPI1 = 0
				wPI2 = wPIM				
			END IF 		
		
			'wNET = wMFA			
			wMNC = wMNC + CDBL(wBI1) 
			wMNC = wMNC + CDBL(wBI2)			
			wTBI12 = wTBI11 + cdbl(wBI1)
			wTBI22 = wTBI22 + cdbl(wBI2)			
			wTNET2 = wTNET2 + cdbl(wNET)
			wTMNC = wTMNC + cdbl(wMNC)			
			
			IF wCuenta2 = 0 THEN
				Response.write "<BR></table>"
				Response.write "<table BORDER=""1"" WIDTH=""95%"" cellspacing=""0"" bordercolor=""#808080""   >"

				Response.write "<TR> <td CLASS=""TDT"" colspan=6 height=""30"">NOTAS DE CREDITO</td> </TR>"					
				Response.write "<tr>"			
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>NOTA</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>FECHA</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>BOLIVARES</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>NOTA</b></p></td>"
	        	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>FECHA</b></p></td>"
	        	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>BOLÍVARES</b></p></td>"        	  	
        	  	Response.write "<tr>"
          	END IF 
          	
          	If wColumna = 1 Then
          		Response.write "<tr>"
          	End If	          	
          	Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wNFA  
	 		Response.write "</td>"	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wFVE  
	 		Response.write "</td>"	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:right"">&nbsp;"
			Response.write	formatnumber((wMNC*-1),2) 
	 		Response.write "</td>"	 	 		
	 		If wColumna = 2 Then
	 			Response.write "</tr>"
	 			wColumna = 0	
	 		End If 
			
			'response.write SQL	
			'response.write wNFA & "-" & wMFA & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"					
			
			wColumna  = wColumna  + 1
	
		rstQuery.MoveNext 
		wCuenta2 = wCuenta2 + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	IF wCuenta2 > 0 Then
		Response.write "<tr>"
  		Response.write "<td width=""20%"" colspan=""5"" height=""25""><p CLASS=""P1"" align=""right""><b>SUB-TOTAL Bs.</b></p></td>"
    	Response.write "<td width=""20%"" ><p CLASS=""P1"" align=""Right"">" & formatnumber((wTMNC*-1),2) & "</p></td>"
    	Response.write "</tr>"
    END IF 
   
   '******************************************FIN QUERY PARA NOTAS DE CREDITO*******************************************

    %>
    
    </table> 
    <br>
    <table BORDER="0" WIDTH="90%" cellspacing="0" cellpadding="4" align="center" >
     <TR>
		 <td CLASS="TDT" colspan=6 height="30">RESUMEN</td>		  
		 </TR>	
		 
		 <tr>
		 <td width="33%" colspan="2" bgcolor="#C0C0C0"><p CLASS="P1" align="left">
			<b>CONCEPTO</b></p></td>
         <td width="33%" colspan="2" bgcolor="#C0C0C0"><p CLASS="P1" align="center">
			<b>%</b></p></td>
         <td width="33%" colspan="2" bgcolor="#C0C0C0"><p CLASS="P1" align="right">
			<b>BOLÍVARES</b></p></td>
		 </tr>
		 
		 <tr>
		 <td width="33%" colspan="2" ><p CLASS="P1" align="left">MONTO NETO SIN 
			IVA</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="right">&nbsp;<%=formatnumber(wTNET-wTNET2,2)%></p></td>	 
		 </tr>
		  <% 
		 	'wTBI1+wTBI2	
		 	wIVA = wTBI1+wTBI2	
		 	wIVA = wIVA - (wTBI12 + wTBI22)		 		 	
		 		 	
		 %>

		 <tr>
		 <td width="33%" colspan="2" ><p CLASS="P1" align="left">IVA</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;<%=formatnumber(wPI1+wPI2,2)%></p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="right">&nbsp;<%=formatnumber(wIVA,2)%></p></td>	 
		 </tr>
		 
		 <tr>
		 <td width="33%" colspan="2" ><p CLASS="P1" align="left">RETENCIÓN IVA</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;<%=formatnumber(wPRI,0)%> 
			%</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="right">
         <% IF wTBI1 > 0 THEN %>
         	-&nbsp;<%=formatnumber(wTBI1-wTBI12,2)%>
         <% ELSE %>
         	&nbsp;<%=formatnumber(wTBI1,2)%>
         <% END IF %>
         </p></td>	 
		 </tr>
		 
		  <%
		 	
		 	'wTMFA-wTBI1
		 	wTOT = wTMFA - wTMNC
		 	wTOT = wTOT - (wTBI1-wTBI12)
		 
		 %>

		 
		 <tr>
  		 <td width="20%" colspan="5" height="25"><p CLASS="P1" align="right"><b>
			TOTAL A PAGAR Bs.</b></p></td>
  	  	 <td width="20%" ><p CLASS="P1" align="Right"><%=formatnumber((wTOT),2)%></p></td>
    	 
		<tr>
  		 <td width="20%"  height="25"><p CLASS="P1" align="center"><b>SON 
			BOLÍVARES</b></p></td>
  	  	 <td width="20%" colspan="5" ><p CLASS="P1" align="center"><%=ucase(CONVERTIR(wTOT))%></p></td></tr></tr>
  	  	 
  	  	  <tr>
		 
		           <td CLASS="TDT" width="100%" colspan="6"  align="center" height=50 valign="middle"  >
		          <br> Observación:         
		           
		           
		           <INPUT TYPE="text" NAME="txOBS" value="<%=wOBS%>" maxlength="250" size="67" value="<%=wOBS%>" >
		           </td> 
		</tr> 

    	 </table>     
    </div>
   
 <br>

<% IF Session("glTipoUsuario") = "V" or Session("glTipoUsuario") = "S" OR Session("glTipoUsuario") = "A" THEN %>
    
    <%
																	
	strCnn	= Application("XDTA300_ConnectionString")
									
	SQL = " SELECT ISNULL(Z300001NRD,0) AS Z300001NRD, ISNULL(Z300001NRH,0) AS Z300001NRH, "
	SQL = SQL & " ISNULL(Z300001NDD,0) AS Z300001NDD, ISNULL(Z300001NDH,0) AS Z300001NDH "
	SQL = SQL & " FROM X300ZF001 " 																											
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
	SQL = SQL & " ( Z300001CLU = 'V' OR "
	SQL = SQL & "   Z300001CLU = 'S' ) AND "
	SQL = SQL & " Z300001CVE = '" & Session("glCodVendedor") & "'" 'wCVE  
	'response.write sql 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
    If NOT rstQuery.EOF Then
		wNRD = CDBL(rstQuery.Fields("Z300001NRD"))
		wNRH = CDBL(rstQuery.Fields("Z300001NRH"))
		wNDD = CDBL(rstQuery.Fields("Z300001NDD"))
		wNDH = CDBL(rstQuery.Fields("Z300001NDH"))
	End If
    rstQuery.CLOSE
    SET rstQuery = NOTHING	
    
																								
	
	'wND2 = 0 	
	'wNH2 = 0						%>
									
   <!-- <table BORDER="0" WIDTH="98%" align="center" cellpadding="0" cellspacing="0"  height="30" >
		 <TR>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px" width="315">
		 <% IF Session("glTipoUsuario") <> "V" THEN %>
		 <p CLASS="P1" align="left"><b>Si posee Nro. de Talonario Físico de Cobranza debe 
			Seleccionarlo de la lista:</b> </p> 
		 <% ELSE %>
		 <p CLASS="P1" align="left"><b>Seleccione el Nro. de Talonario Físico de Cobranza:</b> </p> 
		 <% END IF %>
		 </td>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px" align="left" >
		 <SELECT name="NRC" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 10pt; width:80; height25" size="1" > 
		 	
		 	<%
		 	
		 	
		 	Response.write "<OPTION value=""0""></OPTION>" 										
		 	
		 	
		 	wI = 0
		 	FOR wI = wNRD TO wNRH 
		 	
		 		SQL = " SELECT C300001NRC FROM X300CF001 " 																											
				SQL = SQL & " WHERE "
				SQL = SQL & " C300001NRC = '" & wI & "' AND "
				SQL = SQL & " C300001STS <> '9' "
				Set rstQuery = Server.CreateObject("ADODB.Recordset")
				rstQuery.Open sql , strCnn
    			If NOT rstQuery.EOF Then
					wExiste = "S"
				  Else
					wExiste = "N"
				End If
    			rstQuery.CLOSE
    			SET rstQuery = NOTHING	
    
    			IF wExiste = "N" THEN
		 			Response.write "<OPTION value=" & wI & " >" & wI & "</OPTION>" 										
		 		END IF 
		 	
		 	NEXT 
		 	
		 	'Si tiene otro talonario Activo **********
		 	wI = 0
		 	FOR wI = wND2 TO wNH2 
		 	
		 		SQL = " SELECT C300001NRC FROM X300CF001 " 																											
				SQL = SQL & " WHERE "
				SQL = SQL & " C300001NRC = '" & wI & "' AND "
				SQL = SQL & " C300001STS <> '9' "
				Set rstQuery = Server.CreateObject("ADODB.Recordset")
				rstQuery.Open sql , strCnn
    			If NOT rstQuery.EOF Then
					wExiste = "S"
				  Else
					wExiste = "N"
				End If
    			rstQuery.CLOSE
    			SET rstQuery = NOTHING	
    
    			IF wExiste = "N" THEN
		 			'Response.write "<OPTION value=" & wI & " >" & wI & "</OPTION>" 										
		 		END IF 
		 	
		 	NEXT 
		 	'******************************************
		 	
		 	%>
		 </SELECT>
		 </td>
		 </TR>
		 </table>-->
		 
	<!--	 
		 <table BORDER="0" WIDTH="98%" align="center" cellpadding="0" cellspacing="0"  height="30" >
		 <TR>
		 <td colspan="5"  CLASS="TDT" height="30">DEVOLUCIÓN</td>		  
		 </TR>	
		 
		 <tr>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; ">
		  &nbsp;</td>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; ">
		 &nbsp;
		 </td>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; "><p CLASS="P1" align="left"><b><u>
			<span style="font-size: xx-small">
		 Nro. de Factura</span> </u></b> </p>  
		 </td>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px;">
		 <p CLASS="P1" align="left"><b><u>
			<span style="font-size: xx-small">Detalle</span> </u> </b> </p> 
		 </td>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px;">
		 <p CLASS="P1" align="Right"><b><u>
			<span style="font-size: xx-small">Monto</span> </u> </b> </p> 
		 </td> 
		 </tr>
		 <TR>
		 <td width="280">
		 <% IF Session("glTipoUsuario") <> "V" THEN %>
		 <p CLASS="P1" align="left"><b>Si posee Nro. de Talonario Físico de Devolución debe 
			Seleccionarlo de la lista:</b> </p> 
		 <% ELSE %>
		 <p CLASS="P1" align="left"><b>Seleccione el Nro. de Talonario Físico de Devolución:</b> </p> 
		 <% END IF %>
		 </td>
		 <td height="30" align="left" >
		 <SELECT name="NRD" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 10pt; width:80; height25" size="1" > 
		 	
		 	<%
		 	
		 	
		 	Response.write "<OPTION value=""0""></OPTION>" 										
		 	
		 	
		 	wI = 0
		 	FOR wI = wNDD TO wNDH 
		 	
		 		SQL = " SELECT C300001NRD FROM X300CF001 " 																											
				SQL = SQL & " WHERE "
				SQL = SQL & " C300001NRD = '" & wI & "' AND "
				SQL = SQL & " C300001STS <> '9' "
				Set rstQuery = Server.CreateObject("ADODB.Recordset")
				rstQuery.Open sql , strCnn
    			If NOT rstQuery.EOF Then
					wExiste = "S"
				  Else
					wExiste = "N"
				End If
    			rstQuery.CLOSE
    			SET rstQuery = NOTHING	
    
    			IF wExiste = "N" THEN
		 			Response.write "<OPTION value=" & wI & " >" & wI & "</OPTION>" 										
		 		END IF 
		 	
		 	NEXT 
		 	
		 	
		 	%>
		 </SELECT>
		 </td>
		 <td>
		 	 <input type="text" name="FD1" size="12" maxlength="20" onkeypress="validarletras()" >
		 </td>
		 <td>
		 	<input type="text" name="DF1" size="40" maxlength="200" >
		 </td>
		 <td align="right"  >
		   <input type="text" name="MF1" size="8" maxlength="20" value="0" onblur="return sumar(this);" onkeypress="validarletras2()" style="text-align: right">
		 </td>

		 </TR>
		 <tr>
		 <td>
		 </td>
		 <td>
		 </td>
		 	 <td>
		 	 <input type="text" name="FD2" size="12" maxlength="20" onkeypress="validarletras()" >
		 </td>
		 <td>
		 	<input type="text" name="DF2" size="40" maxlength="200" >
		 </td>
		 <td align="right"  >
		   <input type="text" name="MF2" size="8" maxlength="20" value="0" onblur="return sumar(this);" onkeypress="validarletras2()" style="text-align: right">
		 </td>

		 </tr>
		 </table>-->
		 <br>
<% END IF

IF wARI = "S" THEN

wIURL = "../ASPX/C001X001.aspx?CCI=" & wCCI & "&NDC=" & wCLA001 

%>    
   <br>
   
   <table border="0" align="center" width="740" >
   <tr><td align="center" >
   <iframe frameborder="no" src="<%=wIURL%>" width="100%" align="middle" height="250" scrolling="auto" ></iframe>  
   </td></tr>
   </table>  

<% END IF %>   
   
		<table BORDER="0" WIDTH="98%" align="center" >
		 <TR>
		 <td CLASS="TDT" colspan=8 height="30">REGISTRO DE PAGO</td>		  
		 </TR>	
		 
		 <tr>
		 <td><p CLASS="P1" align="left"><b><u><span style="font-size: xx-small">
			BANCO</span></u></b></p></td>
		 <td><p CLASS="P1" align="left"><u><b><span style="font-size: xx-small">
			FORMA DE PAGO</span></b></u></p></td>
		 <td><p CLASS="P1" align="left"><b><u><span style="font-size: xx-small">
			NRO. DE PLANILLA 
			</span> </u></b></p></td>
		 <td ><p CLASS="P1" align="left"><b><u>
			<span style="font-size: xx-small">FECHA</span></u></b></p></td>
		 <td ><p CLASS="P1" align="left"><b><u>
			<span style="font-size: xx-small">CHEQUE</span></u></b></p></td>
		 <td ><p CLASS="P1" align="left"><b><u>
			<span style="font-size: xx-small">BANCO</span></u></b></p></td>
		 <td align="right" ><p CLASS="P1" align="right"><b><u>
			<span style="font-size: xx-small">MONTO</span></u></b></p></td>
		 </tr>
		 
		 
		 <tr>
          
          <td ><p CLASS="P1">
					<SELECT name="CBN" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:120" size="1" onmouseover="showdiv(event,1);" onmousemove="showdiv(event,1);" onmouseout="javascript:document.getElementById('bancos').style.display='none';"> 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT A300034CBN, A300034DEL FROM X300AF034 " 																											
									SQL = SQL & " WHERE "
									SQL = SQL & " A300034CCI ='" & Session("glCiaInternet")  & "' "
									SQL = SQL & " ORDER BY  A300034DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300034CBN"))
										'wDES = trim(replace(rstQuery.Fields("A300034DEL"), "BANCO", ""))							
										wDES = trim(rstQuery.Fields("A300034DEL"))							
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>
         
          
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left"><%=wPOS%>
			<SELECT name="TDP" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:95" size="1" > 
			<OPTION value="DP">DEPOSITO</OPTION>
			<OPTION value="TB">TRANSFERENCIA</OPTION>
			</SELECT> 

          </td>
                   
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="DOC" size="12" maxlength="20" onkeypress="validarletras()"  onmouseover="showdiv(event,0);" onmousemove="showdiv(event,0);" onmouseout="javascript:document.getElementById('flotante').style.display='none';"></td>
         

		 <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="FEC" size="8" value="<%=wFECHA%>" maxlength="10" tabindex="-1" onblur="esFechaValida(this);" ><A href="javascript:cal1.popup();">
<IMG height=16 alt="Haga Click Aqui para Seleccionar Fecha" src  ="img/cal.gif" width=16 border=0 ></a></td>
          

<td style="font-size: 10pt; font-family: Tahoma; text-align:left">
			<p style="text-align: left">
			<input type="text" name="NCH" size="8" value="" onmouseover="showdiv(event,2);" onmousemove="showdiv(event,2);" onmouseout="javascript:document.getElementById('cheques').style.display='none';">
</td>

<td ><p CLASS="P1">
					<SELECT name="CBC" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:132" size="1" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT A300025CBN, A300025DEL FROM X300AF025 " 
									SQL = SQL & " WHERE "
									SQL = SQL & " A300025CCI ='" & Session("glCiaInternet")  & "' "																											
									SQL = SQL & " ORDER BY  A300025DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=""0"">EFECTIVO</OPTION>" 
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300025CBN"))
										'wDES = left(trim(replace(rstQuery.Fields("A300025DEL"), "BANCO", "")),12)							
										wDES = trim(rstQuery.Fields("A300025DEL"))							
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>
          <td style="font-size: 10pt; font-family: Tahoma; " align="right" >
			<p>
			<input type="text" name="MCO" size="8" maxlength="20" value="0" onblur="return sumar(this);" onkeypress="validarletras2()" style="text-align: right"></td>
         
    
         </tr>
         
         <tr>
          
          <td ><p CLASS="P1">
					<SELECT name="CBN01" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:120" size="1" onmouseover="showdiv(event,1);" onmousemove="showdiv(event,1);" onmouseout="javascript:document.getElementById('bancos').style.display='none';"> 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT A300034CBN, A300034DEL FROM X300AF034 "
									SQL = SQL & " WHERE "
									SQL = SQL & " A300034CCI ='" & Session("glCiaInternet")  & "' " 																											
									SQL = SQL & " ORDER BY  A300034DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300034CBN"))
										'wDES = trim(replace(rstQuery.Fields("A300034DEL"), "BANCO", ""))							
										wDES = trim(rstQuery.Fields("A300034DEL"))					
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>
         
          
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left"><%=wPOS%>
			<SELECT name="TDP01" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:95" size="1" > 
			<OPTION value="DP">DEPOSITO</OPTION>
			<OPTION value="TB">TRANSFERENCIA</OPTION>
			</SELECT> 

          </td>
                   
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="DOC01" size="12" maxlength="20" onkeypress="validarletras()" onmouseover="showdiv(event,0);" onmousemove="showdiv(event,0);" onmouseout="javascript:document.getElementById('flotante').style.display='none';"></td>
         

		 <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="FEC01" size="8" value="<%=wFECHA%>" maxlength="10" tabindex="-1" onblur="esFechaValida(this);"><A href="javascript:cal2.popup();">
<IMG height=16 alt="Haga Click Aqui para Seleccionar Fecha" src  ="img/cal.gif" width=16 border=0 ></a></td>
         

<td style="font-size: 10pt; font-family: Tahoma; text-align:left">
			<p style="text-align: left">
			<input type="text" name="NCH01" size="8" value="" onmouseover="showdiv(event,2);" onmousemove="showdiv(event,2);" onmouseout="javascript:document.getElementById('cheques').style.display='none';" >
</td>
          
          <td ><p CLASS="P1">
					<SELECT name="CBC01" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:132" size="1" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT A300025CBN, A300025DEL FROM X300AF025 "
									SQL = SQL & " WHERE "
									SQL = SQL & " A300025CCI ='" & Session("glCiaInternet")  & "' "	 																											
									SQL = SQL & " ORDER BY  A300025DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=""0"">EFECTIVO</OPTION>" 
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300025CBN"))
										'wDES = left(trim(replace(rstQuery.Fields("A300025DEL"), "BANCO", "")),12)							
										wDES = left(trim(rstQuery.Fields("A300025DEL")),12)					
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>
          
          <td style="font-size: 10pt; font-family: Tahoma; " align="right" >
			<p>
			<input type="text" name="MCO01" size="8" maxlength="20" value="0" onblur="return sumar(this);" onkeypress="validarletras2()" style="text-align: right"></td>
         
    
         </tr>


<tr>
          
          <td ><p CLASS="P1">
					<SELECT name="CBN02" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:120" size="1" onmouseover="showdiv(event,1);" onmousemove="showdiv(event,1);" onmouseout="javascript:document.getElementById('bancos').style.display='none';" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT A300034CBN, A300034DEL FROM X300AF034 "
									SQL = SQL & " WHERE "
									SQL = SQL & " A300034CCI ='" & Session("glCiaInternet")  & "' " 																											
									SQL = SQL & " ORDER BY  A300034DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300034CBN"))
										'wDES = trim(replace(rstQuery.Fields("A300034DEL"), "BANCO", ""))							
										wDES = trim(rstQuery.Fields("A300034DEL"))					
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>
         
          
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left"><%=wPOS%>
			<SELECT name="TDP02" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:95" size="1" > 
			<OPTION value="DP">DEPOSITO</OPTION>
			<OPTION value="TB">TRANSFERENCIA</OPTION>
			</SELECT> 

          </td>
                   
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="DOC02" size="12" maxlength="20" onkeypress="validarletras()" onmouseover="showdiv(event,0);" onmousemove="showdiv(event,0);" onmouseout="javascript:document.getElementById('flotante').style.display='none';"></td>
         

		 <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="FEC02" size="8" value="<%=wFECHA%>" maxlength="10" tabindex="-1" onblur="esFechaValida(this);" ><A href="javascript:cal3.popup();">
<IMG height=16 alt="Haga Click Aqui para Seleccionar Fecha" src  ="img/cal.gif" width=16 border=0 ></a></td>
          
          <td style="font-size: 10pt; font-family: Tahoma; text-align:left">
			<p style="text-align: left">
			<input type="text" name="NCH02" size="8" value="" onmouseover="showdiv(event,2);" onmousemove="showdiv(event,2);" onmouseout="javascript:document.getElementById('cheques').style.display='none';">
</td>

<td ><p CLASS="P1">
					<SELECT name="CBC02" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:132" size="1" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
								    SQL = " SELECT A300025CBN, A300025DEL FROM X300AF025 " 
								    SQL = SQL & " WHERE "
									SQL = SQL & " A300025CCI ='" & Session("glCiaInternet")  & "' "																												
									SQL = SQL & " ORDER BY  A300025DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=""0"">EFECTIVO</OPTION>" 
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300025CBN"))
										'wDES = left(trim(replace(rstQuery.Fields("A300025DEL"), "BANCO", "")),12)							
										wDES = left(trim(rstQuery.Fields("A300025DEL")),12)
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>

          <td style="font-size: 10pt; font-family: Tahoma; " align="right" >
			<p>
			<input type="text" name="MCO02" size="8" maxlength="20" value="0" onblur="return sumar(this);" onkeypress="validarletras2()" style="text-align: right"></td>
         
    
         </tr>

<tr>
          
          <td ><p CLASS="P1">
					<SELECT name="CBN03" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:120" size="1"  onmouseover="showdiv(event,1);" onmousemove="showdiv(event,1);" onmouseout="javascript:document.getElementById('bancos').style.display='none';"> 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT A300034CBN, A300034DEL FROM X300AF034 " 
									SQL = SQL & " WHERE "
									SQL = SQL & " A300034CCI ='" & Session("glCiaInternet")  & "' "																											
									SQL = SQL & " ORDER BY  A300034DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300034CBN"))
										'wDES = trim(replace(rstQuery.Fields("A300034DEL"), "BANCO", ""))							
										wDES = trim(rstQuery.Fields("A300034DEL"))					
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>
         
          
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left"><%=wPOS%>
			<SELECT name="TDP03" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:95" size="1" > 
			<OPTION value="DP">DEPOSITO</OPTION>
			<OPTION value="TB">TRANSFERENCIA</OPTION>
			</SELECT> 

          </td>
                   
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="DOC03" size="12" maxlength="20" onkeypress="validarletras()" onmouseover="showdiv(event,0);" onmousemove="showdiv(event,0);" onmouseout="javascript:document.getElementById('flotante').style.display='none';"></td>
         

		 <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="FEC03" size="8" value="<%=wFECHA%>" maxlength="10" tabindex="-1" onblur="esFechaValida(this);" ><A href="javascript:cal4.popup();">
<IMG height=16 alt="Haga Click Aqui para Seleccionar Fecha" src  ="img/cal.gif" width=16 border=0 ></a></td>
          
          
          <td style="font-size: 10pt; font-family: Tahoma; text-align:left">
			<p style="text-align: left">
			<input type="text" name="NCH03" size="8" value="" onmouseover="showdiv(event,2);" onmousemove="showdiv(event,2);" onmouseout="javascript:document.getElementById('cheques').style.display='none';">
</td>

<td ><p CLASS="P1">
					<SELECT name="CBC03" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:132" size="1" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT A300025CBN, A300025DEL FROM X300AF025 "
									SQL = SQL & " WHERE "
									SQL = SQL & " A300025CCI ='" & Session("glCiaInternet")  & "' "	 																											
									SQL = SQL & " ORDER BY  A300025DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=""0"">EFECTIVO</OPTION>" 
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300025CBN"))
										'wDES = left(trim(replace(rstQuery.Fields("A300025DEL"), "BANCO", "")),12)							
										wDES = left(trim(rstQuery.Fields("A300025DEL")),12)
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>


          <td style="font-size: 10pt; font-family: Tahoma; " align="right" >
			<p>
			<input type="text" name="MCO03" size="8" maxlength="20" value="0" onblur="return sumar(this);" onkeypress="validarletras2()" style="text-align: right"></td>
         
    
         </tr>

<tr>
          
          <td ><p CLASS="P1">
					<SELECT name="CBN04" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:120" size="1" onmouseover="showdiv(event,1);" onmousemove="showdiv(event,1);" onmouseout="javascript:document.getElementById('bancos').style.display='none';"> 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT A300034CBN, A300034DEL FROM X300AF034 " 
									SQL = SQL & " WHERE "
									SQL = SQL & " A300034CCI ='" & Session("glCiaInternet")  & "' "																											
									SQL = SQL & " ORDER BY  A300034DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300034CBN"))
										'wDES = trim(replace(rstQuery.Fields("A300034DEL"), "BANCO", ""))							
										wDES = trim(rstQuery.Fields("A300034DEL"))					
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>
         
          
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left"><%=wPOS%>
			<SELECT name="TDP04" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:95" size="1" > 
			<OPTION value="DP">DEPOSITO</OPTION>
			<OPTION value="TB">TRANSFERENCIA</OPTION>
			</SELECT> 

          </td>
                   
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="DOC04" size="12" maxlength="20" onkeypress="validarletras()" onmouseover="showdiv(event,0);" onmousemove="showdiv(event,0);" onmouseout="javascript:document.getElementById('flotante').style.display='none';"></td>
         

		 <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<p style="text-align: left">
			<input type="text" name="FEC04" size="8" value="<%=wFECHA%>" maxlength="10" tabindex="-1" onblur="esFechaValida(this);" ><A href="javascript:cal2.popup();">
<IMG height=16 alt="Haga Click Aqui para Seleccionar Fecha" src  ="img/cal.gif" width=16 border=0 ></a></td>

<td style="font-size: 10pt; font-family: Tahoma; text-align:left">
			<p style="text-align: left">
			<input type="text" name="NCH04" size="8" value="" onmouseover="showdiv(event,2);" onmousemove="showdiv(event,2);" onmouseout="javascript:document.getElementById('cheques').style.display='none';">
</td>

<td ><p CLASS="P1">
					<SELECT name="CBC04" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:132" size="1" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT A300025CBN, A300025DEL FROM X300AF025 "
									SQL = SQL & " WHERE "
									SQL = SQL & " A300025CCI ='" & Session("glCiaInternet")  & "' "	 																											
									SQL = SQL & " ORDER BY  A300025DEL " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=""0"">EFECTIVO</OPTION>" 										
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300025CBN"))
										'wDES = left(trim(replace(rstQuery.Fields("A300025DEL"), "BANCO"<b></b>, "")),12)							
										wDES = left(trim(rstQuery.Fields("A300025DEL")),12)
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
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
          </P></td>
          
          <td style="font-size: 10pt; font-family: Tahoma; " align="right" >
			<p>
			<input type="text" name="MCO04" size="8" maxlength="20" value="0" onblur="return sumar(this);" onkeypress="validarletras2()" style="text-align: right"></td>
         
    
         </tr>

<tr>
          
          <td ><p CLASS="P1">
	
          </P></td>
         
          
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
		

          </td>
                   
          <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
		
		</td>
         
         <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
		
		</td>
      <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
		
		</td>
    
		 <td style="font-size: 10pt; font-family: Tahoma; text-align:right">
		 <b>TOTAL PAGO:
		</b>
		</td>
          
          <td style="font-size: 10pt; font-family: Tahoma; " align="right" >
			<hr width="100%" style="margin-top: 0; margin-bottom: 0" >
			<input name="TMCO" size="8" maxlength="20" value="0" style="border-style:solid; border-width:0; text-align: right; font-weight:700" tabindex="-1">
			
			<hr width="100%" style="margin-top: 0; margin-bottom: 0">
			</td>
         
    
         </tr>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=8 align="center" height="50px" valign="bottom" >         
          <input type="button" name="Procesar" Value="Procesar" onclick="javascript:enviar()">
          <input type="button" name="Cancelar" Value="Cancelar" onclick="javascript:window.open('X001A004.asp','main')">
         </td>
         </tr>


	</table>
	
	
	<INPUT NAME="MCO2" size=15 value="<%=Formatnumber(wMCO,2)%>" TYPE=Hidden>
	
 
	<br>
	<table width="100%" border="0" cellpadding="5" cellspacing="1"  >
	
<tr>
<td align="center"  CLASS="TDT" valign="middle" height="25" >
<font color="#CC0000">*Puede utilizar el mismo Nro. de Planilla para distintas 
formas de pago (Cheque, Efectivo). <br>
*En el Monto no colocar separador de miles y utilizar la coma &quot;,&quot; para 
decimales.
</font>
</td></tr> 
	
<tr>
<td align="center"  CLASS="TDT" valign="middle" height="25" >
*Luego de registrar su pago usted podrá imprimir su Comprobante electrónico.
</td></tr> 
</table> 

	
	</td>
</tr> 

</td>
</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

<br>
<br>
    </td>				
  </tr>
</table>

	</div>
	
<input type="hidden" name="FECHA" value="<%=wFECHA%>" >	
</FORM>

<div id="bancos">
	<b>Seleccione el banco de Corporación Valparts donde 
	<br />realizo el depósito o transferencia.</b>
	<!--<br /><span id="posicion"></span>-->
</div>


<div id="flotante">
	<b>Indique los últimos 8 dígitos 
	<br />del depósito o transferencia.</b>
	<!--<br /><span id="posicion"></span>-->
</div>

<div id="cheques">
	<b>Indique los últimos 8 dígitos 
	<br />del cheque.</b>
	<!--<br /><span id="posicion"></span>-->
</div>

</BODY>

<script language="JavaScript">
<!-- // create calendar object(s) just after form tag closed
	 // specify form element as the only parameter (document.forms['formname'].elements['inputname']);
	 // note: you can have as many calendar objects as you need for your application
	var cal1 = new calendar1(document.forms['frmGral'].elements['FEC']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2 = new calendar1(document.forms['frmGral'].elements['FEC01']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
	
	var cal3 = new calendar1(document.forms['frmGral'].elements['FEC02']);
	cal3.year_scroll = true;
	cal3.time_comp = false;
	
	var cal4 = new calendar1(document.forms['frmGral'].elements['FEC03']);
	cal4.year_scroll = true;
	cal4.time_comp = false;
	
	var cal5 = new calendar1(document.forms['frmGral'].elements['FEC04']);
	cal5.year_scroll = true;
	cal5.time_comp = false;
	
	//var cal2 = new calendar1(document.forms['thisForm'].elements['txA0339FECHE_ANO']);		
	//cal2.year_scroll = true;
	//cal2.time_comp = false;
			
//-->
</script>

</HTML>