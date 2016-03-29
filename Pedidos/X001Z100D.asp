<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Varios Item</title>
<style type="text/css" >
html{overflow-y:scroll} 
</style>

<style type="text/css">
#verde
{
	position: absolute;
	display:none;
	font-family:Arial;
	font-size:0.8em;
	border:1px solid #808080;
	background-color:#f1f1f1;
}

#amarillo
{
	position: absolute;
	display:none;
	font-family:Arial;
	font-size:0.8em;
	border:1px solid #808080;
	background-color:#f1f1f1;
}


#rojo
{
	position: absolute;
	display:none;
	font-family:Arial;
	font-size:0.8em;
	border:1px solid #808080;
	background-color:#f1f1f1;
}
.thumbnail{
position: relative;
z-index: 0;
}

.thumbnail:hover{
background-color: transparent;
z-index: 50;
}

.thumbnail span{ /*CSS for enlarged image*/
position: absolute;
background-color: white;
padding: 5px;
left: -1000px;
border: 1px dashed gray;
visibility: hidden;
color: black;
text-decoration: none;
width: 250px;
height: 200px;
}

.thumbnail span img{ /*CSS for enlarged image*/
border-width: 0;
padding: 2px;

}

.thumbnail:hover span{ /*CSS for enlarged image on hover*/
visibility: visible;
top: 0;
left: 30px; /*position where enlarged image should offset horizontally */

}
</style> 
<script language="JavaScript" src="resaltar.js" type="text/javascript"></script> 
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Z001.INC"-->
<!--#include file="X001Z002.INC"-->

</HEAD>


<script language="JavaScript" >


function Inicio(){

	document.getElementById('C0001').focus();	

}

function Enviar(){

	document.frmGral.submit();	

}

function clickButton(e){ 


	key = (document.all) ? e.keyCode : e.which;
	//alert(key);
	//|| key == 46 
	if (key == 13){
		Enviar();
	}else{
		//window.event.keyCode=0;
	}

//var tab = event.keyCode == 9;

//	if (event.keyCode == 13){ 

		
		//alert('ok');
		//window.document.getElementById(objeto).click();
		//alert(objeto.tabIndex);
		//document.forms[0].elements[index].focus();
		//document.frmGral.elements[objeto.tabIndex].focus();
	 

//	}
}

var width=window.screen.width, height=window.screen.height;	
	
//Verifica Resolusion de Pantalla
if ((width=='800') && (height=='600')){
	document.write('<body  topmargin="0"  rightmargin="0" vlink="#0000FF" leftmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">') 
}else{
    document.write('<body  topmargin="0"  rightmargin="0" vlink="#0000FF" leftmargin="17" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">') 
}

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
		document.getElementById('verde').style.top = (tempY+margin);
		document.getElementById('verde').style.left = (tempX+margin);
		document.getElementById('verde').style.display='block';
	}
	
	if (par==1){
		document.getElementById('amarillo').style.top = (tempY+margin);
		document.getElementById('amarillo').style.left = (tempX+margin);
		document.getElementById('amarillo').style.display='block';
	}

	if (par==2){
		document.getElementById('rojo').style.top = (tempY+margin);
		document.getElementById('rojo').style.left = (tempX+margin);
		document.getElementById('rojo').style.display='block';
	}

	return;
}


</SCRIPT>

<style type="text/css">


html{overflow-y:scroll} 
	
body {margin-right: 0px;}


</style> 


	<table BORDER="0" width="919" align="center"  bordercolor="#FFFFFF" cellspacing="0" cellpadding="0" height="100%" bgcolor="#ffffff"   > 
		<tr><td valign="top"  >


	<table align="center"  BORDER="0" cellspacing="1" bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" width="919"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px; ">


