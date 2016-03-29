<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<title>Agregar Varios Item</title>

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<script language="javascript" SRC="jScript.js"></script>

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Z002.INC"-->

</HEAD>


<script language="JavaScript" >


function Inicio(){

	document.frmGral.C0001.focus();	

}

function Enviar(){

	if (validar()=='S'){
		//alert('ok');
		document.frmGral.submit();	
	}else{
		alert("Seleccione el Motivo.");
	}
}

function validar2(){
	
	if (validar()=='S'){
		return true
	}else{
		alert("Seleccione el Motivo.");
		return false
		
	}

}

function clickButton(objeto){ 

var tab = event.keyCode == 9;

	if (event.keyCode == 13){ 

		//window.document.getElementById(objeto).click();
		//alert(objeto.tabIndex);
		//document.forms[0].elements[index].focus();
		//document.frmGral.elements[objeto.tabIndex].focus();
	 

	}
}

var width=window.screen.width, height=window.screen.height;	
	
//Verifica Resolusion de Pantalla
if ((width=='800') && (height=='600')){
	document.write('<body  topmargin="0"  rightmargin="0" vlink="#0000FF" leftmargin="0" bgcolor="#FFEBD6">') 
}else{
    document.write('<body  topmargin="0"  rightmargin="0" vlink="#0000FF" leftmargin="17" bgcolor="#FFEBD6">') 
}



</SCRIPT>



	<table align="center"  BORDER="1" bordercolor="#0066CC" bgcolor="#FE9900" width="919"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px; ">


