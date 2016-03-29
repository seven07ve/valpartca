<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Z001.INC"-->
</HEAD>


<%


	'Preparar Etiqueta Body del Formulario
	wCLA001 = TRIM(Request.Form("PAR"))
	wCLA002 = TRIM(Request.QueryString("CLA001"))
	wCLA003 = TRIM(Request.QueryString("CLA002"))
	wSTSPED = TRIM(Request.QueryString("STSPED"))

	wURLD = "X001A116_A.ASP" 
	wURLD = wURLD & "?CLA001=" & wCLA002
	wURLD = wURLD & "&CLA002=" & wCLA003
	wURLD = wURLD & "&STSPED=" & wSTSPED
	wURLD = wURLD & "&CLA004=" 
	
	wURLF = "?CLA001=" & wCLA002
	wURLF = wURLF & "&CLA002=" & wCLA003
	wURLF = wURLF & "&STSPED=" & wSTSPED

	wTIT = "Productos" 
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 


%>


    <body scroll=auto topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" onload="document.FrmBuscar.PAR.focus();">
       
    
    
    <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >



<table width="919" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" >
<tr>
<td bgcolor="#FFFFFF">
<p align=center>&nbsp;
    <form name="FrmBuscar" method="post" action="X001Z203.asp<%=wURLF%>"  >
    <p align="left">
    <table align="center" BORDER="0" cellspacing="0" cellpadding="0" style="width: 671px"  >
    <tr><td >
    <input type="text" name="PAR" value="<%=wCLA001%>" size="31">  
    
    <input type="submit" value="Buscar "   >
    <b><font size="2" face="Tahoma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Indique un 
	criterio para la búsqueda de Productos.</font></b></td></tr>
    </table> 
    </p>
    <p>
    
    
    
  
	  

<%
		
		
    
	strCnn	= Application("XDTA300_ConnectionString")

	SQL = "SELECT A300003CPR, A300003DEL FROM X300AF003 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300003CCI = '" & wCCI & "' AND "
	SQL = SQL & " A300003CIA = '" & wCIA & "' "
	if len(trim(wCLA001)) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " ((A300003CPR LIKE '%" & ucase(wCLA001) & "%') OR  "
		SQL = SQL & "  (A300003DEL LIKE '%" & ucase(wCLA001) & "%'))  "
	end if	
		

   'Response.Write sql
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0
	wTC03 = 0 
	wTC04 = 0
	wTC05 = 0
	wC= CHR(34)


	wC01 = ""
	wCuenta = 0
	DO WHILE NOT rstQuery.EOF and len(trim(wCLA001)) > 0 
		
		IF wCuenta = 0 Then
			
			Response.Write "<table align=""center"" BORDER=""1"" WIDTH=""650"" cellspacing=""0"" cellpadding=""0""  bordercolor=""#ffffff"" bgcolor=" & Request.Cookies("CAR")("Color2") & " style=""border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px"">"
			Response.Write "<TR><td>"	   		
			Response.Write "<table BORDER=""0"" WIDTH=""100%"" cellpadding=""4"">"
	
		 	Response.Write "<TR><td CLASS=""TDT"" colspan=""3"">" &  wTIT & "</td></TR>"	
		 	Response.Write "<tr><td class=""TDS"" width=""20%"" ><p CLASS=""P1"" align=""center"">Codigo</p></td>"
         	Response.Write "<td class=""TDS"" width=""80%""><p CLASS=""P1"" align=""left"">Descripción</p></td></tr>"
         	
		End if 
		
		If wC01 <> trim(rstQuery.Fields(0)) Then

			wC01 = trim(rstQuery.Fields(0))
			wC02 = trim(rstQuery.Fields(1))		
			wURL = wURLD & wC01
			wTIURL = "<A href=" & wURL & " target=""main""> "
			wTFURL = " </A>"

			Response.Write "<tr>"
			'Response.Write "<td CLASS=" & wC & "TDD" & wC & " width=" & wC & "20%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
	        Response.Write "<td class=" & wC & "TDD" & wC & " width=" & wC & "20%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</p></td>"
	        Response.Write "<td class=" & wC & "TDD" & wC & " width=" & wC & "80%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=left>" & wC02 & "</p></td>"
			Response.Write "</tr>"
			wCuenta = wCuenta + 1
		
		End if

		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	


	IF wCuenta > 0 Then
		
		Response.write "</table></td></TR></table>"
	
	End if 

		
	wURL = "X001A115_S.ASP"	  	
	wURL = wURL & "?CLA001=" & wCLA002
	wURL = wURL & "&CLA002=" & wCLA003
	wURL = wURL & "&STSPED=" & wSTSPED


	%>



	</form> 
	</p> 
	</td>
        </tr>
                
        
<tr>
<td bgcolor="#FFFFFF">


<p align=center>&nbsp;<p align=center>&nbsp;<p align=center>
<INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:window.open("<%=wURL%>","main");'>
<p>

	</td>
        </tr>

<!--        
<tr>
<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>-->

</td>
        </tr>
        
        
        
        
               </table>

	
</BODY>
<script language="javascript"  >

	

</script>
</HTML>