<%


		wCLA001 = Request.QueryString("CLA001")
		wCLA002 = Request.QueryString("CLA002")
		wCLA003 = Request.QueryString("CLA003")
		wCLA004 = trim(Request.QueryString("CLA004"))
		wCLA005 = Request.QueryString("CLA005")
		wCLA006 = Request.QueryString("CLA006")
		wCLA007 = Request.QueryString("CLA007")
		wCLA008 = Request.QueryString("CLA008")
		
		IF wCLA005 = "000" THEN : wCLA005 = "" : END IF
		IF wCLA007 = "000" THEN : wCLA007 = "" : END IF
		IF wCLA008 = "000" THEN : wCLA008 = "" : END IF
		
		wURLA = "X001Z100S.ASP" & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002

		wBUSCAR = TRIM(Request.Form("BUSCAR"))
		wTITULO = TRIM(Request.Form("TITULO"))


		wTITULO = "Agregar Producto al Pedido"

		

		if len(trim(wBUSCAR)) > 0 then
			Session("glAgregar") = wBUSCAR
		   else	
			Session("glAgregar") = ""
		end if

		'wTITULO = TRIM(Request.QueryString("TITULO"))	
		wCLASS = "TDS1"
		wC01 = "Item"
		wC02 = "Cant."
		'wC03 = "%Pro."
		wC04 = "Item"
		wC05 = "Cant."
		wC06 = "%Pro."
		wC07 = "Item"
		wC08 = "Cant."
		'wC09 = "%Pro."		
		
	%>
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLA%>" target="main" >
	  <!--<TR>
	  <td  CLASS='TDT' colspan=6 bgcolor="white" >
		<p style="margin-top: 3px; margin-bottom: 3px"><b><font size="2">&nbsp;</font></b></td>		  
	  </TR>-->	
	  

	<%



	strCnn	= Application("XDTA300_ConnectionString")
	wB300101CCI = Session("glCiaInternet")
	wB300101CIA = Session("glCia")
	
	'BUSCA ERP COMPA&#65533;IA INTERNET
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wERP = TRIM(rstQuery.Fields("Z300002ERP"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	SQL = "SELECT Z300001MVI " 
	SQL = SQL & " FROM X300ZF001 WHERE "
	SQL = SQL & " Z300001CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300001PUS = '" & Session("glUsuario") & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wMVI = trim(rstQuery.Fields("Z300001MVI"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	


	'BUSCA PORCENTAJE DE PRONTO PAGO
	SQL = "SELECT A300002PPP, B300100CCL FROM X300AQ004 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300100OPE = '" &  wCLA001 & "' AND "	
	SQL = SQL & " B300100NPE = '" &  wCLA002 & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wPPP = trim(rstQuery.Fields("A300002PPP"))
		wB300100CCL = trim(rstQuery.Fields("B300100CCL"))
		Session("glPPP") = wPPP
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	SQL = "SELECT B300121ORD FROM X300BF121 " 
	SQL = SQL & " WHERE B300121NLP ='" & wCLA005 & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wORD = trim(rstQuery.Fields("B300121ORD"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	wAPLICARDES = "N"
	
	SQL = "SELECT A300004DES FROM X300AF004 " 
	SQL = SQL & " WHERE A300004CCL ='" & wB300100CCL & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wAPLICARDES = "S"
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	wESC = "B"
	
	'BUSCA ESCALA DE PRECIO POR CLIENTE
	'SQL = "SELECT A300002ESC FROM X300AF002 " 
	'SQL = SQL & " WHERE "
	'SQL = SQL & " A300002CCI = '" & Session("glCiaInternet") & "' AND "
	'SQL = SQL & " A300002CCL = '" & wB300100CCL & "'"
	'Set rstQuery = Server.CreateObject("ADODB.Recordset")
    'rstQuery.Open sql , strCnn
	'IF NOT rstQuery.EOF THEN
		'wESC = trim(rstQuery.Fields("A300002ESC"))
	'END IF
	'rstQuery.Close 
	'set rstQuery = nothing
	

	Session("glEscalaPrecio") = wESC
	
	Session("glPalabra01") = ""
	Session("glPalabra02") = ""
	Session("glPalabra03") = ""
	Session("glPalabra04") = ""
	Cargar_Palabras_Filtrado(wCLA004)
	
	SQL = "SELECT A300003CPR, A300003DEL, A300003PU" & wESC & ", A300003CIN, "
	SQL = SQL & " A300003MAR, "
	'IF wERP = "SAP" THEN
		SQL = SQL & " A300003REF, "
	'ELSE
	'	SQL = SQL & " (SELECT A300015HOM FROM X300AF015 WHERE "
	'	SQL = SQL & " A300015CCL = '" & wB300100CCL & "' AND "
	'	SQL = SQL & " A300015CPR = A300003CPR AND "
	'	SQL = SQL & " A300015CCI = A300003CCI) AS A300003REF, "
	'END IF 
	SQL = SQL & " A300003PIM, A300003UCA, "
	SQL = SQL & " A300003TRA, B300124DEC, A300003TPR " 
	SQL = SQL & ", ISNULL(RTRIM(B300125NLP),'S') AS PAR, ISNULL(RTRIM(A300022UR1),'Imagenes/nodisponible.jpg') AS A300022UR1 "
	SQL = SQL & ", ISNULL(RTRIM(B300128NLP),'S') AS PAR2, B300125STS "
	IF wERP = "ASW" THEN
		SQL = SQL & " FROM X300AQ022B "
		ELSE
		SQL = SQL & " FROM X300AQ022 " 
	END IF 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300003CCI ='" & wB300101CCI & "' AND "
	SQL = SQL & " A300003CIA ='" & wB300101CIA & "' "
	'IF len(trim(wCLA003)) > 0 THEN		
	'	SQL = SQL & " AND "
	'	SQL = SQL & " (A300003CPR LIKE '%" & ucase(wCLA003) & "%' OR"
	'	SQL = SQL & "  A300003REF LIKE '%" & ucase(wCLA003) & "%') "
	'END IF 
	'IF len(trim(wCLA004)) > 0 THEN		
	'	SQL = SQL & " AND "
	'	SQL = SQL & " (A300003DEL LIKE '%" & ucase(wCLA004) & "%' OR"
	'	SQL = SQL & "  A300003MAR LIKE '%" & ucase(wCLA004) & "%' )"		
	'END IF 	
	if len(trim(wCLA004)) > 0 then
		SQL = SQL & " AND "
		'SQL = SQL & " ((" & wCAMC01 & " LIKE '%" & ucase(wPAR) & "%') OR  "
		'SQL = SQL & "  (" & wCAMC02 & " LIKE '%" & ucase(wPAR) & "%'))  "
		SQL = SQL & " (( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " A300003CPR LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND A300003CPR LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND A300003CPR LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND A300003CPR LIKE '%" & Session("glPalabra04") & "%' "
        End If
        SQL = SQL & " ) OR ( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " A300003REF LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND A300003REF LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND A300003REF LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND A300003REF LIKE '%" & Session("glPalabra04") & "%' "
        End If
        SQL = SQL & " ) OR ( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " A300003HOM LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND A300003HOM LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND A300003HOM LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND A300003HOM LIKE '%" & Session("glPalabra04") & "%' "
        End If
        SQL = SQL & " ) OR ( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " A300003DEL LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND A300003DEL LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND A300003DEL LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND A300003DEL LIKE '%" & Session("glPalabra04") & "%' "
        End If
        'SQL = SQL & " )) "
        'IF wERP = "ASW" THEN
        '	SQL = SQL & " ) OR ( "
        '	SQL = SQL & " A300015HOM LIKE '%" & Session("glPalabra01") & "%' "
        '	IF Session("glTipoUsuario") = "C" THEN
        '		SQL = SQL & " AND A300015CCL = '" & Session("glUsuario") & "' "
        '		'SQL = SQL & " AND A300015CCL = '2012' "
        '	END IF
        'END IF
        SQL = SQL & " )) "
        
        SQL = SQL & " OR A300003CPR IN (SELECT A300015HOM FROM X300AF015 "
		SQL = SQL & " WHERE A300015CPR LIKE '%" & wCLA004 & "%' ) "

	end if	
	
	IF len(trim(wCLA005)) > 0 THEN		
		SQL = SQL & " AND "
		SQL = SQL & "  A300003NPS = '" & wCLA005 & "'"
	END IF 
	'IF len(trim(wCLA007)) > 0 THEN		
		'SQL = SQL & " AND "
		'SQL = SQL & "  A300003NLP = '" & wCLA007 & "'"
	'END IF
	'IF len(trim(wCLA008)) > 0 THEN
		'SQL = SQL & " AND A300003CGR ='" & wCLA008 & "' "
	'END IF 
 
	IF Session("glMostrarTodasFamilias") = "0" THEN	
		SQL = SQL & " AND A300003NPS IN (SELECT  B300123FAM "
		SQL = SQL & " FROM X300BF123 WHERE B300123CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " B300123CCL = '" & trim(Session("glUsuario")) & "' ) "
	END IF 
	''PARA ELLOS POR DEFECTO SE MOSTRARAN LOS PRODUCTOS QUE UNICAMENTE NO TIENEN EXISTENCIA	
	'IF Session("glTipoUsuario") <> "A" THEN
	'	SQL = SQL & " AND A300003CIN > 0 "
	'END IF 
	''*************************************************************************************
	IF trim(wCLA006) = "1" THEN
		SQL = SQL & " AND A300003CIN > 0 "
	END IF
	''SQL = SQL & " AND A300003CPR NOT IN ("
	''SQL = SQL & " SELECT B300101CPR FROM X300BF101 "
	''SQL = SQL & "  WHERE "
	''SQL = SQL & "  B300101CCI ='" & wB300101CCI & "' AND "
	''SQL = SQL & "  B300101CIA ='" & wB300101CIA & "' AND "
	''SQL = SQL & "  B300101OPE ='" & wCLA001 & "' AND "
	''SQL = SQL & "  B300101NPE ='" & wCLA002 & "' ) "

	
	IF wERP = "ASW" THEN
		SQL = SQL & " GROUP BY A300003CCI, A300003CPR, A300003DEL, A300003CIN, A300003STS, A300003PU" & wESC & ", A300003CIN, "
		SQL = SQL & " A300003MAR, A300003REF, A300003PIM, A300003TRA, B300124DEC, A300003UCA, A300003TPR, "
		SQL = SQL & " A300022UR1, B300125NLP, B300125STS, B300120DEC, B300128NLP "
	END IF 

	IF wORD = "N" THEN
		SQL = SQL & " ORDER BY A300003CPR " 
	  ELSE
		SQL = SQL & " ORDER BY A300003CPR " 'B300121DEC, B300124DEC  
	END IF 


	'response.write sql
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql, strCnn
    wCuenta = 1
    wColumna  = 1 
	'wCLASS = "TDD"
	'response.write sql
	wNLP1 = "00"
	wCLASS2 = "TDD2"
	DO WHILE NOT rstQuery.EOF 
	
	 IF wCuenta = "1" Then %>
		<!--<TR>
		<td class="TDS1" bgcolor="white" width="12%" aLIGN="left"><b>&nbsp; </b></td>
		<td class="TDS1" bgcolor="white" width="15%" aLIGN="left"><b>&nbsp; </b></td>
		<td class="TDS1" bgcolor="white" width="40%" ALIGN="left"><b> &nbsp;</b></td>
		<td class="TDS1" bgcolor="white" width="10%" ALIGN="left"><b> &nbsp;</b></td>
		<td class="TDS1" bgcolor="white" width="10%" ALIGN="Right"><b>&nbsp;</b></td>-->
		<!--<td class="TDS1" bgcolor="white" width="10%" ALIGN="Right"><b>&nbsp;</b></td>-->
		<% IF Session("glMostrarExistencia") = "1" THEN %>
		<!--<td class="TDS1" bgcolor="white" width="6%" ALIGN="center"><b>&nbsp;</b></td>-->		  
		<% END IF %>
		<!--<td class="TDS1" bgcolor="white" width="6%" ALIGN="center"><b>&nbsp;</b></td>		  

	  	</TR>-->	
	 <%
		 wCLASS = "TDD"
	 End If 
	
		wCPR = trim(rstQuery.Fields("A300003CPR"))
		'wNLP = trim(rstQuery.Fields("B200122NLP"))	
		
		'wDNLP = trim(rstQuery.Fields("B200121DEC"))	
		
		wDEL = trim(rstQuery.Fields("A300003DEL"))
		wOBJ = right(("0000" & wCuenta),4)		
		wC04 = trim(rstQuery.Fields("A300003PU" & wESC))
		wPIM = trim(rstQuery.Fields("A300003PIM"))
		wMAR = trim(rstQuery.Fields("A300003MAR"))
		wUCA = trim(rstQuery.Fields("A300003UCA"))
		wCIN = trim(rstQuery.Fields("A300003CIN"))
		wC06 = wCIN 
		wREF = left(trim(rstQuery.Fields("A300003REF")),18)
		wTRA = trim(rstQuery.Fields("A300003TRA"))
		wTPR = trim(rstQuery.Fields("A300003TPR"))
		wURI = "../ASPX/" & trim(rstQuery.Fields("A300022UR1"))
		
		wPAR = trim(rstQuery.Fields("PAR"))
		wPAR2 = trim(rstQuery.Fields("PAR2"))
		wSTS = trim(rstQuery.Fields("B300125STS"))
		wMPR = "S"


		IF wURI <> "../ASPX/Imagenes/nodisponible.jpg" THEN	
			wIMG = "<a class=""thumbnail"" href=""#thumb""><img src="& wURI & " width=""50px"" height=""50px"" border=""0"" />"
			wIMG = wIMG & "<span><img src=" & wURI & " /><p align=""center""><font name=""arial"" size=""2"">" & wCPR & "</font></p></span></a>"
		ELSE
			wIMG = "Sin Foto"
		END IF 

		

		IF (Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "V") AND wPAR <> "S" AND cdbl(wCIN) = 0 AND wSTS = "0" THEN
			wMPR = "N"
		END IF 

		
		IF CDBL(wCIN) > 0 AND Session("glTipoUsuario") = "C" AND wMVI = "0" THEN 
			
			wCIN = "<b>DISP</b>"
		
		END IF 
		
		IF CDBL(wC06) = 0  AND Session("glTipoUsuario") = "C" AND wSTS = "2" THEN 
				wCIN = "CP" 
		END IF

		IF CDBL(wC06) = 0  AND Session("glTipoUsuario") = "C" AND wSTS = "3" THEN
				wCIN = "Por Recibir" 
		END IF

		IF Session("glTipoUsuario") = "C" AND Session("glCiaInternet") = "CAR" THEN
			
			IF CDBL(wC06) >= 1 AND CDBL(wC06) <= 10 THEN
				wCIN = "<IMG src=""images/rojo.png"" border=""0"" align=""center"" vspace=""2""  onmouseover=""showdiv(event,2);"" onmousemove=""showdiv(event,2);"" onmouseout=""javascript:document.getElementById('rojo').style.display='none';"">"
			END IF 
	
			IF CDBL(wC06) >= 11 AND CDBL(wC06) <= 100 THEN
				wCIN = "<IMG src=""images/amarillo.png"" border=""0"" align=""center"" vspace=""2"" onmouseover=""showdiv(event,1);"" onmousemove=""showdiv(event,1);"" onmouseout=""javascript:document.getElementById('amarillo').style.display='none';"">"
			END IF 
			
			IF CDBL(wC06) > 100 THEN
				wCIN = "<IMG src=""images/verde.png"" border=""0"" align=""center"" vspace=""2"" onmouseover=""showdiv(event,0);"" onmousemove=""showdiv(event,0);"" onmouseout=""javascript:document.getElementById('verde').style.display='none';"">"
			END IF 

		END IF 

		
		IF wORD = "G" THEN

			IF wDEC <> trim(rstQuery.Fields("B300124DEC")) THEN
			
				wTIT = trim(rstQuery.Fields("B300124DEC"))	
				Mostrar_Sub_Titulo
			
				wDEC = trim(rstQuery.Fields("B300124DEC"))	
			END IF
		
		END IF  

		
		SQL = " SELECT B300101UVE FROM X300BF101 "
	    SQL = SQL & " WHERE "
	    SQL = SQL & " B300101CCI ='" & wB300101CCI & "' AND "
	    SQL = SQL & " B300101CIA ='" & wB300101CIA & "' AND "
	    SQL = SQL & " B300101OPE ='" & wCLA001 & "' AND "
	    SQL = SQL & " B300101NPE ='" & wCLA002 & "' AND "		
	    SQL = SQL & " B300101CPR ='" & wCPR & "' "		
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
	    IF NOT rstQuery2.EOF THEN
		   wCAN = trim(rstQuery2.Fields("B300101UVE"))
		 ELSE
		   wCAN = ""
		END IF 
		rstQuery2.CLOSE
     	SET rstQuery2 = NOTHING	
     	
     	SQL = " SELECT B300102BCK FROM X300BF102 "
	    SQL = SQL & " WHERE "
	    SQL = SQL & " B300102CCI ='" & wB300101CCI & "' AND "
	    SQL = SQL & " B300102CIA ='" & wB300101CIA & "' AND "
	    SQL = SQL & " B300102CCL ='" & wB300100CCL & "' AND "		
	    SQL = SQL & " B300102CPR ='" & wCPR & "' "		
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
	    IF NOT rstQuery2.EOF THEN
		   wBCK = trim(rstQuery2.Fields("B300102BCK"))
		 ELSE
		   wBCK = 0
		END IF 
		rstQuery2.CLOSE
     	SET rstQuery2 = NOTHING	
     	
     	wPPR = 0
     	
     	IF wAPLICARDES = "S" THEN 
					
			SQL = "SELECT A300004DES FROM X300AF004 " 
			SQL = SQL & " WHERE A300004CCL ='" & wB300100CCL & "' AND "
			SQL = SQL & " A300004NLP = '" & wTPR & "'"
			Set rstQuery1 = Server.CreateObject("ADODB.Recordset")
		    rstQuery1.Open sql , strCnn
			IF NOT rstQuery1.EOF THEN
				wPPR = cdbl(rstQuery1.Fields(0))
			 ELSE
				wPPR = 0
			END IF
			rstQuery1.Close 
			set rstQuery1 = nothing
			
		END IF 	
		
		wPPP = CDbl(wPPP)     

	    wC04 = wC04 - ((wC04 * wPPP) / 100)
		'APLICA DESCUENTO POR FAMILIA 
		wC04 = wC04 - ((wC04 * wPPR) / 100)   
		
	    wC07 = wPIM
	    
	    wFIV = 1 + (wPIM / 100)
	    
	    IF wFIV > 1 THEN
	    	IF Session("glAplicarIva") = "0" Then
	    	    wUIVA = wC04 
	    	  ELSE	    		
	        	wUIVA = Round(wC04 * wFIV, 2)	     	        		        	
	        END IF    
	       ELSE 
	        wUIVA = wC04
        END IF 
        
        wC09 = wUIVA
        wC09F = round((wUIVA/1000),2)
		wC09 = formatnumber(wC09,2)
		wC09F = formatnumber(wC09F,2)
		
		IF (Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "V") AND wPAR2 <> "S" THEN
			wC09 = "<b>NO DISPONIBLE</b>"
		END IF

		wNAMC = "C" & wOBJ
		wNAMI = "I" & wOBJ
		wNAMP = "P" & wOBJ		
		wNAMU = "U" & wOBJ		
		
		wC01 = wCPR & " - " & wDel & " - P. Neto + IVA: " & wC09	
		IF wMPR = "S" THEN
		
		'if wColumna = 1 then
			%><TR><%
		'END IF  
			%>
			<td CLASS="<%=wCLASS%>" width="10%" ALIGN="center"><%= wIMG %></td>	
			<td CLASS="<%=wCLASS%>" height="25" width="19%" he aLIGN="left">
			<font face="Tahoma" style="font-family: Tahoma; font-size:10pt"><%= wCPR %></td>
			<td CLASS="<%=wCLASS%>" width="10%" he aLIGN="left"><%= wREF %></td>
			<td CLASS="<%=wCLASS%>" width="30%" ALIGN="left"><%= wDEL %></td>
			<td CLASS="<%=wCLASS%>" width="4%" ALIGN="right"><%= wUCA %></td>
			<td CLASS="<%=wCLASS%>" width="10%" ALIGN="left"><%= wMAR %></td>
			<td CLASS="<%=wCLASS%>" width="10%" ALIGN="right"><%= wC09 %></td>
			<% IF Session("glMostrarExistencia") = "1" THEN %>
			<td CLASS="<%=wCLASS%>" width="4%" ALIGN="right">
			<%= wCIN%></td>
			<% END IF %>	
			<td CLASS="<%=wCLASS2%>" width="4%" ALIGN="right">
			<%= wBCK%></td>
			
			<% IF Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" OR Session("glMostrarTR") = "1" THEN %>
			<!--<td CLASS="<%=wCLASS2%>" width="5%" ALIGN="right">
			<%= wTRA%></td>		-->
			<% END IF %>
			<td CLASS="<%=wCLASS%>" width="6%" ALIGN="center">			
			<INPUT NAME="<%=wNAMC%>" id="<%=wNAMC%>" size=1   value="<%=wCAN%>" style="height: 17; font-family:Tahoma; font-size:8pt" tabindex="<%=wCuenta%>"  onkeypress="clickButton(event)" >	
		
			<INPUT NAME="<%=wNAMP%>" id="<%=wNAMP%>" size=15 value="<%=wPPR%>" TYPE="Hidden" >	
			<INPUT NAME="<%=wNAMI%>" id="<%=wNAMI%>" size=15 value="<%=wCPR%>" TYPE="Hidden" >	
			<INPUT NAME="<%=wNAMU%>" id="<%=wNAMU%>" size=15 value="<%=wUCA%>" TYPE="Hidden" >	
			</td>
			</TR>
			<%
		'if wColumna = 2 then		
		'</TR>	%><%
		'   wColumna = 0	
		'END IF			
		
		
			wColumna  = wColumna  + 1 
			wCuenta = wCuenta + 1		
		END IF 
				
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wCLASS = "TDS1"
	
	SUB Mostrar_Sub_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=11>" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB



'wURL = "X001A101.ASP?CAMC01=" & wCLA001 & "&CAMC02=" & wCLA002 '& "&REG=S"	
wURL = "X001A101_S.ASP?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 '& "&REG=S"	

IF wCuenta > "1" THEN %>
	  <TR>
	  <td CLASS="TDT" colspan=10>
	<INPUT TYPE="Hidden" NAME="CUENTA" id="CUENTA" value="<%=wCuenta%>">          
	<!--<INPUT TYPE="submit" NAME="send" VALUE="Agregar" tabindex="2" style="font-family: Tahoma; font-size: 10pt">-->
	<INPUT type='button' value='Regresar' id=button1 name=button1 OnClick="window.open('<%=wURL%>','main');" style="font-family: Tahoma; font-size: 10pt">
	  
	  </td>		  
	  </TR>	
<% END IF %>

<%

IF wCUENTA > "1" THEN
	
	Response.write "<script event=onload for=window language=JavaScript>"
		Response.write "Inicio()"
	Response.write "</script>"
  
ELSE 

%>
    <p ALIGN="CENTER" style="font-family: Tahoma; font-size: 14px; color:black; margin-top:15px"><b>
	<font size="2" color="#000000">Disculpe, no existe Información con esos 
	Parámetros</font></b><font size="2"><br>
	</font><br>
	<INPUT type="button" value="Regresar" onclick="window.open('<%=wURL%>','main');" style="font-family: Tahoma; font-size: 10pt"></p>

<% END IF %>
 
</FORM>

</table>

</td>
</Tr>
</table>
</body>

<%	  
 
IF Session("glMostrarExistencia") = "1" THEN
   wColspan = "5"
  Else
   wColspan = "4"
END IF 

%>

<div id="verde">
	<b>Mas de 50 Piezas 
	<br>Disponibles.</b>
</div>


<div id="amarillo">
	<b>Menos de 50 Piezas 
	<br>Disponibles.</b>
</div>

<div id="rojo">
	<b>Menos de 5 Piezas 
	<br>Disponibles.</b>
</div>

<script language="JavaScript">
<!--

//var text="<table width='105' border='0' cellpadding='0' cellspacing='0' bordercolor='white'><tr><td><font size='1' face='Arial, Helvetica, sans-serif'>&nbsp;<strong><INPUT TYPE='button' NAME='send' onclick='Javascript:document.frmGral.submit();' VALUE='Agregar o Actualizar' tabindex='2' style='font-family: Tahoma; font-size: 10pt'></strong></font></td></tr></table>"
var text="<table align='center'  BORDER='1' bordercolor='#0066CC' bgcolor='#FE9900' WIDTH='782'  style='padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px;'><TR><td CLASS='TDT' colspan=<%=wColspan%> ><p style='margin-top: 3px; margin-bottom: 3px'><b><font size='2'><%= wTITULO %></font></b></td><td CLASS='TDT' colspan=2><INPUT TYPE='button' NAME='send' onclick='Javascript:document.frmGral.submit();' VALUE='Agregar' tabindex='2' style='font-family: Tahoma; font-size: 10pt;'></td> </TR> <TR><td CLASS='<%=wCLASS%>' width='12%' aLIGN='left'><b> Nro. de Parte</b></td><td CLASS='<%=wCLASS%>' width='15%' aLIGN='left'><b>Homologo</b></td><td CLASS='<%=wCLASS%>' width='40%' ALIGN='left'><b> Descripci&#65533;n</b></td><td CLASS='<%=wCLASS%>' width='10%' ALIGN='left'><b> Marca</b></td><td CLASS='<%=wCLASS%>' width='10%' ALIGN='Right'><b> Precio Bs. </b></td><% IF Session("glMostrarExistencia") = "1" THEN %><td CLASS='<%=wCLASS%>' width='6%' ALIGN='center'><b>Exist.</b></td><% END IF %><td CLASS='<%=wCLASS%>' width='6%' ALIGN='center'><b>Cant.</b></td></TR></table>"
 
//document.write("<div id='FlyOnOff'  border='3' style='position:absolute; visibility:show; width:10px; height:10px; z-index:2; left: 19px; top: 0px;'>"+text+"</div>");
horz=".pixelLeft";
vert=".pixelTop";
docStyle="";
styleDoc=".style";
innerW="document.body.clientWidth";
innerH="document.body.clientHeight";
offsetX="document.body.scrollLeft";
offsetY="document.body.scrollTop";
function checkLocation() {
	objectXY="FlyOnOff";
	var availableX=eval(innerW);
	var availableY=eval(innerH);
	var currentX=eval(offsetX);
	var currentY=eval(offsetY);
	var left;
	var width=window.screen.width, height=window.screen.height;	

	//Verifica Resolusion de Pantalla
	if ((width=='800') && (height=='600')){
		left=0;
	}//else{
	if ((width=='1024') && (height=='768')){
		left=120;
	}
	if ((width=='1024') && (height=='600')){
		left=120;
	}
	if ((width=='1280') && (height=='800')){
		left=245;
	}


	x=left+currentX;
	y=0+currentY;
	eval(docStyle + objectXY + styleDoc + horz + "=" + x);
	eval(docStyle + objectXY + styleDoc + vert + "=" + y);
}
//setInterval('checkLocation()', 2);
//-->
</script>
</html>