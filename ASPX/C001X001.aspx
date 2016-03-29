<%@ Page Language="VB" AutoEventWireup="false" CodeFile="C001X001.aspx.vb" Inherits="C001X001" %>

<%  
    
    Response.AddHeader("cache-control", "private")
    Response.AddHeader("pragma", "no-cache")
    Response.AddHeader("Cache-Control", "must-revalidate")
    Response.AddHeader("Cache-Control", "no-cache")
    
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Comprobantes de Retención de Impuesto</title>
</head>
<body bgcolor="white"  >
    <form id="form1" runat="server">
    <div>
    
    <!--
    <table BORDER="0" width="790" align="center"  bgcolor="#FFFFFF" bordercolor="#FFFFFF" cellspacing="0" cellpadding="0"  height="100%">
		<tr><td valign="top" bgcolor="#FFFFFF"  height="100%" >
		<br/>
	-->	
        <table align="center" width="100%" border="1" bordercolor="#808080" cellspacing="0" >
            <tr>
                
                <td colspan="2" align="center" height="25" >
                    <strong><span style="font-size: 10pt; font-family: Tahoma">
                Comprobante de Retención de Impuesto (IVA)</span></strong>
                
                <asp:Label ID="lbNDC" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt"
                        Text="lbNDC" Visible="false" ></asp:Label>
                </td>
               
            </tr>
            <!--
            <tr>
                
                <td style="width: 30%" height="25">
                    <span style="font-size: 10pt; font-family: Tahoma">
                    Nro. Comprobante de Pago:</span></td>
                <td style="width: 70%" valign="middle"  >
                 
                    </td>
            </tr>
            -->
            <tr>
                
                <td style="width: 30%" height="25">
                    <span style="font-size: 10pt; font-family: Tahoma">
                    Seleccione:</span></td>
                <td style="width: 70%" valign="middle"  >
                    <br />
                    <asp:FileUpload ID="fuArchivo" runat="server" Width="370px" />
                    &nbsp;
                    <asp:Button ID="btnAdjuntar" runat="server" Text="Adjuntar" /><br />
                    <br />
                    <asp:Label ID="lbMensaje" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt"
                        ForeColor="#FF0033" Text="lbMensaje" Visible="False"></asp:Label>
                    <asp:Label ID="lbEstatus" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt"
                        ForeColor="Green" Text="lbEstatus" Visible="False"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 30%" height="25">
                    <span style="font-size: 10pt; font-family: Tahoma">Archivos:</span></td>
                <td style="width: 70%" align="center"  >
                
                
                <asp:GridView ID="gvArvhivos" runat="server" AutoGenerateColumns="false" BackColor="White"
                    BorderColor="#000000" BorderStyle="None" BorderWidth="0px" CellPadding="4" Font-Names="Tahoma" Font-Size="10pt" Width="400px" GridLines="Horizontal"  TabIndex="4" ShowHeader="false"  
                    OnRowCommand="gvArvhivos_RowCommand" OnRowDeleting = "gvArvhivos_RowDeleting">
                            <RowStyle BackColor="White" ForeColor="DimGray" />
                            <Columns>
                                <asp:TemplateField >
                                <ItemTemplate> 
                                   <table width="100%" cellpadding="0" cellspacing="0" >
                                   <tr><td>
                                   <font onclick="Javascript:window.open('CRI/<%# Eval("C300004NAR")%>','_blank')" style="cursor:pointer" > 
                                   <asp:Label ID="lbldescripcions" runat="server" Text='<%# Eval("C300004NOR") %>' Visible="true"></asp:Label></font> 
                                  </td>
                                  </tr>                                  
                                  </table>    
                                  
                           </font> 
                           </ItemTemplate>          
                           </asp:TemplateField> 
                           
                           <asp:TemplateField>
                                    <ItemTemplate>                                 
                                        
                                   <asp:ImageButton ID="IbDelete" CommandName="Delete"  runat="server" ImageUrl="Img/Delete.gif"
                                            CommandArgument='<%# Eval("C300004NRO") %>'  OnClientClick="return confirm('¿Esta seguro de Eliminar este archivo?');"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            
                            </Columns>
                            
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <EmptyDataTemplate>
                                <span style="font-size: 8pt"><strong>&nbsp;</strong></span>
                            </EmptyDataTemplate>
                            
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        </asp:GridView>
                
                </td>
                
            </tr>
            <tr>
                
                <td colspan="2" style="text-align: center" >
                    <span style="font-size: 10pt; font-family: Tahoma">
                        <br />
                        <strong><span style="color: #0000cc">Recuerde que podra adjuntar archivos en
                            el formato .jpg, .gif, .pdf y los podra visualizar pulsando el nombre del mismo.<br />
                        </span></strong>&nbsp;</span></td>
               
            </tr>
            <!--
            <tr>
                
                <td colspan="2"  align="center" style="height: 35px" >
                    
                
                </td>
            </tr>    -->
                <asp:Button ID="btnContinuar" runat="server" Text="Registrar Pago" Font-Bold="True" Visible="False" /><asp:Button ID="btnRegresar" runat="server" Text="Regresar" Visible="False" /></table>
<!--        
        <br />
        <br />
        <br /> 
</td> 
</tr> 
<tr>
<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>

</tr>

 </table>     -->
    </div>
    </form>
</body>
</html>
