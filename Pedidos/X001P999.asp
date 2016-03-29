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


.auto-style4 {
	text-align: center;
	vertical-align: middle;
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

   	  /*var s;	 
   	  s = document.frmGral["rbCOP"][0].checked;  
//		document.testform["model"][i].value
   	  alert(s+' ok');*/
   	   	
   	//  return false

    	if ((document.frmGral["rbCOP"][0].checked == false) && (document.frmGral["rbCOP"][1].checked == false)){
  		   alert("Por favor, indique si conoce nuestro portafolio.");
  		   //frmGral.rbCOP.focus();
  		   return false
  		}
  	
		if ((document.frmGral["rbEIC"][0].checked == false) && (document.frmGral["rbEIC"][1].checked == false)){
  		   alert("Por favor, indique si esta interesado en mas de nuestro portafolio.");
  		   //frmGral.rbCOP.focus();
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
	wCheckedCOPS = ""
	wCheckedEICS = ""
	wCheckedCOPN = ""
	wCheckedEICN = ""
	
	IF wP300001COP = "S" THEN
		wCheckedCOPS = " checked=checked"
	END IF 
	
	IF wP300001COP = "N" THEN
		wCheckedCOPN = " checked=checked"
	END IF 
	
	IF wP300001EIC = "S" THEN
		wCheckedEICS = " checked=checked"		
	END IF 
	
	IF wP300001EIC = "N" THEN
		wCheckedEICN = " checked=checked"		
	END IF 
		
	
%>



<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<form method="post" action="X001P004S.asp?CLA001=<%=wCLA001%>" name="frmGral" onsubmit="return validar();">

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

<fieldset style="background-color: #FAFAF8 ">


<table style="width: 95%; padding: 10 0 10 0;" align="center" >
<tr>
		<td style="width: 350px" class="auto-style4">
		<input name="btnDatos" type="button" value="Datos Generales" onclick="javascript:window.open('X001P001.asp?CLA001=<%=wCLA001%>&ORG=P&PAR=1','main');" style="width: 200px" />
		</td>
		<td class="auto-style4"> 
		<input name="btnDeportes" type="button" value="Deportes y Hobbies" onclick="javascript:window.open('X001P002.asp?CLA001=<%=wCLA001%>&PAR=2','main');" style="width: 200px" />
		
		</td>
	</tr>
<tr>
		<td style="width: 350px" class="auto-style4">
		<input name="btnProductos" type="button" value="Productos de Interes" onclick="javascript:window.open('X001P003M1.asp?CLA001=<%=wCLA001%>&PAR=3','main');" style="width: 200px"/>
		</td>
		<td class="auto-style4"> 
		<input name="btnChaneme" type="button" value="Portafolio" onclick="javascript:window.open('X001P004.asp?CLA001=<%=wCLA001%>&PAR=4','main');" style="width: 200px"/>
		
		</td>
	</tr>
<tr>
			</tr>

</table>
</fieldset>
<br>

<fieldset style="background-color: #FAFAF8 ">
<legend><strong>Oportunidades</strong></legend>
	<table style="width: 100%; border-spacing: 5px" >
	
	<tr>
		<td colspan="9" style="width: 90%;text-align : center; height: 35px">
		<input name="btnCrear" type="button" value="Crear" onclick="javascript:window.open('X001P100.asp?CLA001=<%=wCLA001%>','main');" style="width: 100px"/>
		</br>
		</td>
	</tr>
			
	<%
		'''******************CARGAR OPORTUNIDADES DEL PROSPECTO*****************************
	
		SQL = " SELECT P300100NPE, P300100FPR, (P300100MNE+P300100BIV), P300100TUV, P300100SPP, " 																	
		SQL = SQL & " P300100STS FROM X300PF100 WHERE "
		SQL = SQL & " P300100CCI = '" & trim(Session("glCiaInternet")) & "' AND "
		SQL = SQL & " P300100CCL = '" & wCLA001 & "'"
		SQL = SQL & " ORDER BY  P300100FAC DESC " 					
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		wColumna = 1
		wCuenta = 0
		DO WHILE NOT rstQuery.EOF 
			wNPE = trim(rstQuery.Fields(0))
			wFPR = trim(rstQuery.Fields(1))
			wFPR = right("0" & day(wFPR),2) & "-" & right("0" & month(wFPR),2) & "-" & right(year(wFPR),2)
			wMON = trim(rstQuery.Fields(2))
			wTUV = trim(rstQuery.Fields(3))
			wSTS = trim(rstQuery.Fields(5))
			wTUV = FormatNumber(wTUV,0)
			wMON = FormatNumber(wMON,2) 
			
			IF wSTS = "9" THEN
				wSTS = "Descalificada"			
			END IF  
			
			IF wSTS = "1" THEN
				wSTS = "En Proceso"			
			END IF  
			
			IF wSTS = "2" THEN
				wSTS = "Cerrada"			
			END IF  

			
			If wColumna = 1 Then
				%>
				
				<tr>
				<td style="width: 20%;text-align : center">
				<b>Nro.</b>
				</td>
				<td style="width: 10%;text-align : center">
				<b>Estatus</b>
				</td>
				<td style="width: 10%;text-align : center">
				<b>Fecha</b>
				</td>
				<td style="width: 10%;text-align : right">
				<b>Cantidad</b>
				</td>
				<td style="width: 10%;text-align : right">
				<b>Monto Total</b>				
				</td>
				<td style="width: 10%;text-align : center">
				<b>Detalle</b>
				</td> 
				<td style="width: 10%;text-align : center">
				<b></b>
				</td>
				<td style="width: 10%;text-align : center">
				<b></b>
				</td> 
				<td style="width: 10%;text-align : center">
				<b></b>
				</td> 

				</tr>
				
				<%
			End If  

			%>
			
				<tr>
				<td style="width: 10%;text-align : center">
				<A href="X001P100.asp?CLA001=<%=wCLA001%>&CLA002=<%=wNPE%>" target="main" style="text-decoration: none"> 
				<%=wNPE%>
				</a>
				</td>
				<td style="width: 10%;text-align : center">
				<%=wSTS%>
				</td>
				<td style="width: 10%;text-align : center">
				<%=wFPR%>
				</td>
				<td style="width: 10%;text-align : right">
				<%=wTUV%>
				</td>
				<td style="width: 20%;text-align : right">
				<%=wMON%>
				<!--<img onclick="javascript:window.open('X001P003M1S.asp?CLA001=<%=wCLA001%>&PRO=E&CON=<%=wCON%>','main');" src="images/Delete.gif" alt="Eliminar" style="cursor: pointer">			
				-->
				</td>
				<td style="width: 10%;text-align : center">
				<A href="X001P101.asp?CLA001=<%=wCLA001%>&CLA002=<%=wNPE%>" target="main" style="text-decoration: none"> 
				Ver Item
				</A>
				</td> 
				
				<td style="width: 10%;text-align : center">
				<A href="X001P102.asp?CLA001=<%=wCLA001%>&CLA002=<%=wNPE%>" target="main" style="text-decoration: none"> 
				Seguimiento
				</A>
				<td style="width: 10%;text-align : center">
				<%IF wSTS <> "Descalificada" THEN%> 
				<A href="X001P103.asp?CLA001=<%=wCLA001%>&CLA002=<%=wNPE%>" target="main" style="text-decoration: none"> 
				<%END IF %>
				Recaudo
				</A>
				</td>
				
				<td style="width: 10%;text-align : center">
				<%IF wSTS <> "Descalificada" THEN%> 
				<A href="X001P104.asp?CLA001=<%=wCLA001%>&CLA002=<%=wNPE%>" target="main" style="text-decoration: none"> 
				<%END IF %>
				Cierre
				</A>
				</td>
				
				</tr>
			<%
										
						
			'If wColumna = 3 Then		
				%><%
		   	'	wColumna = 0	
			'End If			
					
			wColumna = wColumna + 1	
			wCuenta = wCuenta + 1	
		rstQuery.MoveNext  
       	LOOP
       	rstQuery.CLOSE
       	SET rstQuery = NOTHING
       	
		IF wCuenta = 0 THEN
       	%>
       	
       	
				<tr>
				<td style="width: 90%;text-align : center">
				No hay información de Oportunidades.
				</td>
				</tr>
       	<%
       	
       	END IF
       	
       	'*****************************************************************************************************

%>
	</table>
			

</fieldset>
<br>



<INPUT NAME="tLIN" id="tLIN" size=15 value="<%=wCuentaLIN%>" TYPE="Hidden" >	
<!--
<INPUT NAME="tHOB" id="tHOB" size=15 value="<%=wCuentaHOB%>" TYPE="Hidden" >	
<INPUT NAME="tPRO" id="tPRO" size=15 value="<%=wCuentaPRO%>" TYPE="Hidden" >	-->	

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
