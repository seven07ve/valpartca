<% 
'Response.Expires = -1 
'Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"
%>
<!--#include file="X001Z001.INC"-->
<!--#include file="X001Z900.INC"-->
<%

	'wCuenta = clng(TRIM(Request.Form("CUENTA")))	
	wCuenta = 0
	wCLA001 = Request.QueryString("CLA001")	
	wTMFA = 0 
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)		
	
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	wTIT = "INDIQUE EL NRO. RETENCIÓN ASOCIADO A CADA FACTURA"
	wTIT2 = "INDIQUE EL NRO. RETENCIÓN ASOCIADO A CADA NOTA DE CREDITO"

%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<script language="javascript" SRC="jScript.js"></script>



</HEAD>
<body bgcolor="#FFEBD6" leftmargin="18" rightmargin="0" topmargin="0"  >


	<FORM NAME="frmGral" METHOD="post" ACTION="X001A112S.asp?CLA001=<%=wCLA001%>" >

    <div align="center">


       <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center"  height="100%">
<tr>
<td valign="top"  >

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF" valign="top" height="100%"  >


<br>
    
	  <div align="center">
    
	  <%		 

	wIND = 1
	wIND2 = 1
	wCuenta2 = 0
	wColumna  = 1
	wBI1 = 0
	
	wVFA = "N"

    '*********************************************QUERY PARA FACTURAS*********************************************
    SQL = " SELECT C300002NFA, C300002MCO, C300002MNE, C300002PPP, "
	SQL = SQL & " C300002PIM, C300002ARI, C300002FVE, C300002TDO, C300002NCC " 
	SQL = SQL & " FROM X300CF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300002CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " C300002CIA ='" & Session("glCia") & "' AND "
	SQL = SQL & " C300002NDC ='" & wCLA001 & "' AND "
	SQL = SQL & " C300002TDO ='FAC' AND "
	SQL = SQL & " C300002ARI ='S' "
	SQL = SQL & " ORDER BY C300002FAC DESC " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    'response.write sql 
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
		'wMFA = wMFA / (1+(wPIM /100))			
		wPRI = TRIM(rstQuery.Fields("C300002PPP"))		
		wFVE = TRIM(rstQuery.Fields("C300002FVE"))		
		wTDO = TRIM(rstQuery.Fields("C300002TDO"))
		wNCC = TRIM(rstQuery.Fields("C300002NCC"))		
		wNET = wMFA
				
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
			wTNET = wTNET + cdbl(wNET)
			wTMFA = wTMFA + cdbl(wMFA)		
			
			wOBJ = right(("0000" & wIND2),4)
			wNAMF = "F" & wOBJ
			wNAMR = "R" & wOBJ
			
			
			IF wCuenta = 0 THEN			
				Response.write "<table BORDER=""1"" WIDTH=""95%"" bgcolor=""#FFFFFF"" align=""center"" cellpadding=""3"" cellspacing=""0"" bordercolor=""#808080""   >"
				 Response.write "<TR> <td CLASS=""TDT"" colspan=4 height=""30"">" & wTIT & "</td> </TR>"					
				Response.write "<tr>"			
        	  	Response.write "<td width=""25%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>FACTURA</b></p></td>"
        	  	Response.write "<td width=""25%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>VENCIMIENTO</b></p></td>"
        	  	Response.write "<td width=""25%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>BOLIVARES</b></p></td>"
        	  	Response.write "<td width=""25%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>NRO. RETENCIÓN</b></p></td>"
        	  	Response.write "<tr>"
          	END IF 
          	
          	'If wColumna = 1 Then
          		Response.write "<tr>"
          	'End If	
          	
          	Response.write "<td width=""25%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wNFA  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""25%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wFVE  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""25%"" style=""font-size: 10pt; font-family: Tahoma; text-align:right"">&nbsp;"
			Response.write	formatnumber(wMFA,2) 
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""25%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			%>
			
			<input type="text" name="<%=wNAMR%>" id="<%=wNAMR%>" size="16" maxlength="14" onchange="eliminarespacios(this);" onkeypress="return validarletras(event)" style="font-weight: bold"  value="<%=wNCC%>">
			
			<%
	 		Response.write "</td>"

	 			
	 			 	
	 		
	 		'If wColumna = 2 Then
	 			Response.write "</tr>"
	 		'	wColumna = 0	
	 		'End If 
			
		
			'response.write wNFA & "-" & wMFA & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"
			
			
			
			response.write "<INPUT NAME=" & wNAMF & " size=15 value=" & wNFA & " TYPE=Hidden>"	
						
			wColumna  = wColumna  + 1
			wCuenta2 = wCuenta2 + 1
			wIND2 = wIND2 + 1
			
		'End If

		wIND = wIND + 1
	
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	
	IF wARI = "N" THEN
		wPRI = 0
	END IF 
	
	Response.write "<tr>"
  	Response.write "<td width=""20%"" colspan=""2"" height=""25""><p CLASS=""P1"" align=""right""><b>SUB-TOTAL Bs.</b></p></td>"
    Response.write "<td width=""20%"" ><p CLASS=""P1"" align=""Right"">" & formatnumber(wTMFA,2) & "</p></td>"
    Response.write "<td width=""20%"" >&nbsp;</td>"
    Response.write "<tr>"
	
	
	Function fmtNumStr(wMONTO)

		fmtNumStr = Replace(wMONTO, ",", ".") 

	End Function
	
	'wURL = "X001A100_S.asp?NOMTAB=X300BQ100"
	'Response.redirect wURL
	 
	 