<%


		wCLA001 = Request.QueryString("CLA001")
		wCLA002 = Request.QueryString("CLA002")
		wCLA003 = Request.QueryString("CLA003")
		wCLA004 = trim(Request.QueryString("CLA004"))
		wCLA005 = Request.QueryString("CLA005")
		wCLA006 = Request.QueryString("CLA006")
		wSTSPED = Request.QueryString("STSPED")
		'response.write "STS: <br>" & wSTSPED
		
		IF wCLA005 = "000" THEN : wCLA005 = "" : END IF
		
		wURLA = "X001Z101S.ASP" & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002
		wURLA = wURLA & "&STSPED=" & wSTSPED

		wBUSCAR = TRIM(Request.Form("BUSCAR"))
		wTITULO = TRIM(Request.Form("TITULO"))


		wTITULO = "Agregar Producto al Reclamo"

		

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
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLA%>" target="main" onsubmit="return validar2()">
	  <!--<TR>
	  <td  CLASS='TDT' colspan=6 bgcolor="white" >
		<p style="margin-top: 3px; margin-bottom: 3px"><b><font size="2">&nbsp;</font></b></td>		  
	  </TR>-->	
	  

	<%



	strCnn	= Application("XDTA300_ConnectionString")
	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
	
	SQL = "SELECT E300001CTR, E300001NFA "
	SQL = SQL & " FROM X300EF001 "
	SQL = SQL & " WHERE "
	SQL = SQL & " E300001COD ='" & wCLA002 & "'"
    Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn									
    if NOT rstQuery.EOF then
		wCTR = trim(rstQuery.Fields("E300001CTR"))
		wNFA = trim(rstQuery.Fields("E300001NFA"))
	end if
    rstQuery.CLOSE
    SET rstQuery = NOTHING
    
	Session("glPalabra01") = ""
	Session("glPalabra02") = ""
	Session("glPalabra03") = ""
	Session("glPalabra04") = ""

	Cargar_Palabras_Filtrado(wCLA004)
	
	'Response.write wCLA004
	'RESPONSE.END
	
	SQL = "SELECT B300201NFA, B300201CPR, B300201DEL, B300201UDE, B300201UDE, B300200FPR, "
	SQL = SQL & " B300200NPE, B300200PRE, B300200CON, B300200PUS, B300200BUL, B300201NRB, "
	SQL = SQL & " B300201NPE " 
	SQL = SQL & " FROM X300BF201, X300BF200 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300201CCI ='" & wCCI & "' AND "
	SQL = SQL & " B300201CIA ='" & wCIA & "' AND "
	SQL = SQL & " B300200CCL ='" & wCLA001 & "' AND "
	SQL = SQL & " B300201NFA = B300200NFA "
	IF wCTR = "2" THEN
		SQL = SQL & " AND B300201NFA = '" & wCLA003 & "' "
	END IF
	
	if len(trim(wCLA004)) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " (( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " B300201DEL LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND B300201DEL LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND B300201DEL LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND B300201DEL LIKE '%" & Session("glPalabra04") & "%' "
        End If
        SQL = SQL & " ) OR ( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " B300201NFA LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND B300201NFA LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND B300201NFA LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND B300201NFA LIKE '%" & Session("glPalabra04") & "%' "
        End If
        SQL = SQL & " ) OR ( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " B300200NPE LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND B300200NPE LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND B300200NPE LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND B300200NPE LIKE '%" & Session("glPalabra04") & "%' "
        End If
        SQL = SQL & " ) OR ( "
        If Len(Trim(Session("glPalabra01"))) > 0 Then
        	SQL = SQL & " B300201CPR LIKE '%" & Session("glPalabra01") & "%' "
        End If
        If Len(Trim(Session("glPalabra02"))) > 0 Then
        	SQL = SQL & " AND B300201CPR LIKE '%" & Session("glPalabra02") & "%' "
        End If
        If Len(Trim(Session("glPalabra03"))) > 0 Then
        	SQL = SQL & " AND B300201CPR LIKE '%" & Session("glPalabra03") & "%' "
        End If
        If Len(Trim(Session("glPalabra04"))) > 0 Then
        	SQL = SQL & " AND B300201CPR LIKE '%" & Session("glPalabra04") & "%' "
        End If
        SQL = SQL & " )) "
	end if	

	SQL = SQL & " ORDER BY B300201NFA, B300201CPR " 
	

	'response.write sql
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql, strCnn
    wCuenta = 1
    wCuenta2 = 0
    wColumna  = 1 
	'wCLASS = "TDD"
	'response.write sql
	wNLP1 = "00"
	wCLASS2 = "TDD2"
	DO WHILE NOT rstQuery.EOF 
	
	 IF wCuenta = "1" Then 
		 wCLASS = "TDD"
	 End If 
	
		wCPR = trim(rstQuery.Fields("B300201CPR"))
		
		wDEL = left(trim(rstQuery.Fields("B300201DEL")),34)		
		wOBJ = right(("0000" & wCuenta),4)		
		wUDE = trim(rstQuery.Fields("B300201UDE"))
		wPUS = trim(rstQuery.Fields("B300200PUS"))
		wBUL = trim(rstQuery.Fields("B300200BUL"))
		wNPF = trim(rstQuery.Fields("B300200NPE"))
		wPRE = trim(rstQuery.Fields("B300200PRE"))
		wCON = trim(rstQuery.Fields("B300200CON"))
		wNRB = trim(rstQuery.Fields("B300201NRB"))
		wNPE = trim(rstQuery.Fields("B300201NPE"))
	
		IF wNFA <> trim(rstQuery.Fields("B300201NFA")) THEN
				
				wFPR = Right("00" & day(trim(rstQuery.Fields("B300200FPR"))),2)	& "-" & Right("00" & month(trim(rstQuery.Fields("B300200FPR"))),2) & "-" & year(trim(rstQuery.Fields("B300200FPR")))
								
				wTIT = "Factura " &  trim(rstQuery.Fields("B300201NFA")) & " del " & wFPR 
				wTIT = wTIT & "<br>Predespacho: " & wPRE & "-" & wCON & " Prefactura: " & wNPF
				wTIT = wTIT & "<br>Total Bultos: " & wBUL & " Preparado por: " & wPUS
				Mostrar_Sub_Titulo
			
				wNFA = trim(rstQuery.Fields("B300201NFA"))	
			
		
		END IF  

		
		SQL = " SELECT E300002CAN, E300002TRE, E300002AFP "
	    SQL = SQL & " FROM X300EF002 WHERE "
	    SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
	    SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
	    SQL = SQL & " E300002NFA ='" & wNFA & "' AND "
	    SQL = SQL & " E300002COD ='" & wCLA002 & "' AND "		
	    SQL = SQL & " E300002CPR ='" & wCPR & "' "		
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
	    IF NOT rstQuery2.EOF THEN
		   wCAN = trim(rstQuery2.Fields("E300002CAN"))
		   wTRE = trim(rstQuery2.Fields("E300002TRE"))
		   wAFP = trim(rstQuery2.Fields("E300002AFP"))
		 ELSE
		   wCAN = ""
		   wTRE = ""
		END IF 
		rstQuery2.CLOSE
     	SET rstQuery2 = NOTHING	
     	
     	
	    wSEL01 = "": wSEL02 = "": wSEL03 = "": wSEL04 = "": wSEL05 = "": wSEL06 = "": wSEL07 = ""
	    wSEL01_2 = "": wSEL02_2 = ""
	    
     	IF wTRE = "Defecto de Parte" THEN
     		wSEL01 = " selected"
     	END IF 
     	IF wTRE = "Backorders" THEN
     		wSEL02 = " selected"
     	END IF 
     	IF wTRE = "Error del Vendedor" THEN
     		wSEL03 = " selected"
     	END IF 
     	IF wTRE = "Precio" THEN
     		wSEL04 = " selected"
     	END IF 
     	IF wTRE = "Faltante" THEN
     		wSEL05 = " selected"
     	END IF 
     	IF wTRE = "Sobrante" THEN
     		wSEL06 = " selected"
     	END IF      	
     	IF wTRE = "Faltante y Sobrante" THEN
     		wSEL07 = " selected"
     	END IF 
     	IF wTRE = "No Aplica" THEN
     		wSEL08 = " selected"
     	END IF 
     	IF wTRE = "Error del Cliente" THEN
     		wSEL09 = " selected"
     	END IF 
     	IF wTRE = "Error en Ventas" THEN
     		wSEL10 = " selected"
     	END IF 


		IF wAFP = "N" THEN
     		wSEL01_2 = " selected"
     		Else
     		wSEL02_2 = " selected"
     	END IF 


	
    	
		wNAMC = "C" & wOBJ
		wNAMI = "I" & wOBJ
		wNAMF = "F" & wOBJ		
		wNAMU = "U" & wOBJ		
		wNAMM = "M" & wOBJ
		wNAMD = "D" & wOBJ	
		wNAMP = "P" & wOBJ		
		
		wC01 = wCPR & " - " & wDel & " - P. Neto + IVA: " & wC09	

		
		'if wColumna = 1 then
			%><TR><%
		'END IF  
			%>
			<td CLASS="<%=wCLASS%>" width="20%" aLIGN="left"><font face="Tahoma" style="font-family: Tahoma; font-size:10pt"><%= wCPR %></td>
			<td CLASS="<%=wCLASS%>" width="35%" ALIGN="left"><%= wDEL %>
			<br>
			<table border="0" width="100%" cellpadding="0" cellspacing="0"   ><tr>
			<td CLASS="<%=wCLASS%>" width="50%"><b>Pedido:</b> <%= wNPE %></td> 
			<td CLASS="<%=wCLASS%>" width="50%"><b>Embalado en Bulto:</b> <%= wNRB %></td> 			
			</tr> 
			</table> 
			</td>
			<td CLASS="<%=wCLASS%>" width="10%" ALIGN="right"><%= wUDE %></td>
			<td CLASS="<%=wCLASS%>" width="15%" ALIGN="left">
			<SELECT name="<%=wNAMM%>" id="<%=wNAMM%>" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:100%" size="1" > 
			    <OPTION value="0" >Seleccione...</OPTION> 					
				<%IF wCTR = "2" THEN%>
				<OPTION value="Defecto de Parte" <%=wSEL01%>>Defecto de Parte</OPTION> 					
				<OPTION value="Backorders" <%=wSEL02%>>Backorders</OPTION> 					
				<OPTION value="Error del Vendedor" <%=wSEL03%>>Error del Vendedor</OPTION> 					
				<OPTION value="Precio" <%=wSEL04%>>Precio</OPTION> 									
				<OPTION value="Error del Cliente" <%=wSEL09%>>Error del Cliente</OPTION> 					
				<OPTION value="Error en Ventas" <%=wSEL10%>>Error en Ventas</OPTION> 	
				
				<%ELSE%>				
				<OPTION value="Faltante" <%=wSEL05%>>Faltante</OPTION> 					
				<OPTION value="Sobrante" <%=wSEL06%>>Sobrante</OPTION> 					
				<OPTION value="Faltante y Sobrante" <%=wSEL07%>>Faltante y Sobrante</OPTION> 					
				<%END IF%>
			</SELECT> 

			</td>
			<td CLASS="<%=wCLASS%>" width="10%" ALIGN="left">
			<SELECT name="<%=wNAMP%>" id="<%=wNAMP%>" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:100%" size="1" > 
			<OPTION value="N" <%=wSEL01_2%>>NO</OPTION> 					
			<OPTION value="S" <%=wSEL02_2%>>SI</OPTION> 					
			</SELECT> 
			
			</td> 
		
			<td CLASS="<%=wCLASS%>" width="10%" ALIGN="center">			
			<INPUT NAME="<%=wNAMC%>" id="<%=wNAMC%>" size=2  value="<%=wCAN%>" style="height: 17; font-family:Tahoma; font-size:8pt" tabindex="<%=wCuenta%>"  onkeypress="clickButton(this)" >	
		
			<INPUT NAME="<%=wNAMF%>" id="<%=wNAMF%>" size=15 value="<%=wNFA%>" TYPE="Hidden" >	
			<INPUT NAME="<%=wNAMI%>" id="<%=wNAMI%>" size=15 value="<%=wCPR%>" TYPE="Hidden" >	
			<INPUT NAME="<%=wNAMD%>" id="<%=wNAMD%>" size=15 value="<%=wDEL%>" TYPE="Hidden" >	
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
		wCuenta2 = wCuenta2 + 1		
		
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wCLASS = "TDS1"
	
	SUB Mostrar_Sub_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=6 height=30 >" & wTIT  
		Response.Write "</td> "
		Response.Write "</tr>"


	END SUB




