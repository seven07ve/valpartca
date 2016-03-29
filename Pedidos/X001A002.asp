

<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<base target="main">

<!--#include file="X001Z001.INC"-->
</head>

<style type="text/css">

#a
{
text-decoration : none;
}

#Mensaje
{
	position: absolute;
	display:none;
	font-family:Arial;
	font-size:0.8em;
	border:1px solid #808080;
	background-color:#f1f1f1;
}
</style>


<script language="javascript" >

function OpenBrWindow(theURL,winName,features, myWidth, myHeight, isCenter) { //v3.0
	if(window.screen)if(isCenter)if(isCenter=="true"){
		var myLeft = (screen.width-myWidth)/2;
		var myTop = (screen.height-myHeight)/2;
		features+=(features!='')?',':'';
		features+=',left='+myLeft+',top='+myTop;
	}
	window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);
}


function OpenChat() {

	//window.open('http://www.carvica.com.ve/chat/chat.asp','_blank', 'menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470') 
	OpenBrWindow('http://www.carvica.com.ve/chat/chat.asp','chat','menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470','700','470','true')
}

function OpenMensaje() {

	//window.open('http://www.carvica.com.ve/chat/chat.asp','_blank', 'menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470') 
	OpenBrWindow('http://www.carvica.com.ve/mensaje.htm','Mensaje','menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=550,height=270','550','270','true')

 
}


function showdiv(event,msg)
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

	document.getElementById('Mensaje').style.top = (tempY+margin);
	document.getElementById('Mensaje').style.left = (tempX+margin);
	document.getElementById('Mensaje').style.display='block';
	document.getElementById('Mensaje').innerHTML=msg;
	
	return;
}

function Ocultar(){

	document.getElementById('Mensaje').style.display='none';

}



</script>

<%

	strCnn	= Application("XDTA300_ConnectionString")

	SQL = "SELECT " 
	SQL = SQL & " Z300009FFI AS Z300009FFI  "
	SQL = SQL & " FROM X300ZF009 "
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300009CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300009DTS = 'X300AF003' "			
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	If NOT rstQuery.EOF Then	
		wFFI = trim(rstQuery.Fields("Z300009FFI"))
	  ELSE
		wFFI = Now
	End If
	rstQuery.CLOSE
	SET rstQuery = NOTHING
	
	wDIA_FED = Day(wFFI)
    If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
    wMES_FED = Month(wFFI)
    If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
    wANO_FED = Year(wFFI)
    wFFI_X300AF003 = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFFI)
	
	SQL = "SELECT " 
	SQL = SQL & " Z300009FFI AS Z300009FFI  "
	SQL = SQL & " FROM X300ZF009 "
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300009CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300009DTS = 'X300BF102' "			
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	If NOT rstQuery.EOF Then	
		wFFI = trim(rstQuery.Fields("Z300009FFI"))
	  ELSE
		wFFI = Now
	End If
	rstQuery.CLOSE
	SET rstQuery = NOTHING
	
	SQL = "SELECT " 
	SQL = SQL & " Count(*) Usuarios  "
	SQL = SQL & " FROM X300ZF001 "
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300001CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300001STS = '1' "			
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	If NOT rstQuery.EOF Then	
		wUsuarios = cdbl(rstQuery.Fields("Usuarios"))
	End If
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wDIA_FED = Day(wFFI)
    If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
    wMES_FED = Month(wFFI)
    If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
    wANO_FED = Year(wFFI)
    wFFI_X300BF102 = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFFI)
    
    wUsuariosConectados = Application("ActiveUsers")
    
    IF wUsuariosConectados > wUsuarios Then
    	wUsuariosConectados = wUsuarios
	End if 

%>

<body onload=" javascript:window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=auto topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="#FFEBD6">

<div align="center">

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" height="100%" >
<tr>
<td valign="top"  >



<table width="919" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" >
<tr>
<td bgcolor="#FFFFFF">
<p align="center" style="margin-top: 3px; margin-bottom: 3px">
     

 
<p>
</p>


<p style="margin:1px 75px; " align="justify">
&nbsp;</p>
<p style="margin:1px 75px; " align="justify">
<span style="text-decoration: none">
		<font face="Tahoma" size="2">A continuación pueden descargar en formato 
&quot;<b>.pdf</b>&quot; e imprimir 
en sus equipos los siguientes certificados de Servicio Autónomo Nacional de 
Normalización, Calidad, Metrología y Reglamentos Técnicos <b>(Sencamer)</b> y 
los certificados de Productos de Marca de Calidad <b>NORVEN (Normas Venezolanas 
COVENIN)</b>.</font></span></p>
<p style="margin:1px 75px; " align="justify">
<span style="text-decoration: none">
		<font face="Tahoma" style="font-size: 9pt"><br>
		</font></span></p>

