<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title></title>
</head>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<body topmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">

<script language="javascript">

function Agregar(){

parent.frames["main1"].Enviar(); 


}

</script>  
<% 

IF Session("glMostrarExistencia") = "1" THEN
	IF Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" OR Session("glMostrarTR") = "1" THEN
   		wColspan = "7" '7
   	  Else
   		wColspan = "7"
   	End If
  Else
  	IF Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" OR Session("glMostrarTR") = "1" THEN
    	wColspan = "6"'6
      Else
   		wColspan = "6"
   	End If 
END IF 

	wCLASS = "TDS1"
	wTITULO = "Agregar Productos al Pedido"

%> 
<table align='center'  BORDER='0' cellspacing="1" cellpadding="2" bordercolor='#ffffff' bgcolor='<%=Request.Cookies("CAR")("Color2")%>' WIDTH='919' >
<TR>
<td CLASS='TDT' colspan=<%=wColspan%> > 
<p style='margin-top: 3px; margin-bottom: 3px'><b><font size='2'><%= wTITULO %></font></b></td>
<td CLASS='TDT' colspan=3><INPUT TYPE='button' NAME='send' onclick='Agregar();' VALUE='Agregar' tabindex='2' style='font-family: Tahoma; font-size: 10pt;'></td>
</TR> 
<TR>
<td CLASS='<%=wCLASS%>' width='10%' aLIGN='center'><b>Imagen</b></td>
<td CLASS='<%=wCLASS%>' width='19%' aLIGN='left'><b> Nro. de Parte</b></td>
<td CLASS='<%=wCLASS%>' width='10%' aLIGN='left'><b>Referencia</b></td>
<td CLASS='<%=wCLASS%>' width='30%' ALIGN='left'><b> Descripción</b></td>
<td CLASS='<%=wCLASS%>' width='4%' ALIGN='left'><b> Unid. Empa.</b></td>
<td CLASS='<%=wCLASS%>' width='10%' ALIGN='left'><b> Marca</b></td>
<% IF Session("glAplicarIva") = "0" Then %>
<td CLASS='<%=wCLASS%>' width='10%' ALIGN='Right'><b> P. Unit. Neto sin IVA</b></td>
<% ELSE %>
<td CLASS='<%=wCLASS%>' width='10%' ALIGN='Right'><b> P. Unit. Neto con IVA</b></td>
<% END IF %>
<% IF Session("glMostrarExistencia") = "1" THEN %>
<td CLASS='<%=wCLASS%>' width='4%' ALIGN='center'><b>Exis.</b></td>
<% END IF %>
<td CLASS='<%=wCLASS%>' width='4%' ALIGN='center'><b>B/O</b></td>
<% IF Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" OR Session("glMostrarTR") = "1" THEN %>
<!--<td CLASS='<%=wCLASS%>' width='5%' ALIGN='center'><b>Trans.</b></td>-->
<% END IF %>
<td CLASS='<%=wCLASS%>' width='6%' ALIGN='center'><b>Cant.</b></td></TR></table>
</body>

</html>