wURL = "X001A115_S.ASP?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 

IF wCuenta > "1" THEN %>
	  <TR>
	  <td CLASS="TDT" colspan=6>
	<INPUT TYPE="Hidden" NAME="CUENTA" value="<%=wCuenta%>">          
	<!--<INPUT TYPE="submit" NAME="send" VALUE="Agregar" tabindex="2" style="font-family: Tahoma; font-size: 10pt">-->
	<INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick="window.open('<%=wURL%>','main');" style="font-family: Tahoma; font-size: 10pt">
	  
	  </td>		  
	  </TR>	
<% END IF %>



 
</FORM>

</table>
</body>

<%


IF wCUENTA > "1" THEN
	Response.write "<script event=onload for=window language=JavaScript>"
		Response.write "Inicio()"
	Response.write "</script>"
  ELSE %>
    <p ALIGN="CENTER" style="font-family: Tahoma; font-size: 14px; color:black; margin-top:15px"><b>
	<font size="2" color="#000000">Disculpe, no existe Información con esos Parámetros</font></b><font size="2"><br>
	</font><br>
	<INPUT type="button" value="Volver" onclick="window.open('<%=wURL%>','main');" style="font-family: Tahoma; font-size: 10pt"></p>


 	   <%	  
END IF 
IF Session("glMostrarExistencia") = "1" THEN
   wColspan = "5"
  Else
   wColspan = "4"
