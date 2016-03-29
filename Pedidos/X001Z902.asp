<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel=stylesheet type="text/css" href="X001Z900.css">

</HEAD>
<BODY  ONLOAD="document.FrmBuscar.BUSCAR.focus()" topmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="18" rightmargin="0" bottommargin="0" >
<%


	wURLTIT = Request.QueryString("URLTIT") 
	wTITULO = "Busqueda de " & wURLTIT
%>

<FORM NAME="FrmBuscar" METHOD="post" ACTION="X001Z902S.ASP" >


<div align="center">


<table width="919" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%"  >
<tr>
<td bgcolor="#FFFFFF">
<div align="center">
&nbsp;<table border="1" width="50%" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF"  >
  <tr>
    <td width="100%" bgcolor="#FFFFFF"  >
      <table border="0" width="100%" bgcolor="<%=Request.Cookies("CAR")("Color2")%>">
        <tr>
        <td width="10%" align="right">
		<IMG alt ="" border=0 src="images/Buscar2.ico" >
		</td>
		<td width="90%" >
		<p align="left"><font color="white">
		<%=wTITULO%></font></p>
		</td>
		</tr>
		</table>
	</td>
	</tr>		
  <tr>
    <td width="100%">
      <table border="0" width="100%" bgcolor="#E9E9E9">
        <tr>
          <td width="25%" >
            <p align="right"><font color="#000000">Buscar:</font></p>
          </td>
          <td width="75%" >
		<INPUT NAME="BUSCAR" size=35 value="<%=Session("glBusqueda")%>" tabindex="1">
          </td>
        </tr>
        <tr>
          <td width="100%" colspan=2>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

      </div>

      </div>

      <P align=center>
	<INPUT TYPE="submit" NAME="send" VALUE="Buscar" tabindex="2"> 
	<INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:history.back()'>
      </P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>
<P align=center>
	&nbsp;</P>    
</td>
</tr>

</table>
</div>
</FORM>
</BODY>
</HTML>

<html></html>