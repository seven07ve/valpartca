<%@ Page Language="VB" AutoEventWireup="false" validateRequest="false" CodeFile="C001E004.aspx.vb" Inherits="C001E004" Debug="TRUE" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Reclamos</title>
    	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <link rel="stylesheet" type="text/css" href="../Pedidos/X001Z900.CSS" />
        
   
      
</head>

<body topmargin="0" leftmargin="25" bottommargin="0" scroll="yes" bgcolor="<%=txCO1.text%>">
    <form id="form1" runat="server">
    <div style="text-align:center" />
    
    <table border="0" height="100%" width="921" bgcolor="#FFFFFF" align="center" > <tr><td valign="top" >
    
     <div align="center">
     
       <table align="center"  border="1" width="650" cellspacing="0" cellpadding="0" bordercolor="#ffffff" bgcolor="<%=txCO2.text%>" style=" border-style: inset; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <tr>
	  <td>
	  <table border="0" width="100%" cellpadding="4"  >
		 <tr>
		 <td class="TDT" colspan="2" height="25px" ><asp:Label ID="lbTitulo" runat="server"></asp:Label></td>		  
		 </tr>	
		 
		 <tr>
          <td class="TDS"  style="height: 26px; text-align:left "><p class="P1" >
              Nro.:</p></td>
          <td class="TDD" align="left" ><p class="P1" >
              <asp:Label ID="lbReclamo" runat="server" ></asp:Label></p>
              </td>
         </tr>
		 <tr>
          <td class="TDS"  style="height: 26px; text-align:left "><p class="P1" >
              Cliente:</p></td>
          <td class="TDD" align="left" ><p class="P1" >
              <asp:Label ID="lbCliente" runat="server" ></asp:Label>
              <asp:Label ID="lbCCL" runat="server" Visible="False"></asp:Label>
              &nbsp;<asp:DropDownList ID="ddlCliente" runat="server" Visible="False" Width="372px">
              </asp:DropDownList></p>
              </td>
         </tr>

		 
              
         
          <tr>
              <td class="TDS" style="height: 26px; text-align: left">
                  Tipo: </td>
              <td align="left" class="TDD">
                  <asp:DropDownList ID="ddlMotivo" runat="server">
                  </asp:DropDownList>
                  </td>
          </tr>
          
          
          <tr>
              
          <td class="TDD"  align="center"  colspan="2">
              <table width="100%" border="0">
              <tr>
              <td>
              </td>
              <td>
              <B>Factura</B> 
              </td> 
              <td>
              <b>Cod. Producto</b> 
              </td> 
              <td>
              <b>Cantidad</b>
              </td> 
              <td>
              <b>Motivo</b>
              </td> 
              <td>
              <b>Observación</b>
              </td> 
              </tr> 
              
               <tr>
               <td align="center"  >
               <b>1</b> 
               </td>
              <td>
              <asp:TextBox ID="txFactura_01" runat="server" Rows="1" TextMode="SingleLine"  Width="99px" MaxLength="25" ></asp:TextBox>
              </td> 
              <td>
              <asp:TextBox ID="txProducto_01" runat="server" Rows="1" TextMode="SingleLine"  Width="109px" MaxLength="25" ></asp:TextBox>
              
              </td> 
              <td>
              <asp:TextBox ID="txcantidad_01" runat="server" Rows="1" TextMode="SingleLine"  Width="51px" MaxLength="10" ></asp:TextBox>
              
              </td> 
              <td align="left"  ><asp:DropDownList ID="ddlMotivo_01" runat="server">
                  <asp:ListItem Selected="True" Value="0">Seleccione</asp:ListItem>
                  <asp:ListItem Value="Faltante">Faltante</asp:ListItem>
                  <asp:ListItem Value="Sobrante">Sobrante</asp:ListItem>
                  <asp:ListItem Value="Da&#65533;o">Daño</asp:ListItem>
                  <asp:ListItem Value="Aplicacion">Aplicación</asp:ListItem>
                  <asp:ListItem Value="Facturacion">Facturación</asp:ListItem>
                  <asp:ListItem Value="Precio">Precio</asp:ListItem>
                  <asp:ListItem Value="Despacho">Despacho</asp:ListItem>
                  <asp:ListItem Value="Otro">Otro</asp:ListItem>
              </asp:DropDownList></td> 
              <td>
              <asp:TextBox ID="txObservacion_01" runat="server" Rows="2" TextMode="multiline" MaxLength="200"  Width="211px" ></asp:TextBox>
              
              </td> 
              </tr> 
              
              <%  If Len(Trim(Request.QueryString("NRO"))) = 0 Or Len(Trim(txFactura_02.Text)) > 0 Then %>
              
              <tr>
               <td align="center"  >
               <b>2</b> 
               </td>
              <td>
              <asp:TextBox ID="txFactura_02" runat="server" Rows="1" TextMode="SingleLine"  Width="99px" MaxLength="25" ></asp:TextBox>
              </td> 
              <td>
              <asp:TextBox ID="txProducto_02" runat="server" Rows="1" TextMode="SingleLine"  Width="109px" MaxLength="25" ></asp:TextBox>
              
              </td> 
              <td>
              <asp:TextBox ID="txCantidad_02" runat="server" Rows="1" TextMode="SingleLine"  Width="51px" MaxLength="10" ></asp:TextBox>
              
              </td> 
              <td align="left"  ><asp:DropDownList ID="ddlMotivo_02" runat="server">
               <asp:ListItem Selected="True" Value="0">Seleccione</asp:ListItem>
                  <asp:ListItem Value="Faltante">Faltante</asp:ListItem>
                  <asp:ListItem Value="Sobrante">Sobrante</asp:ListItem>
                  <asp:ListItem Value="Da&#65533;o">Daño</asp:ListItem>
                  <asp:ListItem Value="Aplicacion">Aplicación</asp:ListItem>
                  <asp:ListItem Value="Facturacion">Facturación</asp:ListItem>
                  <asp:ListItem Value="Precio">Precio</asp:ListItem>
                  <asp:ListItem Value="Despacho">Despacho</asp:ListItem>
                  <asp:ListItem Value="Otro">Otro</asp:ListItem>
              </asp:DropDownList></td> 
              <td>
              <asp:TextBox ID="txObservacion_02" runat="server" Rows="2" TextMode="multiline" MaxLength="200"  Width="211px" ></asp:TextBox>
              
              </td> 
              </tr> 
              
              <% END IF  %>
              <%  If Len(Trim(Request.QueryString("NRO"))) = 0 Or Len(Trim(txFactura_03.Text)) > 0 Then%>
          <tr>
               <td align="center"  >
               <b>3</b> 
               </td>
              <td>
              <asp:TextBox ID="txFactura_03" runat="server" Rows="1" TextMode="SingleLine"  Width="99px" MaxLength="25" ></asp:TextBox>
              </td> 
              <td>
              <asp:TextBox ID="txProducto_03" runat="server" Rows="1" TextMode="SingleLine"  Width="109px" MaxLength="25" ></asp:TextBox>
              
              </td> 
              <td>
              <asp:TextBox ID="txCantidad_03" runat="server" Rows="1" TextMode="SingleLine"  Width="51px" MaxLength="10" ></asp:TextBox>
              
              </td> 
              <td align="left"  ><asp:DropDownList ID="ddlMotivo_03" runat="server">
                <asp:ListItem Selected="True" Value="0">Seleccione</asp:ListItem>
                  <asp:ListItem Value="Faltante">Faltante</asp:ListItem>
                  <asp:ListItem Value="Sobrante">Sobrante</asp:ListItem>
                  <asp:ListItem Value="Da&#65533;o">Daño</asp:ListItem>
                  <asp:ListItem Value="Aplicacion">Aplicación</asp:ListItem>
                  <asp:ListItem Value="Facturacion">Facturación</asp:ListItem>
                  <asp:ListItem Value="Precio">Precio</asp:ListItem>
                  <asp:ListItem Value="Despacho">Despacho</asp:ListItem>
                  <asp:ListItem Value="Otro">Otro</asp:ListItem>
              </asp:DropDownList></td> 
              <td>
              <asp:TextBox ID="txObservacion_03" runat="server" Rows="2" TextMode="multiline" MaxLength="200"  Width="211px" ></asp:TextBox>
              
              </td> 
              </tr>
              
              <% End If%>
              <%  If Len(Trim(Request.QueryString("NRO"))) = 0 Or Len(Trim(txFactura_04.Text)) > 0 Then%>
              <tr>
               <td align="center" style="height: 42px"  >
               <b>4</b> 
               </td>
              <td style="height: 42px">
              <asp:TextBox ID="txFactura_04" runat="server" Rows="1" TextMode="SingleLine"  Width="99px" MaxLength="25" ></asp:TextBox>
              </td> 
              <td style="height: 42px">
              <asp:TextBox ID="txProducto_04" runat="server" Rows="1" TextMode="SingleLine"  Width="109px" MaxLength="25" ></asp:TextBox>
              
              </td> 
              <td style="height: 42px">
              <asp:TextBox ID="txCantidad_04" runat="server" Rows="1" TextMode="SingleLine"  Width="51px" MaxLength="10" ></asp:TextBox>
              
              </td> 
              <td align="left" style="height: 42px"  ><asp:DropDownList ID="ddlMotivo_04" runat="server">
                <asp:ListItem Selected="True" Value="0">Seleccione</asp:ListItem>
                  <asp:ListItem Value="Faltante">Faltante</asp:ListItem>
                  <asp:ListItem Value="Sobrante">Sobrante</asp:ListItem>
                  <asp:ListItem Value="Da&#65533;o">Daño</asp:ListItem>
                  <asp:ListItem Value="Aplicacion">Aplicación</asp:ListItem>
                  <asp:ListItem Value="Facturacion">Facturación</asp:ListItem>
                  <asp:ListItem Value="Precio">Precio</asp:ListItem>
                  <asp:ListItem Value="Despacho">Despacho</asp:ListItem>
                  <asp:ListItem Value="Otro">Otro</asp:ListItem>
              </asp:DropDownList></td> 
              <td style="height: 42px">
              <asp:TextBox ID="txObservacion_04" runat="server" Rows="2" TextMode="multiline" MaxLength="200"  Width="211px" ></asp:TextBox>
              
              </td> 
              </tr>
              <%End If%>
              <%  If Len(Trim(Request.QueryString("NRO"))) = 0 Or Len(Trim(txFactura_05.Text)) > 0 Then %>
              <tr>
               <td align="center"  >
               <b>5</b> 
               </td>
              <td>
              <asp:TextBox ID="txFactura_05" runat="server" Rows="1" TextMode="SingleLine"  Width="99px" MaxLength="25" ></asp:TextBox>
              </td> 
              <td>
              <asp:TextBox ID="txProducto_05" runat="server" Rows="1" TextMode="SingleLine"  Width="109px" MaxLength="25" ></asp:TextBox>
              
              </td> 
              <td>
              <asp:TextBox ID="txCantidad_05" runat="server" Rows="1" TextMode="SingleLine"  Width="51px" MaxLength="10" ></asp:TextBox>
              
              </td> 
              <td align="left"  ><asp:DropDownList ID="ddlMotivo_05" runat="server">
                 <asp:ListItem Selected="True" Value="0">Seleccione</asp:ListItem>
                  <asp:ListItem Value="Faltante">Faltante</asp:ListItem>
                  <asp:ListItem Value="Sobrante">Sobrante</asp:ListItem>
                  <asp:ListItem Value="Da&#65533;o">Daño</asp:ListItem>
                  <asp:ListItem Value="Aplicacion">Aplicación</asp:ListItem>
                  <asp:ListItem Value="Facturacion">Facturación</asp:ListItem>
                  <asp:ListItem Value="Precio">Precio</asp:ListItem>
                  <asp:ListItem Value="Despacho">Despacho</asp:ListItem>
                  <asp:ListItem Value="Otro">Otro</asp:ListItem>
              </asp:DropDownList></td> 
              <td>
              <asp:TextBox ID="txObservacion_05" runat="server" Rows="2" TextMode="multiline" MaxLength="200"  Width="211px" ></asp:TextBox>
              
              </td> 
              </tr>
              <% END IF  %>
              
              </table>   
              </td> 
          </tr>
             
          
          
          
		 
    <%  If Len(Trim(Request.QueryString("NRO"))) > 0 Then%>
	     <tr>
              <td class="TDS" style="height: 26px; text-align:left " >
                  Estatus:</td>
          <td class="TDD"  align="left" >
              <asp:Label ID="lbEstatus" runat="server" ></asp:Label> 
              <asp:Label ID="lbSTS" runat="server" Visible="False"></asp:Label>
              <asp:DropDownList ID="ddlEstatus" runat="server" Visible="False">
              </asp:DropDownList></td>
          </tr>
	<% End If%>
	
	<%  If Len(Trim(Request.QueryString("NRO"))) > 0 Then%>
	     <tr>
              <td class="TDS" style="height: 26px; text-align:left " >
                  Comentarios:</td>
          <td class="TDD"  align="left" >
              <asp:TextBox ID="txComentario" ReadOnly="true" runat="server" Rows="4" TextMode="MultiLine" Width="379px" Height="115px"></asp:TextBox>
              </td>
          </tr>
	<% End If%>
		     <tr>
              <td class="TDS" style="height: 26px; text-align:left " >
                  Fecha:</td>
          <td class="TDD"  align="left" >
              <asp:Label ID="lbFecha" runat="server" ></asp:Label> 
              </td>
          </tr>	 
          <tr>
              <td class="TDS" style="height: 26px; text-align: center" colspan="2" >
              Recuerde que para el Tipo de Reclamo Administrativo solo es 
			  requerido el Nro de Factura y la Observación.
              </td>
              
          </tr>

	</table>
	</td>	
	</tr>	
	</table>
     
	  
      
      
   <br />
   
      
<table border ="0" align="center" ><tr><td>
        <asp:Button id="btnEnviar" runat="server" text="Enviar" />
    <asp:Button id="btnActualizar" runat="server" text="Actualizar" Visible="False" />
    <asp:Button id="btnEliminar" runat="server" text="Eliminar" Visible="False" />
        <asp:Button id="btnCancelar" runat="server" text="Regresar" />&nbsp;
              <asp:TextBox id="txCO1" runat="server" MaxLength="7" Width="65px" Visible="false"></asp:TextBox>
			  <asp:TextBox id="txCO2" runat="server" MaxLength="7" Width="65px" Visible="false" ></asp:TextBox>

        <br /><br />
    </td></tr>
</table>        

</div> 
</td> 
</tr> 
</table> 
    </form>
    
    
 

</body>
</html>
