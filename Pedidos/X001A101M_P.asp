<%
Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>

<script language="vbscript">

Sub Cmd_Submit()
	Dim wMens 
	If trim(document.frmBuscar.FAMILIA.value) = "000" Then
	   wMens = Msgbox("Seleccione una Familia",vbExclamation,"Cata Pedidos")
	  Else
   	   document.frmBuscar.submit
   	End If 
	
End Sub


</script>


<%

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wCAMC01 = Request.QueryString("CAMC01")
	wCAMC02 = Request.QueryString("CAMC02")
	
	wURL = wURLACT & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 & "&CLA003="
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&CAMC01=" & wCAMC01
	wURLX = wURLX & "&CAMC02=" & wCAMC02


	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = "X001A101M_PRINT.asp?CAMC01=" & wCAMC01 & "&CAMC02=" & wCAMC02
	wURLT = wURLX & "&STSIMP=E" 

	
	wURLP = wURLPRI & "&PARBUS=S"
	
	wURLP = "X001A103B.ASP" & "?URLTIT=" & wURLTIT	
	wURLP = wURLP & "&CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02
	
	'wURLPS = "X001A102_01.ASP" & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 	 
	'wURLPSP = "X001A102_03.ASP" & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 	 
	
	wURLR = Session("glUrlRegresar")
	
	
	'wURLTIT = Request.QueryString("URLTIT") 
	'wCLA001 = Request.QueryString("CLA001") 
	'wCLA002 = Request.QueryString("CLA002") 
	'wTITULO = "Busqueda de Productos"

	wURLB = "X001A103BS.ASP?URLTIT=" & wURLTIT
	'wURLB = "X001A101_F.ASP?URLTIT=" & wURLTIT
	wURLB = wURLB & "&CAMC01=" & wCAMC01
	wURLB = wURLB & "&CAMC02=" & wCAMC02  
	wURLB = wURLB & "&URLD=" & "X001A103BS.ASP"  

	strCnn	= Application("XDTA300_ConnectionString")
	SQL = "SELECT B300100SPP "
	SQL = SQL & " FROM X300BF100 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300100NPE ='" & wCAMC02 & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	IF NOT rstQuery.EOF THEN
		wSPP = trim(rstQuery.Fields("B300100SPP"))
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
 'response.write wSPP 
	
	%>
	 

	 <BODY   topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>"  >

    

       <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center"  height="100%">
<tr>
<td valign="top"  >
<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLB%>" target="main1" >	 

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">


    <table bordercolor="#0066CC" align="center"  bgcolor="<%=Request.Cookies("CAR")("Color2")%>" BORDER="1" width="919"  style="border-style: inset; border-width: 1px; padding-left: 2px; padding-right: 2px; padding-top: 1px; padding-bottom: 1px" cellpadding="5">
    <TR>
		<!--<td CLASS="TDP" width="35%" align="center"><A href="<%=wURLP %>" target="main">Agregar Item</A></td>-->
		<td CLASS="TDP" width="50%" align="center"><A href="<%=wURLR %>" target="_parent">Encabezado de Pedidos</A></td>		  
		<td CLASS="TDP" width="50%" align="center"><A href="<%=wURLI %>" target="_blank">Imprimir</A></td>		  					
    </TR>	
	</table>	
	

	</td> 
</tr> 
</table>

</FORM> 
</td>
</tr> 
        
        
               </table>
	
</body>




<% 
'RESPONSE.WRITE Session("glBusqueda3") & "##"
%></HTML>