<div align="center">

<table   cellspacing="0" cellpadding="0" width="680" bordercolor="#0066CC" bgcolor="#FE9900" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px;" id="table10" border="1">
	

  <tr>
    <td width="79%" bgcolor="white" height="33">
      <p align="center" style="margin-top: 1px; margin-bottom: 1px"><b>
		<font face="Tahoma" size="2">Sencamer Terminales de Dirección</font></b></td>
  </tr>

	<tr>
	<td width="79%" >

		<table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="100%" id="table11">
			<tr>
				<td width="45%" align="left" height="22">
				<span style="text-decoration: none; font-weight:700">
				<font face="Tahoma" style="font-size: 8pt" onmouseover="showdiv(event,'<b>Vence el 21/11/2012</b>');" onmousemove="showdiv(event,'<b>Vence el 21/11/2012</b>');" onmouseout="javascript:Ocultar();">
				<a target="_blank" style="color: #000000; font-family: Tahoma; text-decoration:none" href="Sencamers/SENCAMER_MOOG_TERMINALES.pdf">
				<ul type="square" style="margin:0; "><li>
					<p style="margin-left: 25px; margin-right: 25px; margin-bottom:0" >MOOG</a></font><font face="Tahoma" size="2" ><a target="_blank" style="color: #000000; font-family: Tahoma; font-size: 11px; text-decoration:none" href="Sencamers/SENCAMER_MOOG_TERMINALES.pdf"> </a>
					</font></span> </li></ul>
				<font face="Tahoma" size="2">
