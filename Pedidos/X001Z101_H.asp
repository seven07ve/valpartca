<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title></title>
</head>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<body topmargin="0" bgcolor="#FFEBD6">

<script language="javascript">

function Agregar(){

parent.frames["main1"].Enviar(); 


}

</script>  
<% 


	wCLASS = "TDS1"
	wTITULO = "Agregar Productos al Reclamo"

%> 
<table align='center'  BORDER='1' bordercolor='#0066CC' bgcolor='#FE9900' WIDTH='919' >
<TR>
<td CLASS='TDT' colspan="5" height="35" > 
<p style='margin-top: 3px; margin-bottom: 3px'><b><font size='2'><%= wTITULO %></font></b></td>
<td CLASS='TDT' ><INPUT TYPE='button' NAME='send' onclick='Agregar();' VALUE='Agregar' tabindex='2' style='font-family: Tahoma; font-size: 10pt;'></td>
</TR> 
<TR>
<td CLASS='<%=wCLASS%>' width='20%' aLIGN='left'><b> Nro. de Parte</b></td>
<td CLASS='<%=wCLASS%>' width='35%' ALIGN='left'><b> Descripción</b></td>
<td CLASS='<%=wCLASS%>' width='10%' ALIGN='center'><b> Cant. Fact.</b></td>
<td CLASS='<%=wCLASS%>' width='15%' ALIGN='left'><b> Motivo</b></td>
<td CLASS='<%=wCLASS%>' width='10%' ALIGN='left'><b> Afecta Pedido</b></td>
<td CLASS='<%=wCLASS%>' width='10%' ALIGN='center'><b>Cant.</b></td></TR></table>
</body>

</html>
