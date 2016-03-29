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


.auto-style3 {
	padding: 10;
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

	function Enviar(){
		if (frmGral.CUENTA.value==''){
			alert('Primero debe Buscar, colocar la cantidad y luego presionar el Boton Agregar');  
			}else{
			frmGral.submit();  
		}
	}
	
	function Enviar2(e){
		key = (document.all) ? e.keyCode : e.which;
		if (key == 13){
			frmGral.submit();  
		}
	}

	
	function Buscar2(e){

		key = (document.all) ? e.keyCode : e.which;
		//alert(key); 
		if (key == 13){
				  		   
			Buscar(); 
			return false

	  	
			//alert(key); 
			//frmGral.submit();  
		}else{
			//window.event.keyCode=0;
		}	
		
	}
	
    function validar(){
    	
			
    
    	

   	 	if ((document.frmGral.LIN.value=='000') && (document.frmGral.PARBUS.value=='')){
  		  // alert("Por favor, indique un criterio de Busqueda..");
  		  // frmGral.PARBUS.focus();  
  		   return false
  		}
		
		
		//alert(document.frmGral.CUENTA.value);
   	 	if (document.frmGral.CUENTA.value==''){
  		   //alert("Por favor, Seleccione Entidad Bancaria.");
  		   //frmGral.ddlP300100BAN.focus();  
  		   Buscar(); 
  		   return false
  		}


		/*
   	 	if (document.frmGral.ddlP300100MFA.value=='0'){
  		   alert("Por favor, Seleccione Mes de Facturación.");
  		   frmGral.ddlP300100MFA.focus();  
  		   return false
  		}
  		
  		
   	 	if (document.frmGral.ddlP300100COP.value=='0'){
  		   alert("Por favor, Califique la Oportunidad.");
  		   frmGral.ddlP300100COP.focus();  
  		   return false
  		}


    	if (document.frmGral.ddlP300100FPA.value=='04'){
  		   alert("Por favor, indique comentario.");
  		   frmGral.txP300100CPE.focus();  
  		   return false
  		}
  		*/
	  		
		   
    }
    
    
</script>
    
</head>



<%


	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wORG = TRIM(Request.QueryString("ORG"))
	wLIN = TRIM(Request.QueryString("LIN"))
	wPAR = TRIM(Request.QueryString("PAR"))
	wPARBUS = TRIM(Request.QueryString("PARBUS"))
	
'RESPONSE.WRITE "LINEA: " & wLIN
'RESPONSE.WRITE "<BR>PARAMETRO: " & wPARBUS
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
	
	
	
%>



<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<form method="post" action="X001P902S.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>" name="frmGral" onsubmit="return validar();" >

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
<legend><strong>Busqueda de Productos Oportunidad</strong></legend>

<table style="width: 95%; " align="center" cellpadding="7" class="auto-style3" >
<tr>
		<td style="width: 38px" class="auto-style1">Linea:</td>
		<td class="auto-style1"> 
		<SELECT name="LIN" style="font-family: Tahoma; font-size: 8pt" size="1" >
					<optgroup label="Lineas">
				<%
														
											
									
									strCnn	= Application("XDTA300_ConnectionString")
									
									IF Session("glMostrarTodasFamilias") = "0" THEN
 										SQL = " SELECT B300123FAM, B300121DEC FROM X300BQ123 " 																		
							 			SQL = SQL & " WHERE "
							 			SQL = SQL & " B300123CCI = '" & trim(Session("glCiaInternet")) & "' AND "
							 			SQL = SQL & " B300123CCL = '" & trim(Session("glUsuario")) & "' "
	 									SQL = SQL & " ORDER BY  B300121DEC "		
									 ELSE
 										SQL = " SELECT B300121NLP, B300121DEC FROM X300BF121 " 																	
 										SQL = SQL & " WHERE "
							 			SQL = SQL & " B300121CCI = '" & trim(Session("glCiaInternet")) & "' "
 										SQL = SQL & " ORDER BY  B300121DEC " 					
									END IF 
									'RESPONSE.WRITE SQL
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									IF wPARCON <> "1" AND Session("glMostrarTodasFamilias") <> "0" THEN
										Response.write "<OPTION value=""000"">TODAS</OPTION>" 										
									END IF
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),25)							
										IF TRIM(wLIN) = wCOD THEN
										    wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										    wSEL = ""
										END IF 
										Response.write "<OPTION value=""" & wCOD & """" & wSEL & ">" & wDES & "</OPTION>" 										
										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
									
					</optgroup> 
					</SELECT>
		</td>
		<td style="width: 39px" class="auto-style1">Parametro:</td>
		<td class="auto-style1" style="width: 198px"> 
		<INPUT NAME="PARBUS" id="PARBUS" size=15 value="<%=wPARBUS%>" TYPE="text" style="width: 208px" onkeypress="javascript:Buscar2(event);" >
		</td>
		<td class="auto-style4">
		<input name="btnBuscar" type="button" onclick="javascript:Buscar();" value="Buscar" style="width: 70px" />
		
		<input name="btnAgregar" type="button" onclick="javascript:Enviar();"  value="Agregar" style="width: 70px" />
		</td>
		
	</tr>

</table>

<table style="width: 95%; " align="center" cellpadding="7" class="auto-style3" >


<%

	IF len(trim(wPARBUS)) > 0 OR len(trim(wLIN)) > 0  then
		
		'''******************CARGAR BUSQUEDA DE PRODUCTOS PROSPECTO*****************************
	
		SQL = " SELECT A300003CPR, A300003DEL, A300003PUA, A300003PIM, A300003CIN " 																	
		SQL = SQL & " FROM X300AF003 WHERE "
		SQL = SQL & " A300003CCI = '" & trim(Session("glCiaInternet")) & "' "
		IF len(trim(wLIN)) > 0 AND wLIN <> "000" THEN		
			SQL = SQL & " AND "
			SQL = SQL & "  A300003NLP = '" & ucase(wLIN) & "'"
		END IF 
		if len(trim(wPARBUS)) > 0 then
			SQL = SQL & " AND "
			SQL = SQL & " (A300003CPR LIKE '%" & ucase(wPARBUS) & "%' OR"
			SQL = SQL & "  A300003REF LIKE '%" & ucase(wPARBUS) & "%' OR "
			SQL = SQL & "  A300003DEL LIKE '%" & ucase(wPARBUS) & "%' OR"
			SQL = SQL & "  A300003MAR LIKE '%" & ucase(wPARBUS) & "%' )"	
		END IF 
		SQL = SQL & " ORDER BY  A300003CPR " 					
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		wColumna = 1
		wCuenta = 0
		DO WHILE NOT rstQuery.EOF 
			wCPR = trim(rstQuery.Fields(0))
			wDEL = trim(rstQuery.Fields(1))
			wPUN = trim(rstQuery.Fields(2))
			wPIM = trim(rstQuery.Fields(3))
			wCIN = trim(rstQuery.Fields(4))
			wCIN = FormatNumber(wCIN,0) 
			
			wOBJ = right(("0000" & wColumna),4)	
			
			wNAMC = "C" & wOBJ
			wNAMD = "D" & wOBJ
			wNAMI = "I" & wOBJ
			wNAMP = "P" & wOBJ		
			wNAMU = "U" & wOBJ		
	
			If wColumna = 1 Then
				%>
				
				<tr>
				<td style="width: 10%;text-align : center">
				<b>Código:</b>
				</td>
				<td style="width: 40%;text-align : left">
				<b>Descripción</b>
				</td>
				<td style="width: 10%;text-align : right">
				<b>Exist.</b>
				</td>
				<td style="width: 20%;text-align : right">
				<b>Pre. Unit.</b>				
				</td>
				<td style="width: 20%;text-align : center">
				<b>Cantidad</b>
				</td> 
				</tr>
				
				<%
			End If  

			%>
			
				<tr>
				<td style="width: 10%;text-align : center">
				<%=wCPR%>
				</td>
				<td style="width: 40%;text-align : left">
				<%=wDEL%>
				</td>
				<td style="width: 10%;text-align : right">
				<%=wCIN%>
				</td>
				<td style="width: 20%;text-align : right">
				<%=FormatNumber(wPUN,2)%>
				</td>
				<td style="width: 20%;text-align : center">
				<input type="text" name="<%=wNAMC%>" id="<%=wNAMC%>" style="width: 25px" onkeypress="Enviar2(event);"  >
				<input type="hidden" name="<%=wNAMI%>" id="<%=wNAMI%>" value="<%=wCPR%>">
				<input type="hidden" name="<%=wNAMD%>" id="<%=wNAMD%>" value="<%=wDEL%>">
				<input type="hidden" name="<%=wNAMU%>" id="<%=wNAMU%>" value="<%=wPUN%>">
				<input type="hidden" name="<%=wNAMP%>" id="<%=wNAMP%>" value="<%=wPIM%>">
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
	
	END IF 
	
		IF wCuenta = 0 THEN
       	%>
       	
       	
				<tr>
				<td style="width: 90%;text-align : center">
				Indique un criterio de Busqueda y Presione el Botón <b>"Buscar"</b>.
				</td>
				</tr>
       	<%
       	
       	END IF

%>
</table>
</td>	
	</tr>



</table>
</fieldset>

<br/>
<INPUT NAME="CUENTA" id="CUENTA" size=15 value="<%=wColumna%>" TYPE="Hidden" >

<table border="0" style="stress: inherit ;table-layout: inherit " align="center">
<tr>
<td><input name="btnRegresar" type="button" value="Regresar" onclick="javascript:window.open('X001P101.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>&PAR=1','main');" /></td>
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

<script type="text/javascript">

function Buscar(){

	if ((document.frmGral.LIN.value=='000') && (document.frmGral.PARBUS.value=='')){
  		alert("Por favor, indique un criterio de Busqueda.");
  	    frmGral.PARBUS.focus();  
  		return false
	}else{
		var url;
		url = 'X001P902.asp?CLA001=<%=wCLA001%>&PAR=1';
		url = url + '&CLA002=<%=wCLA002%>';
		url = url + '&PAR=<%=wPAR%>';
		url = url + '&LIN='+ frmGral.LIN.value;
		url = url + '&PARBUS='+ frmGral.PARBUS.value;    
		window.open(url,'main');
	}

}

</script>

</body>


</html>
