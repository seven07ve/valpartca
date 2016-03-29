<%@ Page Language="VB" Debug="false"  AutoEventWireup="false" CodeFile="C001M004.aspx.vb" Inherits="C001M004" %>

<%  
    
    Response.AddHeader("cache-control", "private")
    Response.AddHeader("pragma", "no-cache")
    Response.AddHeader("Cache-Control", "must-revalidate")
    Response.AddHeader("Cache-Control", "no-cache")
    
%>



<html xmlns="http://www.w3.org/1999/xhtml" >
<meta http-equiv="X-UA-Compatible" content="IE=9" >
<head runat="server">
    <title>Maestro Presupuesto por Vendedor</title>
    <link rel="stylesheet" type="text/css" href="../pedidos/X001Z900.CSS" />
</head>
<body bgcolor="<%=txCO1.text%>" topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" scroll="yes"   >
   
   
   
   <table width="920" bgcolor="#000000" border="0" cellpadding="0" cellspacing="0" width="100%"  height="100%"  align="center" >
<tr>
<td bgcolor="#FFFFFF" valign="top" >
<form id="form1" runat="server">
<br />
          <table align="center" border="1" width="700" cellspacing="0" cellpadding="0"  style="background-color:<%=txCO2.text%>;border-color:#0066CC; border-style: inset; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
<tr>
	  <td>
	  <table border="0" width="100%" >
		 <tr>
		 <td class="TDT" colspan="2" height="30"><asp:Label ID="lbTitulo" runat="server"></asp:Label></td>		  
		 </tr>	

		 <tr>
          <td class="TDS"  style="height: 26px; text-align:left ; width: 128px;"><p class="P1" >
              Archivo:</p></td>
          <td class="TDD" style="height: 26px" align="left" >
              <asp:FileUpload ID="fuProductos" runat="server" Width="531px" /><br />
              <asp:Label ID="lbMensaje" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                  ForeColor="Red" Text="lbMensaje" Visible="False"></asp:Label>
              <asp:Label ID="lbEstatus" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                  ForeColor="Green" Text="lbEstatus" Visible="False"></asp:Label></td>
         </tr>
          <tr>
              <td class="TDS" style="width: 128px; height: 26px; text-align: left">
                  Ultima Actualización:</td>
              <td align="left" class="TDD" style="height: 26px">
                  <asp:Label ID="lbZ300002FAP" runat="server"></asp:Label>
                     <asp:TextBox id="txCO1" runat="server" MaxLength="7" Width="65px" Visible="false"></asp:TextBox>
			  <asp:TextBox id="txCO2" runat="server" MaxLength="7" Width="65px" Visible="false" ></asp:TextBox>
                  </td>
          </tr>
		 

		 

	</table>
	</td>	
	</tr>	
	</table>
     
	  
      
      
   <br />
   
      <p align="center" >
        
        <asp:Button id="btnActualizar" runat="server" text="Actualizar" TabIndex="0" />
        </p> 
        &nbsp;

    </form>
</body>

</html>
