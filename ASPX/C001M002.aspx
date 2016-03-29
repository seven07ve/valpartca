<%@ Page Language="VB" AutoEventWireup="false" CodeFile="C001M002.aspx.vb" Inherits="C001M002" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <title>Untitled Page</title>

<style type="text/css">
input,textarea, select{
	width:auto;
	border:1px solid #999;
	-webkit-border-radius:3px;-khtml-border-radius:3px;-moz-border-radius:3px;border-radius:3px;
	margin:0;
	padding:5px;
	background:#fff;
	background:-webkit-gradient(linear, left top, left 25, from(#fff), color-stop(6%, #eee), to(#fff));
	background:-moz-linear-gradient(top, #fff, #eee 2px, #fff 25px);
	box-shadow:rgba(0,0,0, 0.1) 0px 0px 8px;
	-moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
	-webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;

}

input:focus {
	border-color:#333;
	background:#fff;
}

</style>


</head>

<script language="JavaScript">
    // Validar los campos
    function validarEmail() {
        var hayAlgo = true;

        if (form1.txEmail.value == "") {
            hayAlgo = false;
            alert("La cuenta de correo no puede estar en blanco.");
            form1.txEmail.focus();
            return false;
        }
        // validar la cuenta de correo usando una expresi&#65533;n regular (RegExp)
        if (form1.txEmail.value.search(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/ig)) {
            hayAlgo = false;
            alert("La cuenta no es v&#65533;lida, debes escribirla de forma: nombre@servidor.dominio");
            form1.txEmail.select();
            form1.txEmail.focus();
            return false;
        }
    }

    function validar() {

  
        
        if (form1.txEmpresa.value == "") {
            alert("Por favor, ingrese Empresa.");
            form1.txEmpresa.focus();
            return false;
        }

        if (form1.txPersona.value == "") {
            alert("Por favor, ingrese Nombre y Apellido.");
            form1.txPersona.focus();
            return false;
        }
        
        if (form1.txRif.value == "") {
            alert("Por favor, ingrese RIF.");
            form1.txRif.focus();
            return false;
        }


        if (form1.ddlEstado.value == "0") {
            alert("Por favor, Seleccione El Estado.");
            form1.ddlEstado.focus();
            return false;
        }

        if (form1.txCiudad.value == "") {
            alert("Por favor, ingrese la Ciudad.");
            form1.txCiudad.focus();
            return false;
        }

        if (form1.txTelefono.value == "") {
            alert("Por favor, ingrese El Tel&#65533;fono.");
            form1.txTelefono.focus();
            return false;
        }

        if (form1.txEmail.value == "") {
            alert("La cuenta de correo no puede estar en blanco.");
            form1.txEmail.focus();
            return false;
        }

        if (form1.txComentario.value == "") {
            alert("Por favor, ingrese el Comentario.");
            form1.txComentario.focus();
            return false;
        }

  

        return true

    }
</script>

<body topmargin="20" bottommargin="0" leftmargin="0" rightmargin="20">
    <form id="form1" runat="server">
    <div>
        
              <table cellpadding="0"  cellspacing="0" border=0 >
               <tr>
    <td style="width: 252px; height: 30px; text-align: right;" valign="middle">
        <span style="font-size: 10pt; font-family: Arial; color: #000000;"><strong>
		&nbsp;Empresa: 
        </strong></span>
                   &nbsp;
        <td style="width: 236px; height: 30px;" valign="middle">
        <asp:TextBox ID="txEmpresa" runat="server" Font-Names="arial" Font-Size="10pt" Width="217px"></asp:TextBox>
        </td> 
        </tr> 
        
        <tr>
    <td style="width: 252px; height: 30px; text-align: right;" valign="middle">
        <span style="font-size: 10pt; font-family: Arial; color: #000000;"><strong>
		&nbsp;RIF: 
        </strong></span>
                   &nbsp;
        <td style="width: 236px; height: 30px;" valign="middle">
        <asp:TextBox ID="txRif" runat="server" Font-Names="arial" Font-Size="10pt" Width="217px"></asp:TextBox>
        </td> 
        </tr> 

    <tr>
    <td style="width: 252px; height: 30px; text-align: right;" valign="middle">
        <span style="font-size: 10pt; font-family: Arial; color: #000000;"><strong>
		Nombre y Apellido: </strong></span>&nbsp;
        </td>
        <td style="width: 236px; height: 30px;" valign="middle">
        <asp:TextBox ID="txPersona" runat="server" Font-Names="arial" Font-Size="10pt" Width="217px"></asp:TextBox>
       </td>         
       
   </tr>
   
                 <tr>
                      <td style="width: 303px; height: 30px; text-align: right;">
                           <strong><span style="color:#000000;"><span style="font-size: 10pt; font-family: Arial">
						   País: </span>
            			   &nbsp;</span></strong></td>
                      <td style="width: 236px">
                          <asp:DropDownList ID="ddlPais" runat="server" AutoPostBack="True" Width="220px" 
                              BackColor="#ffffff" Font-Bold="True">
                          </asp:DropDownList></td>
                  </tr>
                  <tr>
                      <td style="width: 303px; height: 30px; text-align: right;">
                          <strong><span style="color:#000000;"><span style="font-size: 10pt; font-family: Arial">
						  Estado: </span>
            			  &nbsp;</span></strong></td>
                      <td style="width: 236px; height: 21px">
                          <asp:DropDownList ID="ddlEstado" runat="server" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged"
                              Width="132px" AutoPostBack="True" BackColor="#ffffff" Font-Bold="True">
                          </asp:DropDownList>
                          <asp:TextBox ID="txEstado" runat="server" Font-Names="Arial" Font-Size="Small" Visible="False"
                              Width="119px" BackColor="#ffffff" Font-Bold="True"></asp:TextBox></td>
                  </tr>
                  <tr>
                      <td style="width: 303px; height: 30px; text-align: right;">
                           <strong><span style="color:#000000;"><span style="font-size: 10pt; font-family: Arial">
						   Ciudad: </span>
            			   &nbsp;</span></strong>
                      <td style="width: 236px">
                          <asp:TextBox ID="txCiudad" runat="server" Font-Names="Arial" Font-Size="Small" 
                              Width="217px" BackColor="#ffffff" Font-Bold="True"></asp:TextBox></td>
                  </tr>
        
   
        <tr>
    <td style="width: 252px; height: 30px; text-align: right;" valign="middle">
        <strong><span style="color:#000000;"><span style="font-size: 10pt; font-family: Arial">
		Teléfono de Contacto: </span>
            &nbsp;</span></strong>
        <td style="width: 236px; height: 30px;" valign="middle">
        <asp:TextBox ID="txTelefono" runat="server" Font-Names="arial" Font-Size="10pt" Width="217px"></asp:TextBox>
        </td> </tr> 
        <tr>
            <td style="width: 252px; height: 30px; text-align: right;" valign="middle">
                <strong><span style="color:#000000;">
                &nbsp;<span style="font-size: 10pt; font-family: Arial">Correo 
				Electrónico:</span>
                </span></strong>
                &nbsp;</td>
            <td style="width: 236px; height: 30px;" valign="middle">
                <asp:TextBox ID="txEmail" runat="server" Font-Names="arial" Font-Size="10pt" Width="217px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 252px; text-align: right;" valign="middle">
                <span style="font-size: 10pt; font-family: Arial"><span style="color:#000000;"><strong>
                    Comentario:</strong></span>
                </span>&nbsp;</td>
            <td style="width: 236px; " valign="middle">
                <asp:TextBox ID="txComentario" Font-Names="arial" Font-Size="10pt" runat="server" Height="70px" TextMode="MultiLine"
                    Width="217px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align:right;" colspan="2" valign="bottom">
                <br />
                <asp:Button ID="btnEnviar"  runat="server" Font-Names="Tahoma" Font-Size="Small"  Text="Enviar" CausesValidation="False" style="border-style:solid; border-width:1px; font-family: Tahoma; font-size: 10pt; color:#000000;" Font-Bold="True" OnClientClick="return validar()"/>
                <!--<asp:Button ID="btnRegresar" runat="server" Font-Names="Tahoma" Font-Size="Small"  Text="Regresar" OnClientClick="return window.open('../','_parent');" style="border-style:solid; border-width:1px; font-family: Tahoma; font-size: 10pt; background-color:#083473; color:#FFFFFF" Visible="False"/>-->
                </td>
            
        </tr>
                  <tr>
                      <td colspan="2" style="height: 26px; text-align: center">
                          <asp:Label ID="lbMensaje" runat="server" Font-Names="Arial" Font-Size="Small" Text="Mensaje" Font-Bold="True" ForeColor="#0000C0" Visible="False"></asp:Label>
                          
                      </td>
                  </tr>
        </table>
                
       
        </div>
    </form>
</body>
</html>