%>


<%		 

	wIND = 1
	'wIND2 = 1
	wCuenta = 0
	wCuenta3 = 0
	wColumna  = 1
	wBI1 = 0
	
	 '**********************************************FIN QUERY PARA FACTURAS***********************************************
        
    
    '*******************************************QUERY PARA NOTAS DE CREDITO*********************************************
    
    SQL = " SELECT C300002NFA, C300002MCO, C300002MNE, C300002PPP, "
	SQL = SQL & " C300002PIM, C300002ARI, C300002FVE, C300002TDO, C300002NCC " 
	SQL = SQL & " FROM X300CF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300002CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " C300002CIA ='" & Session("glCia") & "' AND "
	SQL = SQL & " C300002NDC ='" & wCLA001 & "' AND "
	SQL = SQL & " C300002TDO ='NC' AND "
	SQL = SQL & " C300002ARI ='S' "
	SQL = SQL & " ORDER BY C300002FAC DESC " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wColumna  = 1
    'wCuenta2 = 0
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
		wNCC = TRIM(rstQuery.Fields("C300002NCC"))
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
			

			wOBJ = right(("0000" & wIND2),4)
			wNAMF = "F" & wOBJ
			wNAMR = "R" & wOBJ
					
			IF wCuenta3 = 0 THEN
				
			 	Response.write "<TR>"
				Response.write "<td CLASS=""TDT"" colspan=4 height=""30"">" &  wTIT2 & "</td>"
				Response.write "</TR>"	

				Response.write "<tr>"
			
        	  	Response.write "<td width=""25%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>NOTA</b></p></td>"
        	  	Response.write "<td width=""25%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>FECHA</b></p></td>"
        	  	Response.write "<td width=""25%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>BOLIVARES</b></p></td>"
	       	  	Response.write "<td width=""25%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>NRO. RETENCIÓN</b></p></td>"
        	  	
        	  	Response.write "<tr>"
          	END IF 
          	
          	If wColumna = 1 Then
          		Response.write "<tr>"
          	End If	
          	
          	Response.write "<td width=""25%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wNFA  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""25%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wFVE  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""25%"" style=""font-size: 10pt; font-family: Tahoma; text-align:right"">&nbsp;"
			Response.write	formatnumber((wMNC*-1),2) 
	 		Response.write "</td>"
	 			
	 		Response.write "<td width=""25%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			%>
			
			<input type="text" name="<%=wNAMR%>" id="<%=wNAMR%>" size="16" maxlength="14" onchange="eliminarespacios(this);"  onkeypress="return validarletras(event)" style="font-weight: bold" value="<%=wNCC%>" >
			
			<%
	 		Response.write "</td>"
	
	 			 	
	 		
	 		If wColumna = 2 Then
	 			Response.write "</tr>"
	 			wColumna = 0	
	 		End If 
			
		
			'response.write wNFA & "-" & wMNC & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"
			
			wOBJ = right(("0000" & wIND2),4)
			wNAMF = "F" & wOBJ
					
			response.write "<INPUT NAME=" & wNAMF & " size=15 value=" & wNFA & " TYPE=Hidden>"	
						
			wColumna  = wColumna  + 1
			wCuenta2 = wCuenta2 + 1
			wCuenta3 = wCuenta3 + 1
			wIND2 = wIND2 + 1
			
		
		wIND = wIND + 1
		rstQuery.MoveNext 

	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING		
	
	IF wARI = "N" THEN
		wPRI = 0
	END IF 
		
	IF wCuenta3 > 0 THEN
		'wTNET2 = wTNET2*-1
		''wTIVA2 = wTIVA2*-1
		'wTBI12 = wTBI12*-1
		Response.write "<tr>"
  		Response.write "<td width=""20%"" colspan=""2"" height=""25""><p CLASS=""P1"" align=""right""><b>SUB-TOTAL Bs.</b></p></td>"
    		Response.write "<td width=""20%"" ><p CLASS=""P1"" align=""Right"">" & formatnumber((wTMNC*-1),2) & "</p></td>"
    		Response.write "<td width=""20%"" >&nbsp;</td>"
    	Response.write "<tr>"
	END IF 
	
	 

