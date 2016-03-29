<%@ Language=VBScript %>
<% Response.Expires = 0 %>

<% wSTSIMP = Request.QueryString("STSIMP") %>

 
<html > 

<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Consultas</title>

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

html{overflow-y:scroll} 

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

<script language="Javascript" type="text/javascript">

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
</script>

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<script language="JavaScript" src="resaltar.js" type="text/javascript"></script> 


<!--
<link rel="stylesheet" type="text/css" href="zoomer.css" media="screen">
<script type="text/javascript" src="jquery-latest.js"></script>
<script type="text/javascript" src="zoomer.js"></script>
<script type="text/javascript">
$(document).ready(function(){$('ul.thumb li').Zoomer({speedView:400,speedRemove:200,altAnim:true,speedTitle:400,debug:false});});
</script>-->

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Z002.INC"-->
</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center">
		<div align=center>
		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
<%	ELSE %>

	<body topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="yes">

<script language="javascript">

function showDiv(){

	parent.frames["footer"].showDiv(); 


}

function hideDiv(){

	parent.frames["footer"].hideDiv(); 


}

//showDiv() 

</script> 

<style type="text/css">


html{overflow-y:scroll} 
	
body {margin-right: 0px;}


</style> 




<table border="0" height="100%" width="919" align="center" bgcolor="#ffffff" cellpadding="0" cellspacing="0"   ><tr><td valign="top"  >
		<div >
		<table id="Productos" BORDER="0" width="919"   bordercolor="#ffffff" cellspacing="1" cellpadding="4"  bgcolor="<%=Request.Cookies("CAR")("Color2")%>" align="center">
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))		
	wNOMTAB = "X300AQ022"
	wCAMC01 = "A300003CPR"
	wCAMC02 = "A300003DEL" 
	wCAMC03 = "A300003CIN" 
	wCAMC04 = "A300003STS"	
	wFAM = Request.Form("FAMILIA")
	wNLP = Request.Form("SUBLINEA") 
	wPAR = Request.Form("DESCRIPCION")
	wPIN = Request.Form("PIN") 
	wCGR = Request.Form("MODELO") 
	wPARCON = Request.QueryString("PARCON")	
	
	'response.write wPIN
	
		
	'Mostrar Encabezado para impresion
	if wSTSIMP = "S" THEN
		'Mostrar Titulo
		Mostrar_Titulo
		'Mostrar Encabezado
		wTipo = "E"
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
	   ELSE	
		wShowURL = "S"
	END IF
	
	'Mostrar Encabezado para impresion
    wCAMXXX = left(wCAMC01,7) 

	strCnn	= Application("XDTA300_ConnectionString")
	
	
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


	wESC = "B"
	
	'IF Session("glTipoUsuario") = "C" THEN
 	
		'BUSCA ESCALA DE PRECIO POR CLIENTE
		'SQL = "SELECT A300002ESC FROM X300AF002 " 
		'SQL = SQL & " WHERE "
		'SQL = SQL & " A300002CCI = '" & Session("glCiaInternet") & "' AND "
		'SQL = SQL & " A300002CCL = '" & Session("glUsuario") & "'"
		'Set rstQuery = Server.CreateObject("ADODB.Recordset")
    	'rstQuery.Open sql , strCnn
		'IF NOT rstQuery.EOF THEN
			'wESC = trim(rstQuery.Fields("A300002ESC"))
		'END IF
		'rstQuery.Close 
		'set rstQuery = nothing
	
	'END IF 
	
	IF Session("glTipoUsuario") = "CP" THEN
		wESC = "Z"	
	END IF  
	
	SQL = "SELECT B300121ORD FROM X300BF121 " 
	SQL = SQL & " WHERE B300121NLP ='" & wFAM & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wORD = trim(rstQuery.Fields("B300121ORD"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	wAPLICARDES = "N"
	
	IF Session("glTipoUsuario") = "C" THEN 
		SQL = "SELECT A300004DES FROM X300AF004 " 
		SQL = SQL & " WHERE A300004CCL ='" & Session("glUsuario") & "'"
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wAPLICARDES = "S"
		END IF
		rstQuery.Close 
		set rstQuery = nothing
	END IF 	

	
	
	IF wPARCON = "1" THEN
		'SQL = "SELECT Z300001PDE FROM X300ZF001 " 
		'SQL = SQL & " WHERE Z300001CCI ='" & Session("glCiaInternet") & "' AND "
		'SQL = SQL & " Z300001CLU ='EG' "
		
		SQL = "SELECT A300004DES FROM X300AF004 " 
		SQL = SQL & " WHERE A300004CCL ='55620'" 'DESCUENTO GABRIEL
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
    	rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wPDE = CDBL(rstQuery.Fields("A300004DES"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing	
		
		
	END IF 
	
	Session("glPalabra01") = ""
	Session("glPalabra02") = ""
	Session("glPalabra03") = ""
	Session("glPalabra04") = ""
	
	Cargar_Palabras_Filtrado(wPAR)
	
	'Response.write Session("glPalabra01") & "<br>"
	'Response.write Session("glPalabra02") & "<br>"
	
	IF wFAM = "000" AND LEN(TRIM(wPAR)) = 0 THEN
	 	Response.end
	END IF 
	
	IF wERP = "ASW" THEN
		wNOMTAB = "X300AQ022B"
	END IF 
	
	SQL = "SELECT " & wCAMC01 & ", " & wCAMC02 
	SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04 
	SQL = SQL & ", A300003PU" & wESC & " , A300003CIN, A300003MAR, " 
	'IF wERP = "SAP" OR Session("glTipoUsuario") <> "C" THEN
		SQL = SQL & " A300003REF "
	'ELSE
	'	SQL = SQL & " (SELECT A300015HOM FROM X300AF015 WHERE "
	''	SQL = SQL & " A300015CCL = '" & Session("glUsuario") & "' AND "
	'	SQL = SQL & " A300015CPR = A300003CPR AND "
	'	SQL = SQL & " A300015CCI = A300003CCI) AS A300003REF "
	'END IF 
	SQL = SQL & ", A300003PIM, A300003TRA, B300124DEC, A300003UCA "
	SQL = SQL & ", A300003TPR, ISNULL(RTRIM(A300022UR1),'Imagenes/nodisponible.jpg') AS A300022UR1 "
	'SQL = SQL & ", ISNULL(RTRIM(B300128NLP),'S') AS PAR "
	SQL = SQL & ", ISNULL(RTRIM(B300128NLP),'S') AS PAR2, B300125STS "
	SQL = SQL & " FROM " &  wNOMTAB 	
	SQL = SQL & " WHERE "
	SQL = SQL & wCAMXXX & "CCI ='" & Session("glCiaInternet") & "'  "
	SQL = SQL & " AND " & wCAMXXX & "CIA ='" & Session("glCia") & "' "
	IF wFAM <> "000" THEN
		SQL = SQL & " AND A300003TPR ='" & wFAM & "' "
	END IF 
	'IF wNLP <> "000" THEN
		'SQL = SQL & " AND A300003NLP ='" & wNLP & "' "
	'END IF 
	'IF wCGR <> "000" THEN
		'SQL = SQL & " AND A300003CGR ='" & wCGR & "' "
	'END IF 
	wWHERE = " AND "
	wRegistros = cint(Session("glRegistros"))
	''PARA ELLOS POR DEFECTO SE MOSTRARAN LOS PRODUCTOS QUE UNICAMENTE NO TIENEN EXISTENCIA	
	'IF Session("glTipoUsuario") <> "A" THEN
		'SQL = SQL & " AND A300003CIN > 0 "
	'END IF 
	'*************************************************************************************
	IF Session("glMostrarTodasFamilias") = "0" THEN	
		SQL = SQL & " AND A300003NPS IN (SELECT  B300123FAM "
		SQL = SQL & " FROM X300BF123 WHERE B300123CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " B300123CCL = '" & trim(Session("glUsuario")) & "' ) "
	END IF 
	IF wPIN = "1" THEN
		SQL = SQL & " AND A300003CIN > 0 "
	END IF
	if len(trim(wPAR)) > 0 then
		SQL = SQL & wWHERE
		'SQL = SQL & " ((" & wCAMC01 & " LIKE '%" & ucase(wPAR) & "%') OR  "
		'SQL = SQL & "  (" & wCAMC02 & " LIKE '%" & ucase(wPAR) & "%'))  "
		SQL = SQL & " (( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " " & wCAMC01 & " LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND " & wCAMC01 & " LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND " & wCAMC01 & " LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND " & wCAMC01 & " LIKE '%" & Session("glPalabra04") & "%' "
        End If
        SQL = SQL & " ) OR ( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " " & wCAMC02 & " LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND " & wCAMC02 & " LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND " & wCAMC02 & " LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND " & wCAMC02 & " LIKE '%" & Session("glPalabra04") & "%' "
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
        'SQL = SQL & " )) "
        IF wERP = "ASW" THEN
        	'SQL = SQL & " ) OR ( "
        	'SQL = SQL & " A300015HOM LIKE '%" & Session("glPalabra01") & "%' "
            'IF Session("glTipoUsuario") = "C" THEN
        	'	SQL = SQL & " AND A300015CCL = '" & Session("glUsuario") & "' "
        		'SQL = SQL & " AND A300015CCL = '2012' "
        	'END IF
        END IF 
        SQL = SQL & " )) "

		SQL = SQL & " OR A300003CPR IN (SELECT A300015HOM FROM X300AF015 "
		SQL = SQL & " WHERE A300015CPR LIKE '%" & wPAR & "%' ) "

	end if	
	
	IF wFAM = "090" THEN
		'SQL = SQL & " ORDER BY A300003MAR, A300003CPR " 
	END IF
	IF wERP = "ASW" THEN
		SQL = SQL & " GROUP BY A300003CPR, A300003DEL, A300003CIN, A300003STS, A300003PU" & wESC & ", A300003CIN, "
		SQL = SQL & " A300003MAR, A300003REF, A300003PIM, A300003TRA, B300124DEC, A300003UCA, A300003TPR, "
		SQL = SQL & " A300022UR1, B300125NLP, B300125STS, B300128NLP, B300120DEC, A300003CCI "
	END IF 
	IF wORD = "N" and len(trim(wPAR)) = 0 THEN
		SQL = SQL & " ORDER BY A300003CPR " 
	  ELSE
		SQL = SQL & " ORDER BY A300003CPR" 'B300121DEC, B300124DEC 
	END IF 
	
	'Response.Write SQL	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDDA"
	wCLASS2 = "TDD2"
	wCuenta = 0
	wTC03 = 0 
	wTC04 = 0
	wTC05 = 0
	wTBCK = 0
	wTTRA = 0 
	wDEC = 0
	wCuenta2 = 0

	DO WHILE NOT rstQuery.EOF 'and wFAM > 0

		wC01 = trim(rstQuery.Fields(0))
		wC02 = trim(rstQuery.Fields(1))
		wC03 = trim(rstQuery.Fields(2))
		wC04 = trim(rstQuery.Fields(3))
		wC05 = trim(rstQuery.Fields(4))
		wC06 = trim(rstQuery.Fields(5))
		wCIN = wC06
		wC07 = trim(rstQuery.Fields(6))
		wC08 = left(trim(rstQuery.Fields(7)),18)	
		IF LEN(TRIM(wC08)) = 0 OR ISNULL(wC08) THEN 
			wC08 = "&nbsp;"
		END IF 
		
		wC09 = trim(rstQuery.Fields(8))
		wTRA = trim(rstQuery.Fields(9))
		wC11 = trim(rstQuery.Fields(11))	
		wTPR = trim(rstQuery.Fields(12))
		wURI = "../ASPX/" & trim(rstQuery.Fields(13))
		'wPAR = trim(rstQuery.Fields(14))
		wPAR2 = trim(rstQuery.Fields(14))
		wSTS = trim(rstQuery.Fields(15))
		wMPR = "S"
		


IF (Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "V") AND wPAR <> "S" AND cdbl(wCIN) = 0 AND wSTS = "0" THEN
			wMPR = "N"
END IF
		
		wCuenta2 = wCuenta2 + 1

		IF wCuenta2 = 1 THEN		
				'wCLASS = "TDDA"
			ELSE
				'wCLASS = "TDDB"
				wCuenta2 = 0
		END IF
		
		IF CDBL(wC06) > 0 AND Session("glTipoUsuario") = "C" AND wMVI = "0" THEN
			wC06 = "<b>DISP</b>"
		END IF

		IF CDBL(wCIN) = 0  AND Session("glTipoUsuario") = "C" AND wSTS = "2" THEN 
				wC06 = "CP" 
		END IF

		IF CDBL(wCIN) = 0  AND Session("glTipoUsuario") = "C" AND wSTS = "3" THEN
				wC06 = "Por Recibir" 
		END IF

		
		IF Session("glTipoUsuario") = "C" AND Session("glCiaInternet") = "CAR" THEN
			
			IF CDBL(wCIN) >= 1 AND CDBL(wCIN) <= 10 THEN
				wC06 = "<IMG src=""images/rojo.png"" border=""0"" align=""center"" vspace=""2""  onmouseover=""showdiv(event,2);"" onmousemove=""showdiv(event,2);"" onmouseout=""javascript:document.getElementById('rojo').style.display='none';"">"
			END IF 
	
			IF CDBL(wCIN) >= 11 AND CDBL(wCIN) <= 100 THEN
				wC06 = "<IMG src=""images/amarillo.png"" border=""0"" align=""center"" vspace=""2"" onmouseover=""showdiv(event,1);"" onmousemove=""showdiv(event,1);"" onmouseout=""javascript:document.getElementById('amarillo').style.display='none';"">"
			END IF 
			
			IF CDBL(wCIN) > 100 THEN
				wC06 = "<IMG src=""images/verde.png"" border=""0"" align=""center"" vspace=""2"" onmouseover=""showdiv(event,0);"" onmousemove=""showdiv(event,0);"" onmouseout=""javascript:document.getElementById('verde').style.display='none';"">"
			END IF 

		END IF 

		
	
		
 
	
		'wC02 = wC02 & "<br><b>Marca:</b> " & wC07
		wDES = 0
		
		IF wAPLICARDES = "S" THEN 
					
			SQL = "SELECT A300004DES FROM X300AF004 " 
			SQL = SQL & " WHERE A300004CCL ='" & Session("glUsuario") & "' AND "
			SQL = SQL & " A300004NLP = '" & wTPR & "'"
			Set rstQuery1 = Server.CreateObject("ADODB.Recordset")
		    rstQuery1.Open sql , strCnn
			IF NOT rstQuery1.EOF THEN
				wDES = cdbl(rstQuery1.Fields(0))
			  ELSE
				wDES = 0
			END IF
			rstQuery1.Close 
			set rstQuery1 = nothing
			
		END IF 	
	
		IF wORD = "G" THEN

			IF wDEC <> trim(rstQuery.Fields(10)) THEN
			
				wTIT = trim(rstQuery.Fields(10))	
				Mostrar_Sub_Titulo
			
				wDEC = trim(rstQuery.Fields(10))	
			END IF
		
		END IF  
		
		IF ISNULL(wTRA) THEN
			wTRA = 0
		END IF  
		
		wC05 = wC05 - (wC05 * wPPP) / 100 
		'APLICA DESCUENTO POR FAMILIA 
		wC05 = wC05 - (wC05 * wDES) / 100   
		IF wPARCON = "1" THEN
			wC05 = wC05 - (wC05 * wPDE) / 100  			
		END IF 
		IF Session("glAplicarIva") <> "0" Then
			wC05 = wC05 * (1 + wC09 / 100)  
		End If
		
		wC05P = wC05 * 2
		
		wC05 = formatnumber(wC05,2)
		wC05P = formatnumber(wC05P,2)
		
		IF (Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "V") AND wPAR2 <> "S" THEN 
			wC05 = "<b>NO DISPONIBLE</b>"
		END IF

		'wC02 = left(wC02,34)		
		
		IF wC03 = "1" THEN
		   wC03 = "Activo"
		  ELSE
   	       wC03 = "Inactivo"
		END IF 
		

		SQL = " SELECT SUM(B300102BCK) AS B300102BCK FROM X300BF102 "
	   	SQL = SQL & " WHERE "
	   	SQL = SQL & " B300102CCI ='" & Session("glCiaInternet") & "' AND "
	    SQL = SQL & " B300102CIA ='" & Session("glCia")  & "' AND "
	    IF Session("glTipoUsuario") = "C" THEN 
	    	SQL = SQL & " B300102CCL ='" & Session("glUsuario") & "' AND "		
	    END IF
	    IF Session("glTipoUsuario") = "V" THEN 
	    	SQL = SQL & " B300102CVE ='" & Session("glCodVendedor")  & "' AND "		
	    END IF
	    SQL = SQL & " B300102CPR ='" & wC01 & "' "		
	    'RESPONSE.WRITE SQL
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
	    IF NOT rstQuery2.EOF THEN
			wBCK = trim(rstQuery2.Fields("B300102BCK"))
			 ELSE
			wBCK = 0
		END IF 
		rstQuery2.CLOSE
     	SET rstQuery2 = NOTHING
			
		IF ISNULL(wBCK) THEN
			wBCK = 0			
		END IF
		
		'wIMG = "<li><a href=""#""><img src=" & wURI & " alt=" & wC01 & " /></a></li>"
		
		wURI = Replace(wURI, " ","%20") 
		
		IF wURI <> "../ASPX/Imagenes/nodisponible.jpg" THEN	
			wIMG = "<a class=""thumbnail"" href=""#thumb""><img src="& wURI & " width=""50px"" height=""50px"" border=""0"" />"
			wIMG = wIMG & "<span><img src=" & wURI & " /><p align=""center""><font name=""arial"" size=""2"">" & wC01 & "</font></p></span></a>"
		ELSE
			wIMG = "Sin Foto"
		END IF 
		
		wTBCK = wTBCK + cdbl(wBCK)
		wTTRA = wTTRA + cdbl(wTRA)
		
		'Armar URL
		
		IF wURLACT = "X000A001_S.ASP" THEN
			wURL = wURLACT & "?NOMTAB=X002BQ101" 
			ELSE
			wURL = wURLACT & "?CLA001=" & wC01
		END IF	

		if Session("glTipoUsuario") = "A" then
			wTIURL = "<A href=" & wURL & " target=""_parent""> "
			wTFURL = " </A>"
		   ELSE
			wTIURL = ""
			wTFURL = ""
		END IF   	

		SELECT CASE wNOMTAB
			'Maestro de Clientes
			CASE "X201AF002"
			'Lista de Precio
			CASE "X201AF018"
				wC03 = "Detalle"
				wURLD = "X001X105_S.asp?NOMTAB=X201AQ018&CLA001=" & wC01
				wTIDURL = "<A href=" & wURLD & " target=""_parent""> "
				wTFURL = " </A>"

		END SELECT	

		IF wMPR = "S" THEN
			Mostrar_Linea
			wCuenta = wCuenta + 1
		END IF 
		
		rstQuery.MoveNext 
		

	LOOP
	
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	IF wCuenta = 0 and wFAM <> "" Then
		Response.write "<script>alert('No Existe Información con los Parametros establecidos');</script>"
	End If 

	wTIURL = ""
	wTFURL = ""


	IF wCuenta > 0 then
		wCLASS = "TD3"
		wCLASS2 = "TD3"
		wTipo = "T"
		wC01 = wCuenta
		wC02 = "&nbsp;"		
		wC03 = "&nbsp;"
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		wC05P = "&nbsp;"
		wC11 = "&nbsp;"
		wBCK = wTBCK
		wTRA = wTTRA

		wC06 = "&nbsp;"
		wC07 = "&nbsp;"
		wC08 = "&nbsp;"
		wIMG = "&nbsp;"
		Mostrar_Linea	
	end if

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X100_C.ASP"-->
</table>
<br>
<br>
<br>
<br>
<br>
<br>
</div> 
</td> 
</tr> 
</table> 

<script language="JavaScript" type="text/javascript"> 
    // si queremos resaltar todas las tablas,
    // no le pasamos parametro
    //ResaltarFila();
</script> 

<% IF wCuenta > 0 AND wPARCON = "1" THEN %>

<script language="javascript">

	hideDiv();

</script>

<% END IF %>


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



</body>
</html>
