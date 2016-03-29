<%@ Page Language="VB" AutoEventWireup="false"  validateRequest="false" CodeFile="C001D002.aspx.vb" Inherits="C001D002" Debug="false" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<meta http-equiv="X-UA-Compatible" content="IE=9" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head id="Head1" runat="server">
	<script type="text/javascript" src="../jscolor/jscolor.js"></script>


    <title>Mantenimiento del Sitio</title>
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
    
    <table align="center"  BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#FFFFFF" bgcolor="<%=txCO2.text%>" style="border-style: inset; padding-left: 2px; padding-right: 2px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="4" >
		 <TR>
		 <td CLASS="style1" colspan=2>Configuración General</td>		  
		 </TR>	
		
		<tr>
          <td class="TDS" style="width: 31%" height="25" ><p CLASS="P1" align="left">
			Compañia Web/Móvil:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:Label ID="lbCCI" runat="server" Font-Bold="True"></asp:Label>
		</td> 
         </tr>
         
		 <tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">Nombre:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txDEL" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
		 
		</td> 
         </tr>

<tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">
		  Identificación Fiscal:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txRIF" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
		 
		</td> 
         </tr>


			<tr>
           <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">
		   Dirección:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txDIL" runat="server" MaxLength="300" Width="400px"></asp:TextBox>
		</td> 
         </tr>


			<tr>
           <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">
		   Ciudad:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txCIU" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
		</td> 
         </tr>


			<tr>
           <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">
		   Teléfono:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txTEL" runat="server" MaxLength="20" Width="200px"></asp:TextBox>
		</td> 
         </tr>


			<tr>
           <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">Web 
		   Informativa:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txWEB" runat="server" MaxLength="100" Width="400px"></asp:TextBox>
		</td> 
         </tr>


		  <tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">País:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:DropDownList ID="ddlPAI" runat="server">
              </asp:DropDownList></td>
         </tr>
         <!--
           <tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">ERP:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:DropDownList ID="ddlERP" runat="server">
              </asp:DropDownList></td>
         </tr>

		
		
		<tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">Sociedad:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txSOC" runat="server" MaxLength="4" Width="40px"></asp:TextBox>
		</td> 
         </tr>
         
		<tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">Organizacin de Ventas:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txORG" runat="server" MaxLength="4" Width="40px"></asp:TextBox>
		</td> 
         </tr>


			<tr>
           <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">Clase de Aviso (PQR):</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txCLA" runat="server" MaxLength="4" Width="40px"></asp:TextBox>
		</td> 
         </tr>
	
		<tr>
           <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">% 
			Mximo de Desc. en Sales Pro:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txPMD" runat="server" MaxLength="4" Width="40px"></asp:TextBox>
		</td> 
         </tr>

	<tr>
           <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">
			Nro. de Parte Generico Sales PRO:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txPGE" runat="server" MaxLength="25" Width="200px"></asp:TextBox>
		</td> 
         </tr>

		-->
			<tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">
		  Módulos:</p></td>
          <td class="TDD" width="70%" align="left" >
		<asp:CheckBox ID="chVentas" Text="Ventas" runat="server" Font-Bold="True" Font-Size="X-Small" ></asp:CheckBox>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
		<asp:CheckBox ID="chPagos" Text="Pagos" runat="server" Font-Bold="True" Font-Size="X-Small" ></asp:CheckBox>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--
		<asp:CheckBox ID="chPqr" Text="PQR" runat="server" Font-Bold="True" Font-Size="X-Small" ></asp:CheckBox>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:CheckBox ID="chSalesPro" Text="Sales PRO" runat="server" Font-Bold="True" Font-Size="X-Small" ></asp:CheckBox>-->

		</td> 
         </tr>
<!--
	 <tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">Modelo Sales PRO:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:DropDownList ID="ddlMSP" runat="server">
              </asp:DropDownList></td>
         </tr>-->
         
           <tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">Logo:</p></td>
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
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">
		  Colores:</p></td>
          <td class="TDD" width="70%" align="left" >
		  <asp:TextBox id="txCO1" runat="server" MaxLength="7" Width="65px" CssClass="color {hash:true}"></asp:TextBox>
		 
 		  &nbsp;&nbsp; &nbsp;&nbsp;
		 
 		  <asp:TextBox id="txCO2" runat="server" MaxLength="7" Width="65px" CssClass="color {hash:true}"></asp:TextBox>
		</td> 
         </tr>

		 <tr>
          <td class="TDS" style="width: 31%" ><p CLASS="P1" align="left">
		  Inactivar Sitio Web:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:DropDownList ID="ddlSTS" runat="server">
              </asp:DropDownList></td>
         </tr>
         
        
		 

         <tr>
          <td class="TDS" height="25" style="width: 31%" ><p CLASS="P1" align="left">
		  Fecha de Actualización:</p></td>
          <td class="TDD" width="70%" align="left" >
              <asp:Label ID="lbFAC" runat="server" Font-Bold="True"></asp:Label>
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

