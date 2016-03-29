<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<link rel=stylesheet type="text/css" href="X001Z900.css">

</HEAD>
<BODY  ONLOAD="document.FrmBuscar.CODIGO.focus()" topmargin="0" >
<%


	wURLTIT = Request.QueryString("URLTIT") 
	wCLA001 = Request.QueryString("CLA001") 
	wCLA002 = Request.QueryString("CLA002") 
	wTITULO = "Busqueda de Productos"
	wURL = "X001A103BS.ASP?URLTIT=" & wURLTIT
	wURL = wURL & "&CLA001=" & wCLA001  
	wURL = wURL & "&CLA002=" & wCLA002  
%>

<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURL%>">

<br>
<br>
<table border="1" width="50%" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF" align="center"  >
  <tr>
    <td width="100%" >
      <table border="0" width="100%" bgcolor="#FE9900">
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
            <p align="right"><font color="#000000">Código:</font></p>
          </td>
          <td width="75%" >
		<INPUT NAME="CODIGO" size=35 value="<%=Session("glBusqueda1")%>" tabindex="1">
          </td>
      </tr>
       <tr>
          <td width="25%" >
            <p align="right"><font color="#000000">Descripción:</font></p>
          </td>
          <td width="75%" >
		<INPUT NAME="DESCRIPCION" size=35 value="<%=Session("glBusqueda2")%>" tabindex="1">
          </td>
        </tr>

        <tr>
          <td width="25%" >
            <p align="right"><font color="#000000">Familia:</font></p>
          </td>
          <td width="75%" >
			<SELECT name="FAMILIA" type="select-one" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									SQL = " SELECT * FROM X300BF121 " 																		
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=000>TODOS</OPTION>" 										
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("B300121NLP"))
										wDES = LEFT(trim(rstQuery.Fields("B300121DEC")),25)

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

</FORM>
</BODY>
</HTML>

<html></html>