<%@ Page Language="VB" AutoEventWireup="false" CodeFile="C001M003.aspx.vb" Inherits="C001M003" %>

<%  
    
    Response.AddHeader("cache-control", "private")
    Response.AddHeader("pragma", "no-cache")
    Response.AddHeader("Cache-Control", "must-revalidate")
    Response.AddHeader("Cache-Control", "no-cache")
    
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link rel="stylesheet" type="text/css" href="../Pedidos/X001Z900.CSS" />
    
</head>
<style>

html{overflow-y:scroll} 

</style>
<script language="javascript" >
  function validarSiNumero(numero){
    if (!/^([0-9])*$/.test(numero))
      alert("El valor " + numero + " no es un número");
  }
</script>

<body bgcolor="<%=txCO1.text%>" topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" scroll="yes"   >
    
    

   
   
   <table width="920" bgcolor="#000000" border="0" cellpadding="0" cellspacing="0" width="100%"  height="100%"  align="center" >
<tr>
<td bgcolor="#FFFFFF" >
<form id="form1" runat="server">
<br />
       <table align="center" border="1" width="700" cellspacing="0" cellpadding="0"  style="background-color:<%=txCO2.text%>;border-color:#0066CC; border-style: inset; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <tr>
	  <td>
	  <table border="0" width="100%" cellpadding="6">
		 <tr>
		 <td class="TDT" colspan="2" height="25px" ><asp:Label ID="lbTitulo" runat="server"></asp:Label></td>		  
		 </tr>	
		 
		 <tr>
          <td class="TDS"  style="height: 22px; text-align:left ; width: 166px;">Código:</td>
          <td class="TDD" align="left" >
              <asp:TextBox ID="txA300003CPR" runat="server" MaxLength="25" Visible="False" ></asp:TextBox>
              <asp:Label ID="lbCPR" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                  ForeColor="Black" Text="lbCPR"></asp:Label>
              <asp:Label ID="lbMensaje" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                  ForeColor="Red" Text="lbMensaje" Visible="False"></asp:Label>
          </td>
         </tr>

		 <tr>
          <td class="TDS"  style="text-align:left ; width: 166px;">
              Descripción:</td>
          <td class="TDD" align="left" >
              <asp:Label ID="lbDEL" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                  ForeColor="Black" Text="lbDEL"></asp:Label></td>
         </tr>
   <tr>
          <td class="TDS"  style="text-align:left ; width: 166px;">
              Foto:</td>
          <td class="TDD" align="left" >
              <asp:Image ID="ImFoto" runat="server" Height="80px" Width="80px" /><br />
              <asp:FileUpload
                  ID="FileUpload" runat="server" /><asp:Button ID="btnSubirFoto" runat="server" 
                      Text="Subir Foto " Width="83px" /><asp:Button ID="btnEliminarFoto" runat="server" 
                      Text="Eliminar Foto " Width="102px" />
              <br />
              <asp:Label ID="lbMensaje2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                  ForeColor="Red" Text="lbMensaje2" Visible="False"></asp:Label></td>
         </tr>
   		 <tr>
          <td class="TDS" style="text-align:left ; width: 166px;" >
              Inventario:</td>
             <td class="TDD"  align="left" >
                 <asp:Label ID="lbCIN" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                     ForeColor="Black" Text="lbCIN"></asp:Label></td>
         </tr>
         <tr>
         
              <td class="TDS" style="text-align:left ; width: 166px;" >
                  
                      Fecha de Actualización:
              </td>
              <td class="TDD"  align="left" >
                  <asp:Label ID="lbFAC" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                      ForeColor="Black" Text="lbFAC"></asp:Label></td>
          </tr>

		 <tr>
          <td class="TDS" style="text-align:left ; width: 166px;" >
              Usuario:</td>
             <td class="TDD"  align="left" >
                 <asp:Label ID="lbPUS" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                     ForeColor="Black" Text="lbPUS"></asp:Label>
                     <asp:TextBox id="txCO1" runat="server" MaxLength="7" Width="65px" Visible="false"></asp:TextBox>
			  <asp:TextBox id="txCO2" runat="server" MaxLength="7" Width="65px" Visible="false" ></asp:TextBox>
                     </td>
         </tr>
	</table>
	</td>	
	</tr>	
	</table>
     
	  
      
      
   <br />
   <table border ="0" align="center"  >
      <tr>
        <td>
        <asp:Button id="btnAceptar" runat="server" text="Guardar" OnClick="btnAceptar_Click" UseSubmitBehavior="False" Visible="false"   />
        <asp:Button id="btnEliminar" runat="server" text="Eliminar" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Esta seguro de Eliminar este Producto?');" Visible="False" />
        <asp:Button id="btnCancelar" runat="server" text="Regresar" OnClick="btnCancelar_Click" OnClientClick="history.back()" />
</td>
</tr>
</table> 
<br />
<br />
 </form>
</td> 
</tr> 
</table> 
   
</body>
</html>
