<%@ Page Language="VB" AutoEventWireup="false" validateRequest="false" CodeFile="C001D003.aspx.vb" Inherits="C001D003" Debug="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<meta http-equiv="X-UA-Compatible" content="IE=9" >
<head id="Head1" runat="server">
    <title>Mantenimiento del Sitio</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link rel=stylesheet type="text/css" href="../pedidos/X001Z900.CSS">



    <style type="text/css">
        .style1
        {
            BACKGROUND-COLOR: white;
            COLOR: black;
            FONT-FAMILY: 'Tahoma';
            TEXT-ALIGN: center;
            WIDTH: 100%;
            font-SIZE: 10pt;
            font-weight: bold;
            height: 33px;
        }
    </style>



</head>



<body topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=txCO1.text%>">
    

    <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%"  >
   
<tr>
<td valign="top" align="center"  >
 <form id="form1" runat="server">
<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF" align="center" >


    &nbsp;&nbsp;
    
    <table align="center"  BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=txCO2.text%>" style="border-style: inset; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="style1" colspan=2>Notas de Interes</td>		  
		 </TR>	
		
		<tr>
          <td class="TDS" style="width: 31%" height="25" ><p CLASS="P1" align="left">
		  Compañia Web/Móvil:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:Label ID="lbCCI" runat="server" Font-Bold="True"></asp:Label>
		</td> 
         </tr>
         
		 <tr>
          <td class="TDS" style="width: 31%" height="25"><p CLASS="P1" align="left">
		  Nombre:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:Label ID="lbDEL" runat="server" Font-Bold="True"></asp:Label>
		</td> 
         </tr>


		

		<tr>
          <td class="TDS" style="height: 26px; width: 31%;" ><p CLASS="P1" align="left">
		  Texto:</p></td>
          <td class="TDD" width="70%" style="height: 26px" align="left" >
            <FTB:FreeTextBox  SupportFolder="~/aspnet_client/FreeTextBox" 
	JavaScriptLocation="ExternalFile" ButtonImagesLocation="ExternalFile" 
	        toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent|CreateLink,Unlink;Cut,Copy,Paste,Delete;Undo,Redo,Print;SymbolsMenu;InsertRule,InsertDate,InsertTime;InsertDiv,EditStyle,Preview,SelectAll,WordClean"
	        id="txOBS" runat="Server" Height="100px" Width="400px" ButtonSet="OfficeMac" />
              </td>
         </tr>
	 
          
		        
         <tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">Imagen:</p></td>
          <td class="TDD" width="70%" align="left" >
                  <asp:FileUpload ID="FileUpload1" runat="server" Width="412px" />
                  <br />
                  <asp:Button ID="btnSubirIm1" runat="server" OnClick="btnSubirIm1_Click" 
                      Text="Subir " />
                  <asp:Button ID="btnSubirIm2" runat="server" 
                      Text="Eliminar" />
                  <br />
                  <asp:Label ID="lbEstatus" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Small"
                      ForeColor="Red"></asp:Label></td>
         </tr>
		 

         <tr>
          <td class="TDS" height="25" style="width: 31%" ><p CLASS="P1" align="left">
		  Fecha de Actualización:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:Label ID="lbFAC" runat="server" Font-Bold="True"></asp:Label>
              <asp:TextBox id="txCO1" runat="server" MaxLength="7" Width="65px" Visible="false"></asp:TextBox>
			  <asp:TextBox id="txCO2" runat="server" MaxLength="7" Width="65px" Visible="false" ></asp:TextBox>

              </td>
         </tr>
		 

	</table>
	</td>	
	</TR>	
	</table>
     
	  
      
      
   <br />
        <Table ID="Table1" Width="700" align=center >
        <tr /><td align=center style="height: 26px"  / >
        <asp:Button ID="btnActualizar" runat="server" Text="Guardar" 
                style="height: 26px" />
        <asp:Button ID="btnRegresar" runat="server" Text="Regresar" /></Table>
         
         <br />
                
        
         
         <br/>
 <br/>
         
    </td> 
    </tr> 
    </table>   
    
  </form>
   
</body>
</html>