IF wCuenta = 0 AND wCuenta2 = 0 THEN

	wURL = "X001A107.asp?CLA001=" & wCLA001
	Response.redirect wURL

END IF 


%>



		<INPUT TYPE="Hidden" NAME="CUENTA" value="<%=wCuenta2%>">

		
		 <tr>
          <td CLASS="TDT" width="100%" colspan=6 align="center" height=50 valign="middle"  >
          <% IF wCuenta2 > 0 Then %>
          <input type="button" name="Guardar" Value="Guardar" onclick="javascript:enviar()" > 
          <% End If %>
          <input type="button" name="Regresar" Value="Regresar" onclick="javascript:history.back()"> 
         </td>
         </tr>




	</table>
	
	
	</div>
	
	
	<p>&nbsp;
	
	<table width="100%" border="0" cellpadding="5" cellspacing="1"  >
<tr>
<td align="center"  CLASS="TDT" valign="top" height="30" >
<font color="#0000FF">*Recuerde indicar los 14 dígitos del Nro. de Retención para cada documento y presione el botón Guardar, para que 
pueda avanzar a la pantalla de Registrar Pago. </font>
</td></tr> 
</table> 
</td>
</tr> 
<!--
<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>-->
</tr> 
</p> 

</td>

        </tr>
 
        
               </table>

    </td>				
  </tr>
</table>

	</div>
</FORM>


<script language="Javascript">

String.prototype.trim= function() {//Agrega la función trim al objeto String
   return this.replace(/(^\s*)|(\s*$)/g,""); //elimina espacios a izquierda y derecha
}

function eliminarespacios(id) {
	
	var valor = id.value;
	id.value = valor.trim();
	
}

function enviar() {

	/*document.frmGral.Guardar.disabled = true;
	document.frmGral.Regresar.disabled = true;*/
 
	if (confirm("¿Esta deacuerdo con la información suministrada?")){
		//alert(validar());
		if (validar()=='S'){
			document.frmGral.submit(); 
			//alert('ok');
		}else{
			alert('Indique Los 14 digitos del Nro. de Retención');
		}
		
		}else{
		
		//alert(document.frmGral.R0001.value);
		//document.frmGral.Guardar.disabled = false;
		//document.frmGral.Regresar.disabled = false;
	}
}


function validar(){

var ite = 1;
var cnt = '<%=wCuenta2%>';
var obj;
var id;
var valor;
var par = 'S';



	while(ite<=cnt)
	{
	
	obj = fRight(("0000" + ite),4);
	id = 'R'+obj
	

	
	valor = document.getElementById(id).value;	
	
	
	if( Vacio(valor) == false){  
        //alert("Indique el Numero de Retención.");
        document.getElementById(id).focus();  
        ite = cnt
        par = 'N'
        return false            
    }
    
    if (valor.length<14){
    	document.getElementById(id).focus();  
    	//alert('Indique 14 digitos');
        ite = cnt
    	par = 'N'    	
    }
	
	ite++;
	} 
	
	
	return par
}


function validarletras(e){

	
	var nav4 = window.Event ? true : false;

	var key = nav4 ? e.which : e.keyCode;
	
	//alert(key);

	return (key <= 13 || (key >= 48 && key <= 57)); //|| key == 44

}

function validarletras2(){

	//var key=window.event.keyCode;
	key = (document.all) ? e.keyCode : e.which;
	//alert(key);
	//|| key == 46 
	if (key >= 48 && key <= 57 || key == 44){

	}else{
		window.event.keyCode=0;
	}

}


//document.oncontextmenu = function(){return false}
</script>

</BODY>