<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Y004.PRC"-->
<!--#include file="X001Z001.INC"-->
<SCRIPT LANGUAGE="javascript">
	
	
function Pantalla() {	
	if (screen.width=='1024'){  
	   document.body.leftMargin = "19"  
    }
}


</SCRIPT>

</HEAD>

	<%
	
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	
	wB300200CCI = Session("glCiaInternet")
	wB300200CIA = Session("glCia")

	
	
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT B300200CCL, A300002RSO, B300200FPR, B300200BUL, "
	SQL = SQL & " B300200NPE, B300200MNE, B300200BIV, B300200MTO, " 		
	SQL = SQL & " B300200FDE, B300200GDE, B300200NTR, B300200FRC, " 
	SQL = SQL & " B300200OPE, B300200OCO, B300200CON, B300200PRE " 		
	SQL = SQL & " FROM X300BQ200 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300200CCI ='" & wB300200CCI & "' AND "
	SQL = SQL & " B300200CIA ='" & wB300200CIA & "' AND "
	SQL = SQL & " B300200NFA ='" & wCLA001 & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	IF NOT rstQuery.EOF THEN
		wCCL = trim(rstQuery.Fields("B300200CCL"))
		wRSO = trim(rstQuery.Fields("A300002RSO"))
		wFPR = cdate(rstQuery.Fields("B300200FPR"))			
		wBUL = trim(rstQuery.Fields("B300200BUL"))
		wNPE = trim(rstQuery.Fields("B300200NPE"))			
		wMNE = trim(rstQuery.Fields("B300200MNE"))
		wBIV = trim(rstQuery.Fields("B300200BIV"))			
		wMTO = trim(rstQuery.Fields("B300200MTO"))			
		wFDE = cdate(rstQuery.Fields("B300200FDE"))
		wGDE = trim(rstQuery.Fields("B300200GDE"))			
		wNTR = trim(rstQuery.Fields("B300200NTR"))
		wFRC = cdate(rstQuery.Fields("B300200FRC"))
		wOPE = trim(rstQuery.Fields("B300200OPE"))	
		wPRE = trim(rstQuery.Fields("B300200PRE"))	
		wCON = trim(rstQuery.Fields("B300200CON"))
		wCSE = trim(rstQuery.Fields("B300200OCO"))
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	SQL = "SELECT A300020NOM "
	SQL = SQL & " FROM X300AF020 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300020CVE ='" & wOPE & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	IF NOT rstQuery.EOF THEN
		wNOM = trim(rstQuery.Fields("A300020NOM"))
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wCCL = wCCL & " - " & wRSO
	wOPE = wOPE & " - " & wNOM
	
	wMNE = FormatNumber(wMNE,2)
	wBIV = FormatNumber(wBIV,2)
	wMTO = FormatNumber(wMTO,2)
	
	IF wFRC < wFPR Then    
    	wFRC = "No disponible"
    	wSTS = "<font color=""black""><b>En Transito</b></font>"
      Else
	    wFRC = Right("00" & day(wFRC),2) & "-" & Right("00" & month(wFRC),2) & "-" & year(wFRC)
	    wSTS = "<font color=""Green""><b>Recibido</b></font>"
    End If 
    
	wFPR = Right("00" & day(wFPR),2) & "-" & Right("00" & month(wFPR),2) & "-" & year(wFPR)
    wFDE = Right("00" & day(wFDE),2) & "-" & Right("00" & month(wFDE),2) & "-" & year(wFDE)
    
    
    
	
	wTIT = "Datos de Factura" 
	
	
	%>

	<body   align="center" style="text-align: center" topmargin="0" leftmargin="19" rightmargin="0"  bgcolor="#FFEBD6">
	
	



   <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center"  >
<tr>
<td>

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">




    <p style="margin-top: 2px; margin-bottom: 2px">&nbsp;</p>

    <table align="center" BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="4" >
		 <TR>
		 <td CLASS="TDT" colspan=3><%= wTIT %></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Nro. de Factura:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wCLA001%></P></td>
         </tr>
		 
		 <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Cliente:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wCCL%></p> 
          
          </td>
         </tr>        
         
         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Vendedor:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wOPE%></p> 
          
          </td>
         </tr>        
		
         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Fecha de Emisión:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wFPR%></p> 
          </td>
         </tr>

         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Bultos:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wBUL%></p> 
          </td>
         </tr>


         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Nro. Pre-Despacho:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wPRE & " - " & wCON%></p> 
          </td>
         </tr>
		
         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Nro. Pre-Factura:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wNPE%></p> 
          </td>
         </tr>
         

         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Monto Neto:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wMNE%></p> 
          </td>
         </tr>


         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Iva:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wBIV%></p> 
          </td>
         </tr>
	
	         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Monto Total:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wMTO%></p> 
          </td>
         </tr>


         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Correlativo Seniat:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wCSE%></p> 
          </td>
         </tr>
         
         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Guia de Despacho:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wGDE%></p> 
          </td>
         </tr>
         
         
            <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Fecha de Despacho:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wFDE%></p> 
          </td>
         </tr>


         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Transportista:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wNTR%></p> 
          </td>
         </tr>


		<tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Estatus:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wSTS%></p> 
          </td>
         </tr>
         
         <tr>
          <td class="TDS" width="26%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Fecha de Recibido:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wFRC%></p> 
          </td>
         </tr>



		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
			<input type="button" onclick="history.back()" value="Regresar">      
                </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>

	<p>&nbsp;</td>
	</tr>
	
	<!--<td>
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