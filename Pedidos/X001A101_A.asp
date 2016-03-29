<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="javascript">
	
	function ValidarNumero(val){
    
	    var num = val; 
	    num = num.replace(",",".");
	    if (isNaN(num) == true) {
	        return true
		    }else{
	        return false
	    }
	}   
	
	function ValidarCantidad(){
	
		if (document.frmGral.wCAN.value<=0){
	   		alert("Ingrese la Cantidad")
			document.frmGral.wCAN.focus();   	
			document.frmGral.cmdSubmit.enable=false;
			return false
		}else{			
			document.frmGral.cmdSubmit.enable=true;
			return true
		}
	}			
	
	function Vacio(q) {  

	    for ( i = 0; i < q.length; i++ ) {  
	        if ( q.charAt(i) != " " ) {
	        	alert("Debe Ingresar un Valor Numerico");  
	            return true  
	         }  
	    }  
	    return false  
	}



function cmdSubmit_onclick(){
	
	if (document.frmGral.wCAN.value==''){
		alert("Debe Ingresar un Valor Numerico")
		document.frmGral.wCAN.focus();   	
		return false			
	}else{
		if (ValidarNumero(document.frmGral.wCAN.value)){
			alert("Debe Ingresar un Valor Numerico")
			document.frmGral.wCAN.focus();   	
			return false			
		}else{		
		   	document.frmGral.submit();		   
		}
	}	   
}		
	
function Pantalla() {	
	if (screen.width=='1024'){  
	   document.body.leftMargin = "19"  
    }
}


function validar() {	
	if (event.keyCode < 45 || event.keyCode > 57) {
		event.returnValue = false
		}
}


</SCRIPT>

</HEAD>

	<%
	
	wTIT = "Item en Pedido" 
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wCLA003 = REPLACE(TRIM(Request.QueryString("CLA003")),"@", " ")
	wERROR = TRIM(Request.QueryString("ERROR"))
	
	wB300100CCI = Session("glCiaInternet")
	wB300100CIA = Session("glCia")

	wPEDIDO = wCLA002
	
	wA300002NT1 =""
	wA300002LCR =""	
	wProceso = "Agregar"
	wDisabled = ""	
    IF len(wCLA003) > 0 then	 

		wDisabled = "DISABLED"
		
		wProceso = "Actualizar"
		
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT B300101UVE, B300101PUN, A300003DEL, "
		SQL = SQL & " A300003MAR, B300101PIM " 		
		SQL = SQL & " FROM X300BQ101 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300101CCI ='" & wB300100CCI & "' AND "
		SQL = SQL & " B300101CIA ='" & wB300100CIA & "' AND "
		SQL = SQL & " B300101OPE ='" & wCLA001 & "' AND "
		SQL = SQL & " B300101NPE ='" & wCLA002 & "' AND "
		SQL = SQL & " B300101CPR ='" & wCLA003 & "' "	
		wB300101CPR = wCLA003
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		'RESPONSE.WRITE SQL
		IF NOT rstQuery.EOF THEN
			wA300003DEL = LEFT(trim(rstQuery.Fields("A300003DEL")),40)
			wB300101UVE = trim(rstQuery.Fields("B300101UVE"))
			wB300101PUN = trim(rstQuery.Fields("B300101PUN"))			
			wA300003MAR = trim(rstQuery.Fields("A300003MAR"))
			wB300101PIM = trim(rstQuery.Fields("B300101PIM"))			
		END IF 
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		wESC = "A"
		
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

		'BUSCA ESCALA DE PRECIO POR CLIENTE
		SQL = "SELECT A300002ESC FROM X300AF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300002CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " A300002CCL = '" & wB300100CCL & "'"
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wESC = trim(rstQuery.Fields("A300002ESC"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing
	

		Session("glEscalaPrecio") = wESC

		
		wPRO = wCLA003 & " - " & wA300003DEL
		
		wPPP = CDbl(Session("glPPP"))     
	    wB300101PUN = wB300101PUN - ((wB300101PUN * wPPP) / 100)	    
	    wFIV = 1 + (wB300101PIM / 100)	    
	    IF wFIV > 1 THEN
	        wUIVA = Round(wB300101PUN * wFIV, 2)	        
	       ELSE 
	        wUIVA = wB300101PUN
        END IF 
        
    END IF 
	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001A101_AS.ASP"
	wURL = wURL & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 
	wURL = wURL & "&CLA003=" & wCLA003 
	%>

	<body   align="center" style="text-align: center" topmargin="0" leftmargin="19" rightmargin="0" onload="document.frmGral.wCAN.focus()" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">
	
	
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >


   <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">




    <p style="margin-top: 0px">&nbsp;</p>

    <table align="center" BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="4" >
		 <TR>
		 <td CLASS="TDT" colspan=3 height="30" ><%= wTIT %></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="29%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Pedido:</p></td>
          <td class="TDD" width="67%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wPEDIDO%></P></td>
         </tr>
		 
		 <tr>
          <td class="TDS" width="29%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Código de Producto:</p></td>
          <td class="TDD" width="67%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wPRO%></p> 
          
          </td>
         </tr>        
		
         <tr>
          <td class="TDS" width="29%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Marca:</p></td>
          <td class="TDD" width="67%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wA300003MAR%></p> 
          </td>
         </tr>

         <tr>
          <td class="TDS" width="29%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Impuesto:</p></td>
          <td class="TDD" width="67%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wB300101PIM%>%</p> 
          </td>
         </tr>
		
         <tr>
          <td class="TDS" width="29%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Precio Unitario Neto + Imp:</p></td>
          <td class="TDD" width="67%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wUIVA%></p> 
          </td>
         </tr>
         
          <tr>
          <td class="TDS" width="29%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Cantidad:</p></td>
          <td class="TDD" width="67%" height="23px">
			<p style="margin-top: 0"><INPUT NAME="wCAN" size=2 maxlength=3  value="<%=wB300101UVE%>" onKeypress="validar()" onblur="return ValidarCantidad();" >
			<font color="#FF0000"><b><%= wERROR%></b></font>
          </td>
         </tr>
	

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
      <!--#include file="X001Y005.PRC"-->
                </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>

	<p>&nbsp;</td>
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

   
   </FORM>


</BODY>
</HTML>