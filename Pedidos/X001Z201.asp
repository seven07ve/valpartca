<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">


<SCRIPT LANGUAGE="VBScript">
Function Inicio(wCL1, wURL)

	'document.FrmBuscar.BUSCAR.focus()

	window.status = wURL

End Function


</SCRIPT>

<!--#include file="X001Z001.INC"-->
</HEAD>

<%


	'Preparar Etiqueta Body del Formulario
	wCLA001 = Request.QueryString("CLA001")
	wCLA002 = Request.QueryString("CLA002")	
	wCLA003 = Request.QueryString("CLA003")	
	wURLW = Request.ServerVariables("URL")
	wBody = "<body   onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	'Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario



	wTIT = "Buscar en Maestro de Clientes" 
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 


%>


    <body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="17" topmargin="0" rightmargin="0">
    
    <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >



<table width="919" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" >
<tr>
<td bgcolor="#FFFFFF">
<p align=center>&nbsp;
    <table align="center" BORDER="1" WIDTH="650" cellspacing="0" cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="6" >
		 <TR>
		 <td CLASS="TDT" colspan=3 height="30" ><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="center">Codigo</p></td>
          <td class="TDS" width="80%" ><p CLASS="P1" align="left">Descripción</p></td>
         </tr>

<%
		
    
	strCnn	= Application("XDTA300_ConnectionString")

	'BUSCA ERP COMPAÑIA INTERNET
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wERP = TRIM(rstQuery.Fields("Z300002ERP"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	IF wERP = "ASW" THEN	
		SQL = "SELECT A300002CCL, A300002RSO FROM X300AQ002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300002CCI = '" & wCCI & "' AND "
		SQL = SQL & " A300002CIA = '" & wCIA & "' "
		if Session("glTipoUsuario") = "C" then
			SQL = SQL & " AND "
			SQL = SQL & " A300002CCL = '" & Session("glUsuario") & "' "
		end if
		if Session("glTipoUsuario") = "V" then
			SQL = SQL & "  AND "
			SQL = SQL & " A300002CVE = '" & Session("glCodVendedor") & "' "
		end if
		if len(trim(wCLA001)) > 0 then
			SQL = SQL & " AND "
			SQL = SQL & " ((A300002CCL LIKE '%" & ucase(wCLA001) & "%') OR  "
			SQL = SQL & "  (A300002RSO LIKE '%" & ucase(wCLA001) & "%'))  "
		end if	
	END IF 		
	
	IF wERP = "SAP" THEN	
		SQL = "SELECT A300010CCL, A300002RSO FROM X300AQ002C " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300002CCI = '" & wCCI & "' "
		if Session("glTipoUsuario") = "C" then
			SQL = SQL & " AND "
			SQL = SQL & " A300010CCL = '" & Session("glUsuario") & "' "
		end if
		if Session("glTipoUsuario") = "V" then
			SQL = SQL & "  AND "
			SQL = SQL & " A300002CVE = '" & Session("glCodVendedor") & "' "
		end if
		if len(trim(wCLA001)) > 0 then
			SQL = SQL & " AND "
			SQL = SQL & " ((A300010CCL LIKE '%" & ucase(wCLA001) & "%') OR  "
			SQL = SQL & "  (A300002RSO LIKE '%" & ucase(wCLA001) & "%'))  "
		end if	
		SQL = SQL & " GROUP BY A300010CCL, A300002RSO  "
		SQL = SQL & " ORDER BY A300002RSO  "
	END IF 		

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

	wURL = "X001A100_A.ASP?CLA001=&CLABUS="
	wC01 = ""
	wCuenta = 0
	DO WHILE NOT rstQuery.EOF 
	
		If wC01 <> trim(rstQuery.Fields(0)) Then

			wC01 = trim(rstQuery.Fields(0))
			wC02 = trim(rstQuery.Fields(1))		
			'wURL = "X001A100_A.ASP?CLA001=&CLABUS=" & wC01
			wURL = "X001A100_A.ASP?CLA001=" & wCLA003 & "&CLA002=" & wCLA002 & "&CLABUS=" & wC01
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




	%>


	</table>
	</td>	
	</TR>	
	</table>
	</p> 
	</td>
        </tr>
                
        
<tr>
<td bgcolor="#FFFFFF">


<p align=center>&nbsp;<p align=center><INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'><p>

	</td>
        </tr>

<!--        
<tr>
<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>

</td>
        </tr>-->
        
        
        
        
               </table>

	
</BODY>
</HTML>

