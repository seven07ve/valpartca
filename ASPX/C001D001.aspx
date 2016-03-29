<%@ Page Language="VB" AutoEventWireup="false"  validateRequest="false" CodeFile="C001D001.aspx.vb" Inherits="C001D001" Debug="false"%>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Mantenimiento de Noticias</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link rel=stylesheet type="text/css" href="../pedidos/X001Z900.CSS">



</head>



<body >
    <form id="form1" runat="server">
    <div align=center >
    <table BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#ffffff" bgcolor="#0077C0" style="border-style: inset; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2>Noticia</td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Código:</p></td>
          <td class="TDD" width="70%" align="left" ><p CLASS="P1">
              <asp:TextBox ID="txZ300050CDN" runat="server" ReadOnly="True"></asp:TextBox>
          </td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" style="height: 26px" ><p CLASS="P1" align="left">
		  Titulo:</p></td>
          <td class="TDD" width="70%" style="height: 26px" align="left" >
            <FTB:FreeTextBox 
	        toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent|CreateLink,Unlink;Cut,Copy,Paste,Delete;Undo,Redo,Print;SymbolsMenu;InsertRule,InsertDate,InsertTime;InsertDiv,EditStyle,Preview,SelectAll,WordClean"
	        id="txZ300050TIL" runat="Server" Height="130px" Width="440px" ButtonSet="OfficeMac" />
              </td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" style="height: 47px" ><p CLASS="P1" align="left">
		  Descripción:</p></td>
          <td class="TDD" width="70%" align="left" style="height: 47px" >
              <FTB:FreeTextBox 
	        toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent|CreateLink,Unlink;Cut,Copy,Paste,Delete;Undo,Redo,Print;SymbolsMenu;InsertRule,InsertDate,InsertTime;InsertDiv,EditStyle,Preview,SelectAll,WordClean"
	        id="txZ300050DNL" runat="Server" Height="180px" Width="440px" ButtonSet="OfficeMac" />
              </td> 
         </tr>
          <tr>
              <td class="TDS" width="30%" >
                  <p CLASS="P1" align="left">
                      Foto:</p>
              </td>
              <td class="TDD" width="70%" align="left" >
                  <asp:FileUpload ID="fuZ300050FOT" runat="server" Width="442px" />
                  <asp:Label ID="lbEstatus" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                      ForeColor="Red"></asp:Label><br />
                 <asp:Image ID="Image" runat="server" /></td>
          </tr>
		  

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Estatus:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:DropDownList ID="ddlZ300050STS" runat="server">
              </asp:DropDownList></td>
         </tr>
		 

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
         
           
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
     
	  
      
      </div>
   <br />
        <Table ID="Table1" Width="700" align=center >
        <tr /><td align=center style="height: 26px"  / >
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" />
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" /></Table>
        
        
    </form>
</body>
</html>
