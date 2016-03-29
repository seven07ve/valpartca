<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Import Namespace="System.Data"%>

<!--AutoEventWireup="false"  validateRequest="false" CodeFile="textbox.aspx.vb" Inherits="textbox"-->  
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Mantenimiento de Noticias</title>
    <link rel=stylesheet type="text/css" href="../pedidos/X001Z900.CSS">

<!--#include file="../Pedidos/adm/X010Y004.PRC"-->

</head>


<%
Dim wTIT, wCLA001 as string
Dim wZ300050TNL, wZ300050DNL, wZ300050FOG as string
Dim wSELUNO, wSELDOS, wDisabled, wProceso as string
wTIT = "Noticia" 




 %>
<body>
    <form id="form1" runat="server">
    <div>
    <table BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Código:</p></td>
          <td class="TDD" width="70%" ><p CLASS="P1"><INPUT NAME="wCLA" <%= wDisabled %> size=15 value="<%=wCLA001%>"></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Titulo:</p></td>
          <td class="TDD" width="70%" ><INPUT NAME="wDES" value="<%=wZ300050TNL%>" maxlength="400" style="width: 436px"></td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Descripción:</p></td>
          <td class="TDD" width="70%" >
          <FTB:FreeTextBox Text="<%=wZ300050DNL%>"  
	        toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent|CreateLink,Unlink;Cut,Copy,Paste,Delete;Undo,Redo,Print;SymbolsMenu;InsertRule,InsertDate,InsertTime;InsertDiv,EditStyle,Preview,SelectAll,WordClean"
	        id="Z300050DNL" runat="Server" Height="180px" Width="440px" />
          <!--<textarea cols="70" rows="14" name="Z300050DNL"><%=wZ300050DNL%></textarea> -->
          <!--<INPUT NAME="Z300050DNL" size=78 value="<%=wZ300050DNL%>" maxlength=5000 type="text" ></td>-->
         </tr>

		 <!--<tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Foto Pequeña:</p></td>
          <td class="TDD" width="70%" ><INPUT NAME="Z300050FOP" size=15 value="<%=wZ300050FOP%>" maxlength=50></td>
         </tr>-->

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Foto:</p></td>
          <td class="TDD" width="70%" ><INPUT NAME="Z300050FOG" size=40 value="<%=wZ300050FOG%>" maxlength=50></td>
         </tr>
		  

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Estatus:</p></td>
          <td class="TDD" width="70%" >
				<select size="1" name="Z300050STS">
				<option value="1" <%=wSELUNO%>>Activa</option>
				<option value="0" <%=wSELDOS%>>Inactiva</option>
          </td>
         </tr>
		 

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
         
          <!--#include file="../Pedidos/adm/X010Y005.PRC"-->          
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
     
	  
      
      </div>
    </form>
</body>
</html>
