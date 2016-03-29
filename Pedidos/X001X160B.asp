<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel=stylesheet type="text/css" href="X001Z900.css">

</HEAD>
<BODY  ONLOAD="document.FrmBuscar.CODIGO.focus()" topmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="17" rightmargin="0" bottommargin="0">
<%


	wURLTIT = Request.QueryString("URLTIT") 
	wCLA001 = Request.QueryString("CLA001") 
	wCLA002 = Request.QueryString("CLA002") 
	wTITULO = "Busqueda de Productos"
	wURL = "X001X160BS.ASP?URLTIT=" & wURLTIT
	
%>

<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURL%>" target="main">
<div align="center">
<table width="920" bgcolor="#000000" border="0" cellpadding="0" cellspacing="0" width="100%"  height="100%"  >
<tr>
<td bgcolor="#FFFFFF">
<div align="center">
	&nbsp;<table border="1" width="60%" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF"  >
  <tr>
    <td width="100%" bgcolor="#FFFFFF">
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
          <td width="32%" >
            <p align="right"><font color="#000000">Código:</font></p>
          </td>
          <td width="66%" >
		<INPUT NAME="CODIGO" size=35 value="" tabindex="1">
          </td>
      </tr>
       <tr>
          <td width="32%" >
            <p align="right"><font color="#000000">Descripción:</font></p>
          </td>
          <td width="66%" >
		<INPUT NAME="DESCRIPCION" size=35 value="" tabindex="1">
          </td>
        </tr>

        <tr>
          <td width="32%" >
            <p align="right"><font color="#000000">Línea:</font></p>
          </td>
          <td width="66%" >
			<SELECT name="FAMILIA" type="select-one" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT B300120NPS, B300120DEC FROM X300BF120 " 			
									SQL = SQL & " WHERE B300120CCI = '" & Session("glCiaInternet") & "'"												
									SQL = SQL & " ORDER BY B300120DEC "
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=000>TODAS</OPTION>" 										
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("B300120NPS"))
										wDES = LEFT(trim(rstQuery.Fields("B300120DEC")),25)
										Response.write "<OPTION value=" & wCOD & ">" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING										
																	
									%>
					</SELECT>
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

      <P align=center>
	<INPUT TYPE="submit" NAME="send" VALUE="Buscar" tabindex="2"> 
	<INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:history.back()'>
      </P>
<P align=center>
	&nbsp;</P>
    
      </div> 
      </td>
</tr>

</table>
</div> 
</FORM>
</BODY>
</HTML>

<html></html>