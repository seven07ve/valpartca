<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<base target="main">

<!--#include file="X001Z001.INC"-->
<style>
<!--
 table.MsoNormalTable
	{mso-style-parent:"";
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
-->
</style>
<style>

html{overflow-y:scroll} 

</style>
</head>



<%

	IF Session("glTipoUsuario") = "C" Then
		wURL = "X001A104S.ASP?CLA001=" & Session("glUsuario")
		ELSE
		wURL = "X001Z202.asp"
	End If
	
 

%>

<body onload=" javascript:window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=auto topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">

<div align="center">

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" height="100%">
<tr>
<td valign="top">



<table width="919" bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0" >
<tr>
<td bgcolor="#FFFFFF">
<p align="center" style="margin-top: 3px; margin-bottom: 3px">
     

 
<p align="center" style="margin-top: 5px; margin-bottom: 3px">&nbsp;</p>
 


<table align="center"   cellspacing="0" cellpadding="0" width="605" bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" id="table6" border="1">
	

  <tr>
    <td width="79%" bgcolor="white" height="30"> 
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>
		<font face="Tahoma" size="2">Notificación de Pagos</font></b></p></td>
  </tr>

	<tr>
		
	<td width="79%" >

		<table border="0" cellpadding="0" bordercolorlight="#c0c0c0" bordercolordark="#c0c0c0" width="98%" id="table7">
			<tr>
				<td  align="center" width="17%"> 
				<p style="margin-top: 3px"> 
				</td>
				<td width="6%" align="center" > 
					<p style="margin-top: 3px">
					<img alt border="0" src="images/gpago.png" WIDTH="32" HEIGHT="32" style="CURSOR: pointer" onclick="javascript:window.open('<%=wURL%>','main')" >
					
				</td>
				<td width="23%" align="left" valign="middle">
				<p style="margin-top: 3px">
				<font face="Tahoma" size="2" onclick="javascript:window.open('<%=wURL%>','main')" style="CURSOR: pointer">
				&nbsp;Generar Pago</font></td>
				<td  align="center" width="9%"> 
				<p style="margin-top: 3px"> 
				</td>

				<td width="6%" align="center" > 
				
					<p style="margin-top: 3px"> 
				
					<img alt border="0" src="images/pagos.png" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A108_S.asp?NOMTAB=X300CQ001','main')" style="CURSOR: pointer">
				</td>
				<td width="30%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A108_S.asp?NOMTAB=X300CQ001','main')" style="CURSOR: pointer">
				<p style="margin-top: 3px">&nbsp;Pagos por Procesar </p></font></td>
			</tr>
			<tr>
				<td  align="center" width="17%"> 
				</td>
				<td width="6%" align="center" > 
									
					<img alt border="0" src="images/pagos.png" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A108_S.asp?NOMTAB=X300CQ001H','main')" style="CURSOR: pointer">
				</td>
				<td width="23%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A108_S.asp?NOMTAB=X300CQ001H','main')" style="CURSOR: pointer">&nbsp;Pagos 
				Procesados</font></td>
				
	
				<td  align="center" width="9%"> 
				</td>

				<td width="6%" align="center" > 
				  
					<img alt border="0" src="images/pdf.jpg" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('Instructivo_de_Pagos.pdf','_pdf')" style="CURSOR: pointer">
					
					</td>
				<td width="30%" align="left" valign="middle">
				
				<font face="Tahoma" size="2" onclick="javascript:window.open('Instructivo_de_Pagos.pdf','_pdf')" style="CURSOR: pointer">&nbsp;Instructivo de Pagos 
			</font>
			</td> 
				
				
				</tr>
			</table></td>


	</tr>
</table>



<p style="margin-top: 2px; margin-bottom: 2px">
<table align=center  width=80% border="0"><tr><td>


<p class="MsoNormal" style="margin-top: 15px; margin-bottom: 2px">
<span style="font-size:12.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">
Estimados Clientes:</span></p>
<p class="MsoNormal">
<span style="font-size:12.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">
A continuación las Cuentas de <%=Session("glNombreCiaInternet")%> donde pueden efectuar depósitos y/o 
Transferencias para la cancelación de sus compromisos con nosotros. </span></p>
<table border="0" align="center"   cellspacing="0" cellpadding="0" width="539" style="width: 404.0pt; border-collapse: collapse; " id="table8">
	
	
	
	<tr style="height: 16.1pt">
		<td width="520" nowrap colspan="3" rowspan="2" style="width:404.0pt;padding:0cm 3.5pt 0cm 3.5pt;
  height:16.1pt" align="center">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size:14.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">
		<%=Session("glNombreCiaInternet")%>&nbsp;&nbsp; <!--RIF. J-00044079-4--></span></td>
		<td width="0" style="width:.3pt;padding:0cm 0cm 0cm 0cm;height:16.1pt">&nbsp;</td>
	</tr>
	<tr style="height: 16.1pt">
		<td width="0" style="width:.3pt;padding:0cm 0cm 0cm 0cm;height:16.1pt">&nbsp;</td>
	</tr>
	<tr style="height: 13.5pt" align=center  >
		<td width="271" nowrap valign="middle" style="width: 203.25pt; height: 20.5pt; border: 1.0pt solid windowtext; padding-left: 3.5pt; padding-right: 3.5pt; padding-top: 0cm; padding-bottom: 0cm; background: <%=Request.Cookies("CAR")("Color2")%>">
		<p class="MsoNormal" align="center" style="text-align: left">
		<span style="font-size: 10.0pt; font-family: Arial,sans-serif; font-weight: 700">
		BANCO</span></td>
		<td width="88" nowrap valign="middle" style="width: 66.2pt; height: 13.5pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding-left: 3.5pt; padding-right: 3.5pt; padding-top: 0cm; padding-bottom: 0cm; background: <%=Request.Cookies("CAR")("Color2")%>">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 10.0pt; font-family: Arial,sans-serif; font-weight: 700">
		CUENTA</span></td>
		<td width="179" nowrap valign="middle" style="width: 134.55pt; height: 13.5pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: 1.0pt solid windowtext; border-bottom: 1.0pt solid windowtext; padding-left: 3.5pt; padding-right: 3.5pt; padding-top: 0cm; padding-bottom: 0cm; background: <%=Request.Cookies("CAR")("Color2")%>">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 10.0pt; font-family: Arial,sans-serif; font-weight: 700">
		No. DE CUENTA</span></td>
		<td width="0" style="width:.3pt;padding:0cm 0cm 0cm 0cm;height:13.5pt">&nbsp;</td>
	</tr>
	
	
	<%
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT A300034DEL, A300034NCB  "
	SQL = SQL & " FROM X300AF034 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300034CCI ='" & Session("glCiaInternet") & "'  AND "
	SQL = SQL & " A300034CIA ='" & Session("glCia") & "' "
	SQL = SQL & " ORDER BY A300034DEL "
	'Response.Write SQL	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn	
	DO WHILE NOT rstQuery.EOF 
	
		wC01 = trim(rstQuery.Fields(0))
		wC02 = trim(rstQuery.Fields(1))

	%>
	
	<tr style="height: 12.75pt">
		<td width="271" nowrap valign="bottom" style="width:203.25pt;padding:0cm 3.5pt 0cm 3.5pt;
  height:12.75pt" align="left">
		<p class="MsoNormal">
		<span style="font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">
		<%=wC01%></span></td>
		<td width="88" nowrap valign="bottom" style="width:66.2pt;padding:0cm 3.5pt 0cm 3.5pt;
  height:12.75pt" align="center">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">
		CORRIENTE</span></td>
		<td width="179" nowrap valign="bottom" style="width:134.55pt;padding:0cm 3.5pt 0cm 3.5pt;
  height:12.75pt" align="center">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">
		<%=wC02%></span></td>
		<td width="0" style="width:.3pt;padding:0cm 0cm 0cm 0cm;height:12.75pt">&nbsp;</td>
	</tr>
	
	<%
	
	
		rstQuery.MoveNext 
		
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	%>
	
	</table>

</td></tr></table>   
</p>



<p>&nbsp;</p>

		</td>
        </tr>
                

        
        
        
<tr>
<td>
&nbsp;</td>

        </tr>
        
        
        
        
               </table>
  		
		
</body>
</html>