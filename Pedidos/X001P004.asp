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
<legend><strong>Portafolio Chaneme</strong></legend>

<table style="width: 95%; padding: 10 0 10 0;" align="center" >
<tr>
		<td style="width: 350px" class="auto-style1">¿Conoce el Portafolio de Chaneme?</td>
		<td class="auto-style1"> 
		<input name="rbCOP" id="rbCOP" type="radio" value="S" <%=wCheckedCOPS%>/> SI&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="rbCOP" id="rbCOP" type="radio" value="N" <%=wCheckedCOPN%>/> NO
		</td>
	</tr>
<tr>
		<td style="width: 350px" class="auto-style1">¿Esta interesado en conocer mas de nuestro Portafolio?</td>
		<td class="auto-style1"> 
		<input name="rbEIC" id="rbEIC" type="radio" required="required" value="S" <%=wCheckedEICS%> /> SI&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="rbEIC" id="rbEIC" type="radio" required="required" value="N" <%=wCheckedEICN%> /> NO
		</td>
	</tr>
<tr>
		<td style="width: 350px" class="auto-style1">¿Alguna Linea o Producto en Particular?</td>
		<td class="auto-style1"> 
		
		</td>
	</tr>

</table>
<table style="width: 95%" align="center">
	
	
	<%
	
		SQL = " SELECT P300707LIN, P300707DEC FROM X300PF707 " 																	
		SQL = SQL & " WHERE "
		SQL = SQL & " P300707CCI = '" & trim(Session("glCiaInternet")) & "' "
		SQL = SQL & " ORDER BY  P300707DEC " 					
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		wColumna = 1
		wCuentaLIN = 1
		DO WHILE NOT rstQuery.EOF 
			wCOD = trim(rstQuery.Fields(0))
			wDES = trim(rstQuery.Fields(1))
			
			wChecked = ""						
			SQL = "SELECT P300004LIN "
			SQL = SQL & " FROM X300PF004 WHERE "
			SQL = SQL & " P300004CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " P300004LIN = '" & wCOD & "' AND "
			SQL = SQL & " P300004COD = '" & trim(wCLA001) & "'" 
			Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
			rstQuery2.Open sql , strCnn
			IF NOT rstQuery2.EOF THEN
				wChecked = "checked"
			END IF
			rstQuery2.Close 
			set rstQuery2 = nothing
			
			wCTR = "chLIN" & wCuentaLIN
			wCT2 = "txLIN" & wCuentaLIN
			
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
			wCuentaLIN = wCuentaLIN + 1	
		rstQuery.MoveNext  
       	LOOP
       	rstQuery.CLOSE
       	SET rstQuery = NOTHING	

%>


	
	</table>
</fieldset>


<INPUT NAME="tLIN" id="tLIN" size=15 value="<%=wCuentaLIN%>" TYPE="Hidden" >	
<!--
<INPUT NAME="tHOB" id="tHOB" size=15 value="<%=wCuentaHOB%>" TYPE="Hidden" >	
<INPUT NAME="tPRO" id="tPRO" size=15 value="<%=wCuentaPRO%>" TYPE="Hidden" >	-->	

<br/>

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>
<td><input name="btnContinuar" type="submit"value="Continuar" /></td>
<td><input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001P003M1.asp?CLA001=<%=wCLA001%>','main');" /></td>
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
