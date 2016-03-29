<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Z001.INC"-->
</HEAD>


<%


	'Preparar Etiqueta Body del Formulario
	'wCLA001 = Request.QueryString("CLA001")
	wPAR = Request.QueryString("PAR")
	wCLA001 = TRIM(Request.Form("PAR"))
	wCLA002 = Request.QueryString("CLA002")	
	wCLA003 = Request.QueryString("CLA003")	
	 

	wTIT = "Clientes" 
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
    <form name="FrmBuscar" method="post" action="X001Z202.asp?PAR=<%=wPAR%>"  >
    <p align="left">
    <table align="center" BORDER="0" WIDTH="650" cellspacing="0" cellpadding="0"  >
    <tr><td >
    <input type="text" name="PAR" value="<%=wCLA001%>" size="31">  
    
    <input type="submit" value="Buscar "   >
    <b><font size="2" face="Tahoma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *Indique un 
		criterio para la búsqueda de clientes.</font></b></td></tr>
    </table> 
    </p>
    <p>
    
    
    
  
	  

<%
		
		
    
	strCnn	= Application("XDTA300_ConnectionString")

	SQL = "SELECT A300002CCL, A300002RSO FROM X300AQ002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300002CCI = '" & wCCI & "' AND "
	SQL = SQL & " A300002CIA = '" & wCIA & "' AND "
	SQL = SQL & " A300002NIC = 'D001' "
	if Session("glTipoUsuario") = "C" then
		SQL = SQL & " AND "
		SQL = SQL & " A300002CCL = '" & Session("glUsuario") & "' "
	end if
	if Session("glTipoUsuario") = "V" then
		SQL = SQL & "  AND "
		SQL = SQL & " A300002CVE = '" & Session("glCodVendedor") & "' "
	end if
    if Session("glTipoUsuario") = "U" then
		SQL = SQL & "  AND "
		SQL = SQL & "  Z300006PSU = '" & Session("glUsuario") & "' "		
	end if 

	if len(trim(wCLA001)) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " ((A300002CCL LIKE '%" & ucase(wCLA001) & "%') OR  "
		SQL = SQL & "  (A300002RSO LIKE '%" & ucase(wCLA001) & "%'))  "
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
			
			Response.Write "<table align=""center"" BORDER=""1"" WIDTH=""650"" cellspacing=""0"" cellpadding=""0""  bordercolor=""#ffffff"" bgcolor="& Request.Cookies("CAR")("Color2") & " style=""border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px"">"
			Response.Write "<TR><td>"	   		
			Response.Write "<table BORDER=""0"" WIDTH=""100%"" cellpadding=""6"">"
	
		 	Response.Write "<TR><td CLASS=""TDT"" colspan=""3"">" &  wTIT & "</td></TR>"	
		 	Response.Write "<tr><td class=""TDS"" width=""20%"" ><p CLASS=""P1"" align=""center"">Codigo</p></td>"
         	Response.Write "<td class=""TDS"" width=""80%""><p CLASS=""P1"" align=""left"">Descripción</p></td></tr>"
         	
		End if 
		
		If wC01 <> trim(rstQuery.Fields(0)) Then

			wC01 = trim(rstQuery.Fields(0))
			wC02 = trim(rstQuery.Fields(1))		
			wURL = "X001A104S.ASP?CLA001=" & wC01
			
			IF wPAR = "1" THEN
				wURL = "../ASPX/C001E004.aspx?CCL="& wC01 & "&CLU=" & Session("glTipoUsuario") & "&PUS=" & Session("glUsuario")
			END IF

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

	%>



	</form> 
	</p> 
	</td>
        </tr>
                
        
<tr>
<td bgcolor="#FFFFFF">


<p align=center>&nbsp;<p align=center>&nbsp;<p align=center>
<% IF wPAR = "1" THEN %>
<INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:window.open("X001A005.asp","main");'>
<%ELSE%>
<INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:window.open("X001A004.asp","main");'>
<%END IF %>
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