<!--				<p style="margin-top: 0; margin-left:20px"><i><b>(Vence 
					el 28/07/2010)</b></i>--></font></td>

				<td width="54%" align="left" height="22">
				<font face="Tahoma" size="2" style="CURSOR: pointer" onmouseover="showdiv(event,'<b>Vence el 11/09/2013</b>');" onmousemove="showdiv(event,'<b>Vence el 11/09/2013</b>');" onmouseout="javascript:Ocultar();">
				<span style="text-decoration: none; font-weight:700"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 25px; margin-right: 25px">
					<a target="_blank" style="color: #000000; font-family: Tahoma; font-size: 11px; text-decoration: none" href="Sencamers/SENCAMER_RTS_TERMINALES.pdf">RTS</a></li></ul>  </span></td>
			</tr>
			<tr>
				<td width="45%" align="left" height="22">
				<font face="Tahoma" size="2" onmouseover="showdiv(event,'<b>Vence el 15/12/2011</b>');" onmousemove="showdiv(event,'<b>Vence el 15/12/2011</b>');" onmouseout="javascript:Ocultar();">
				<a target="_blank" style="color: #000000; font-family: Tahoma; font-size: 8pt"  href="Sencamers/SENCAMER_OCAP_TERMINALES.pdf">
				<span style="text-decoration: none; font-weight:700"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 25px; margin-right: 25px">OCAP</li></ul> </span></a></font></td>
				
				
				
				<td width="54%" align="left" height="22">
			<!--	
				<font face="Tahoma" size="2" Style="CURSOR: pointer" onmouseover="showdiv(event,'<b>Vence el 28/08/2010</b>');" onmousemove="showdiv(event,'<b>Vence el 28/08/2010</b>');" onmouseout="javascript:Ocultar();">
				<a target="_blank" style="color: #000000; font-family: Tahoma; font-size: 11px"  href="Sencamers/SENCAMER_TNK_TERMINALES.pdf">
				<span style="text-decoration: none; font-weight:700"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 25px; margin-right: 25px">TNK</li></ul>  </span></a></td>-->
					
					<a target="_blank" style="text-decoration: none" href="Sencamers/SENCAMER_ELGIN_TERMINALES.pdf">
				<span style="color: #000000; font-family: Tahoma; font-weight: 700; font-size: 11px" onmouseover="showdiv(event,'<b>Vence el 01/11/2011</b>');" onmousemove="showdiv(event,'<b>Vence el 01/11/2011</b>');" onmouseout="javascript:Ocultar();"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 25px; margin-right: 25px">ELGIN</li></ul>  </span></a></td>

							
			</tr>
			
		
			<!--
			<tr>
				<td width="45%" align="left" height="22">
				<a target="_blank" style="text-decoration: none" href="Sencamers/SENCAMER_ELGIN_TERMINALES.pdf">
				<span style="color: #000000; font-family: Tahoma; font-weight: 700; font-size: 11px" onmouseover="showdiv(event,'<b>Vence el 01/11/2011</b>');" onmousemove="showdiv(event,'<b>Vence el 01/11/2011</b>');" onmouseout="javascript:Ocultar();"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 25px; margin-right: 25px">ELGIN</li></ul>  </span></a></td>
				
				
				
				<td width="54%" align="left" height="22">
				
				&nbsp;</td>
							
			</tr>
			-->
		

		</table></td>


	</tr>
		<tr>
    <td width="79%" bgcolor="white" height="33">
      <p align="center" style="margin-top: 1px; margin-bottom: 1px"><b>
		<font face="Tahoma" size="2">Sencamer Muñones de Dirección</font></b></td>
  </tr>
  <tr>
		<td width="79%" >

		<table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="100%" id="table15">
			<tr>
				<td width="45%" align="left" height="22">
				<font face="Tahoma" size="2" onmouseover="showdiv(event,'<b>Vence el 11/09/2013</b>');" onmousemove="showdiv(event,'<b>Vence el 11/09/2013</b>');" onmouseout="javascript:Ocultar();">
				<a target="_blank" style="color: #000000; font-family: Tahoma; font-size: 11px"  href="Sencamers/SENCAMER_MOOG_MUNONES.pdf">
				<span style="text-decoration: none; font-weight:700"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">MOOG</li></ul>  </span></a></font></td>

				<td width="54%" align="left" height="22">
				<font face="Tahoma" size="2" style="CURSOR: pointer" onmouseover="showdiv(event,'<b>Vence el 11/09/2013</b>');" onmousemove="showdiv(event,'<b>Vence el 11/09/2013</b>');" onmouseout="javascript:Ocultar();">
				<span style="text-decoration: none; font-weight:700"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">
					<a target="_blank" style="color: #000000; font-family: Tahoma; font-size: 11px; text-decoration: none" href="Sencamers/SENCAMER_RTS_MUNONES.pdf">RTS</a></li></ul>  </span></td>
			</tr>
			<tr>
				<td width="45%" align="left" height="22">
				<a target="_blank" style="color: #000000; font-family: Tahoma; font-size: 11px"  href="Sencamers/SENCAMER_OCAP_MUNONES.pdf"><span style="text-decoration: none; font-weight:700">
				<font face="Tahoma" size="2" onmouseover="showdiv(event,'<b>Vence el 06/12/2011</b>');" onmousemove="showdiv(event,'<b>Vence el 06/12/2011</b>');" onmouseout="javascript:Ocultar();"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">OCAP</li></ul> </font></td>
				
				
				
				<td width="54%" align="left" height="22">
				<!--
				<font face="Tahoma" size="2" style="CURSOR: pointer" onmouseover="showdiv(event,'<b>Vence el 28/08/2010</b>');" onmousemove="showdiv(event,'<b>Vence el 28/08/2010</b>');" onmouseout="javascript:Ocultar();">
				<a target="_blank" style="color: #000000; font-family: Tahoma; font-size: 11px"  href="Sencamers/SENCAMER_TNK_MUNONES.pdf">
				<span style="text-decoration: none; font-weight:700"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">TNK</li></ul>  </span></a></td>-->
					
					<span style="color: #000000; font-family: Tahoma; font-weight: 700; font-size: 11px" onmouseover="showdiv(event,'<b>Vence el 13/10/2011</b>');" onmousemove="showdiv(event,'<b>Vence el 13/10/2011</b>');" onmouseout="javascript:Ocultar();">
				<a target="_blank" style="text-decoration: none; color: #000000; font-family: Tahoma; font-weight: 700; font-size: 11px" href="Sencamers/SENCAMER_ELGIN_MUNONES.pdf">
				<ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">ELGIN</li></ul>  </a></span></td>

							
			</tr>
			<!--
			<tr>
				<td width="45%" align="left" height="22">
				<span style="color: #000000; font-family: Tahoma; font-weight: 700; font-size: 11px" onmouseover="showdiv(event,'<b>Vence el 13/10/2011</b>');" onmousemove="showdiv(event,'<b>Vence el 13/10/2011</b>');" onmouseout="javascript:Ocultar();">
				<a target="_blank" style="text-decoration: none; color: #000000; font-family: Tahoma; font-weight: 700; font-size: 11px" href="Sencamers/SENCAMER_ELGIN_MUNONES.pdf">
				<ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">ELGIN</li></ul>  </a></span></td>
				
				
				
				<td width="54%" align="left" height="22">
				
				&nbsp;</td>
							
							
			</tr>
			
			-->
		</table></td>


	</tr>
	  <tr>
    <td width="79%" bgcolor="white" height="32">
      <p align="center" style="margin-top: 1px; margin-bottom: 1px"><b>
		<font face="Tahoma" size="2">Sencamer Amortiguadores Importados Gabriel y Rines 
		Importados Madeal</font></b></td>
  </tr>
  <tr>
		<td width="79%" height="23" >

		<table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="100%" id="table19">
			<tr>
				<td width="45%" align="left" height="22">
				<span style="font-weight: 700" onmouseover="showdiv(event,'<b>Vence el 14/10/2012</b>');" onmousemove="showdiv(event,'<b>Vence el 14/10/2012</b>');" onmouseout="javascript:Ocultar();">
				<a target="_blank" href="Sencamers/SENCAMER_AMORTIGUADORES_GABRIEL_HIDRAULICOS.pdf">
				<font face="Tahoma" style="CURSOR: pointer; font-size:11px; text-decoration:none" color="#000000"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 23px">GABRIEL 
					HIDRÁULICOS TIPO TELESCOPIO</li></ul>  </font></a></span></td>

				<td width="54%" align="left" height="22">
				<span style="font-weight: 700" >
				<a target="_blank" href="Sencamers/SENCAMER_AMORTIGUADORES_GABRIEL_MAC_PHERSON.pdf">
				<font face="Tahoma" style="CURSOR: pointer; font-size:11px; text-decoration:none" color="#000000" onmouseover="showdiv(event,'<b>Vence el 14/10/2012</b>');" onmousemove="showdiv(event,'<b>Vence el 14/10/2012</b>');" onmouseout="javascript:Ocultar();"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 23px">GABRIEL 
					TIPO MAC PHERSON</li></ul>  </font></a></span>
				</td>
			</tr>
			<tr>
				<td width="45%" align="left" height="22">
				<span style="font-weight: 700">
				<a target="_blank" href="Sencamers/SENCAMER_MADEAL.pdf">
				<font face="Tahoma" style="CURSOR: pointer; font-size:11px; text-decoration:none" color="#000000" onmouseover="showdiv(event,'<b>Vence el 31/01/2014</b>');" onmousemove="showdiv(event,'<b>Vence el 31/01/2014</b>');" onmouseout="javascript:Ocultar();"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">MADEAL</li></ul></a> 
					
					</td>

				<td width="54%" align="left" height="22">
				
				<span style="font-weight: 700" onmouseover="showdiv(event,'<b>Vence el 01/04/2012</b>');" onmousemove="showdiv(event,'<b>Vence el 01/04/2012</b>');" onmouseout="javascript:Ocultar();">
				<a target="_blank" href="Sencamers/SENCAMER_AMORTIGUADORES_GMDAT.pdf">
				<font face="Tahoma" style="CURSOR: pointer; font-size:11px; text-decoration:none" color="#000000"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 23px">GMDAT 
					TIPO MAC PHERSON</li></ul>  </font></a></span>
				
				</td>
			</tr>
			</table></td>


	</tr>
	
	<tr>
    <td width="79%" bgcolor="white" height="33">
      <p align="center" style="margin-top: 1px; margin-bottom: 1px"><b>
		<font face="Tahoma" size="2">Partes Koreanas Parts Mall (Marcas: PMC / 
		CTR / CAR-DEX)</font></b></td>
  </tr>

	<tr>
		<td width="79%" >

		<table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="100%" id="table27">
			<tr>
				<td width="45%" height="22">
				<span style="font-weight: 700">
				<a target="_blank" href="Sencamers/SENCAMER_CTR_CAR-DEX_MUNONES.pdf">
				<font face="Tahoma" style="CURSOR: pointer; font-size:11px; text-decoration:none" color="#000000" onmouseover="showdiv(event,'<b>Vence el 03/07/2013</b>');" onmousemove="showdiv(event,'<b>Vence el 03/07/2013</b>');" onmouseout="javascript:Ocultar();"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">MUÑONES 
				CTR / CAR-DEX</li></ul>  </font></a></span></td>
				
				<td width="54%" align="left" height="22">
				<span style="font-weight: 700">
				<a target="_blank" href="Sencamers/SENCAMER_PMC_CAR-DEX_TERMINALES.pdf">
				<font face="Tahoma" style="CURSOR: pointer; font-size:11px; text-decoration:none" color="#000000" onmouseover="showdiv(event,'<b>Vence el 03/07/2013</b>');" onmousemove="showdiv(event,'<b>Vence el 03/07/2013</b>');" onmouseout="javascript:Ocultar();"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">TERMINALES 
				PMC / CAR-DEX</li></ul>  </font></a></span></td>
			</tr>
			
			<!--
			<tr>
				<td width="45%" valign="middle" height="22" >
				<span style="font-weight: 700">
				<a style="text-decoration: none" target="_blank" href="Sencamers/SENCAMER_PMC_CILINDROS_RUEDA_FRENOS.pdf">
				<font face="Tahoma" style="font-size: 11px" color="#000000" onmouseover="showdiv(event,'<b>Vence el 24/10/2010</b>');" onmousemove="showdiv(event,'<b>Vence el 24/10/2010</b>');" onmouseout="javascript:Ocultar();">
				<ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">CILINDROS DE RUEDA PARA FRENOS PMC</li></ul>  </font></a></span></td>
				<td  align="center" width="54%" height="22"> 
				<span style="font-weight: 700">
				<a style="text-decoration: none" target="_blank" href="Sencamers/SENCAMER_PMC_CILINDROS_MAESTROS_FRENOS_HIDRAULICOS.pdf">
				<font face="Tahoma" style="font-size: 11px" color="#000000" onmouseover="showdiv(event,'<b>Vence el 24/09/2010</b>');" onmousemove="showdiv(event,'<b>Vence el 24/09/2010</b>');" onmouseout="javascript:Ocultar();">
				<ul type="square" style="margin:0; ">
					<li>
					<p style="margin-left: 20px; margin-right: 25px" align="left">CILINDROS MAESTROS DE FRENOS HIDRÁULICOS PMC</li></ul>  </font></a></span></td>
			</tr>
			
			
			<tr>
				<td width="45%" valign="middle" height="22" >
				<span style="font-weight: 700">
				<a style="text-decoration: none" target="_blank" href="Sencamers/SENCAMER_PMC_FRICCION_FRENOS.pdf">
				<font face="Tahoma" style="font-size: 11px" color="#000000" onmouseover="showdiv(event,'<b>Vence el 29/09/2010</b>');" onmousemove="showdiv(event,'<b>Vence el 29/09/2010</b>');" onmouseout="javascript:Ocultar();">
				<ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">FRICCIÓN PARA SISTEMAS DE FRENOS PMC</li></ul>  </font></a></span></td>
				<td  align="center" width="54%" height="22"> 
				&nbsp;</td>
			</tr>-->
			</table></td>


	</tr>
	
	
	<!--
	<tr>
    <td width="79%" bgcolor="white" height="33">
      <p align="center" style="margin-top: 1px; margin-bottom: 1px"><b>
		<font face="Tahoma" size="2">Certificado de Calidad “NORVEN” Metalcar</font></b></td>
  </tr>
	<tr>
		<td width="79%" height="31" >

		<table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="100%" id="table28">
			<tr>
				<td width="45%" align="left" valign="middle">
				<span style="font-weight: 700">
				<a target="_blank" href="Norven/Norven_Espirales.pdf">
				<font face="Tahoma" style="CURSOR: pointer; font-size:11px; text-decoration:none" color="#000000" onmouseover="showdiv(event,'<b>Vence el 19/06/2009</b>');" onmousemove="showdiv(event,'<b>Vence el 19/06/2009</b>');" onmouseout="javascript:Ocultar();"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">ESPIRALES</li></ul>  </font></a></span></td>

				<td width="54%" align="left" valign="middle">
				<span style="font-weight: 700">
				<a target="_blank" href="Norven/Norven_Ballestas.pdf">
				<font face="Tahoma" style="CURSOR: pointer; font-size:11px; text-decoration:none" color="#000000" onmouseover="showdiv(event,'<b>Vence el 19/06/2009</b>');" onmousemove="showdiv(event,'<b>Vence el 19/06/2009</b>');" onmouseout="javascript:Ocultar();"><ul type="square" style="margin:0; "><li>
					<p style="margin-left: 20px; margin-right: 25px">BALLESTAS</li></ul>  </font></a></span></td>
			</tr>
			</table></td>


	</tr>-->
</table>












</div>

<div id="Mensaje" nowrap >
		 <b>Vence el</b> 	
</div>











	<p style="margin-top: 15px" align="center">
	<input type="button" value="Regresar" name="Regresar" onclick="window.history.back()"></p>













		</td>
        </tr>
                
        

<!--        
<tr>
<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>

</td>
        </tr>-->
        
        
        
        
               </table>
  		
		
</body>
</html>