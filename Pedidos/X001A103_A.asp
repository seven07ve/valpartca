<%@ Language=VBScript %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="VBScript">
	DIM wMSG
	SUB cmdSubmit_onClick()
		IF document.frmGral.wCAN.value <> ""  THEN  
			document.frmGral.submit
		 ELSE 		 
		    wMSG = MsgBox("Por favor, Ingrese Cantidad",vbExclamation,"Pedidos") 
		    document.frmGral.wCAN.focus() 
		END IF  
	END SUB

</SCRIPT>

<SCRIPT LANGUAGE="javascript">


function validar() {	
	if (event.keyCode < 45 || event.keyCode > 57) {
		event.returnValue = false
	}
	if  (event.keyCode == 13){
		cmdSubmit_onClick()
	} 	
}


</SCRIPT>


</HEAD>

	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCLA002 = trim(Request.QueryString("CLA002"))
	wCLA003 = trim(Request.QueryString("CLA003"))
	
	wCLABUS = trim(Request.QueryString("CLABUS"))	
	wURLW = Request.ServerVariables("URL")


	wTIT = "Cargar Item de Pedido" 

	wB300100CCI = Session("glCiaInternet")
	wB300100CIA = Session("glCia")


	wA300002NT1 =""
	wA300002LCR =""	
	wProceso = "Agregar"

	wPEDIDO = wCLA001 & " - " & wCLA002


	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT A300002RSO, B300100CCL "
	SQL = SQL & " FROM X300BQ100 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300100CCI ='" & wB300100CCI & "' AND "
	SQL = SQL & " B300100CIA ='" & wB300100CIA & "' AND "
	SQL = SQL & " B300100OPE ='" & wCLA001 & "' AND "
	SQL = SQL & " B300100NPE = " & wCLA002 & " "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN 
		wA300002RSO = trim(rstQuery.Fields("A300002RSO"))
		wB300100CCL = trim(rstQuery.Fields("B300100CCL"))
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	'DATOS DEL PRODUCTO	
	SQL = "SELECT A300003DEL, A300003PUA, A300003CIN, "
	SQL = SQL & " A300003MAR, A300003KPC, A300003PIM, " 
	SQL = SQL & " A300003UCA " 
	SQL = SQL & " FROM X300AF003 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300003CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " A300003CIA ='" & Session("glCia") & "' AND "
	SQL = SQL & " A300003CPR ='" & wCLA003 & "' "
	'response.write sql
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN 
		wA300003DEL = trim(rstQuery.Fields("A300003DEL"))
		wPUA = trim(rstQuery.Fields("A300003PUA"))
		wPUN = wPUA 
		wA300003CIN = trim(rstQuery.Fields("A300003CIN"))
		wA300003MAR = trim(rstQuery.Fields("A300003MAR"))
		wA300003KPC = trim(rstQuery.Fields("A300003KPC"))		
		wPIM = trim(rstQuery.Fields("A300003PIM"))
		wA300003UCA = trim(rstQuery.Fields("A300003UCA"))
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wPRO = wCLA003 & " - " & left(wA300003DEL,40)
	
	wPPP = CDbl(Session("glPPP"))     

    wPUA = wPUA - ((wPUA * wPPP) / 100)
    wC07 = wPIM	    
    wFIV = 1 + (wPIM / 100)
    
    IF wFIV > 1 THEN
        wUIVA = Round(wPUA * wFIV, 2)	        
       ELSE 
        wUIVA = wPUA
    END IF             
    
    wUIVA = formatnumber(wUIVA,2)

	wURL = "X001A103_AS.ASP"
    wURL = wURL & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 
	wURL = wURL & "&CLA003=" & wCLA003 & "&CLA004=" & wA300003DEL
	wURL = wURL & "&CLA005=" & wPUN & "&CLA006=" & wPIM
	wURL = wURL & "&CLA007=" & wA300003KPC & "&CLA008=" & wA300003MAR 
	
	 
	%>
	<body  onload="document.frmGral.wCAN.focus()">
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >

    <table align="center" BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 3px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=3><%= wTIT %></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Pedido:</p></td>
          <td class="TDD" width="80%" height="23px"><p CLASS="P1"><%=wPEDIDO%></P></td>
         </tr>
		 
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Codigo Cliente:</p></td>
          <td class="TDD" width="80%" height="23px"><p CLASS="P1"><%=wB300100CCL%> &nbsp;-&nbsp; <%=wA300002RSO%>

          </P></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Código de Producto:</p></td>
          <td class="TDD" width="80%" height="23px"><p CLASS="P1"><%=wPRO%></p> 
          
          </td>
         </tr>
         
         <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Existencia:</p></td>
          <td class="TDD" width="80%" height="23px"><p CLASS="P1"><%=wA300003CIN%></p> 
          </td>
         </tr>
		
         <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Marca:</p></td>
          <td class="TDD" width="80%" height="23px"><p CLASS="P1"><%=wA300003MAR%></p> 
          </td>
         </tr>
		
         <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Neto + Imp:</p></td>
          <td class="TDD" width="80%" height="23px"><p CLASS="P1"><%=wUIVA%></p> 
          </td>
         </tr>
         
          <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Cantidad:</p></td>
          <td class="TDD" width="80%" height="23px"><INPUT NAME="wCAN" size=2 maxlength=3  value="<%=wA300003UCA%>" onKeypress="validar()">

          </td>
         </tr>
	

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
		  <INPUT TYPE="Hidden" NAME="CLA001" value="<%=wCLA001%>">          
		  <INPUT TYPE="Hidden" NAME="CLA002" value="<%=wCLA002%>">          
          <!--#include file="X001Y005.PRC"-->
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
</FORM>
</BODY>
</HTML>