END IF 

%>


<script language="JavaScript">
<!--



function validar(){

var ite = 1;
var cnt = '<%=wCuenta2%>';
var obj;
var id;
var id2;
var valor;
var valor2;
var par = 'S';


//alert('<%=wCuenta2%>');
	while(ite<=cnt)
	{
	
	obj = fRight(("0000" + ite),4);
	id = 'M'+obj;
	id2 = 'C'+obj;
	

	valor = document.getElementById(id).value;	
	valor2 = document.getElementById(id2).value;	
	
	
	if(valor=='0' && valor2 > 0){  
        //alert("Seleccione el Motivo.");
        document.getElementById(id).focus();  
        ite = cnt
        par = 'N'
        return false            
    }
    
    /*if (valor.length<14){
    	document.getElementById(id).focus();  
    	//alert('Indique 14 digitos');
        ite = cnt
    	par = 'N'    	
    }*/
	
	ite++;
	} 
	
	
	return par
}


//var text="<table width='105' border='0' cellpadding='0' cellspacing='0' bordercolor='white'><tr><td><font size='1' face='Arial, Helvetica, sans-serif'>&nbsp;<strong><INPUT TYPE='button' NAME='send' onclick='Javascript:document.frmGral.submit();' VALUE='Agregar o Actualizar' tabindex='2' style='font-family: Tahoma; font-size: 10pt'></strong></font></td></tr></table>"
var text="<table align='center'  BORDER='1' bordercolor='#0066CC' bgcolor='#FE9900' WIDTH='782'  style='padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px;'><TR><td CLASS='TDT' colspan=<%=wColspan%> ><p style='margin-top: 3px; margin-bottom: 3px'><b><font size='2'><%= wTITULO %></font></b></td><td CLASS='TDT' colspan=2><INPUT TYPE='button' NAME='send' onclick='Javascript:document.frmGral.submit();' VALUE='Agregar' tabindex='2' style='font-family: Tahoma; font-size: 10pt;'></td> </TR> <TR><td CLASS='<%=wCLASS%>' width='12%' aLIGN='left'><b> Nro. de Parte</b></td><td CLASS='<%=wCLASS%>' width='15%' aLIGN='left'><b>Homologo</b></td><td CLASS='<%=wCLASS%>' width='40%' ALIGN='left'><b> Descripción</b></td><td CLASS='<%=wCLASS%>' width='10%' ALIGN='left'><b> Marca</b></td><td CLASS='<%=wCLASS%>' width='10%' ALIGN='Right'><b> Precio Bs. </b></td><% IF Session("glMostrarExistencia") = "1" THEN %><td CLASS='<%=wCLASS%>' width='6%' ALIGN='center'><b>Exist.</b></td><% END IF %><td CLASS='<%=wCLASS%>' width='6%' ALIGN='center'><b>Cant.</b></td></TR></table>"
 
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