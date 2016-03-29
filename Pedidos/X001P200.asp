<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="es" />

<link rel=stylesheet type="text/css" href="X001Z900.CSS">



<!--#include file="X001Z001.INC"-->
</HEAD>

<%

	wPAR = Request.QueryString("PAR") 

	IF wPAR = "1" THEN
		wTIT = "Informe Fuerza de Ventas"
		wURL = "X001P201.asp"
	END IF
	
	IF wPAR = "2" THEN
		wTIT = "Informe Oportunidades Descalificadas"
		wURL = "X001P202.asp"
	END IF 
	
	IF wPAR = "3" THEN
		wTIT = "Informe Razones de Insatisfacción"
		wURL = "X001P203.asp"
	END IF
	
	IF wPAR = "4" THEN
		wTIT = "Informe Consolidado"
		wURL = "X001P204.asp"
	END IF 
	
	wMES = Right("00" & Month(Now),2)
	
		
	Select Case wMES
		Case "01"
			wSEL01 = "Selected"
		Case "02"
			wSEL02 = "Selected"
		Case "03"
			wSEL03 = "Selected"
		Case "04"
			wSEL04 = "Selected"
		Case "05"
			wSEL05 = "Selected"
		Case "06"
			wSEL06 = "Selected"
		Case "07"
			wSEL07 = "Selected"
		Case "08"
			wSEL08 = "Selected"
		Case "09"
			wSEL09 = "Selected"	
		Case "10"
			wSEL10 = "Selected"
		Case "11"
			wSEL11 = "Selected"
		Case "12"
			wSEL12 = "Selected"			
	End Select 

	
	
	%>
<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" topmargin="0" bottommargin="0"  >
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" target="_blank" >

  <table  width="919" border="0" align="center" bgcolor="#ffffff" height="100%" >
<tr><td valign="top" align="center"  >
<p style="margin-top:30" >

    
    
        <table cellspacing="0" cellpadding="0" width="607" bordercolor="#CACACA"  bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" id="table6" border="1">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="6" >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="30" ><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Periodo:</p></td>
          <td class="TDD" width="69%" ><p CLASS="P1">
          
          <select size="1" name="MES" type="select-one"  >
	<option value="01" <%=wSEL01%> >Enero</option>
	<option value="02" <%=wSEL02%> >Febrero</option>
	<option value="03" <%=wSEL03%> >Marzo</option>
	<option value="04" <%=wSEL04%> >Abril</option>
	<option value="05" <%=wSEL05%> >Mayo</option>
	<option value="06" <%=wSEL06%> >Junio</option>
	<option value="07" <%=wSEL07%> >Julio</option>
	<option value="08" <%=wSEL08%> >Agosto</option>
	<option value="09" <%=wSEL09%> >Septiembre</option>
	<option value="10" <%=wSEL10%> >Octubre</option>
	<option value="11" <%=wSEL11%> >Noviembre</option>
	<option value="12" <%=wSEL12%> >Diciembre</option>
	</select>
	    <select size="1" name="ANO" type="select-one"  >
	    <option value="<%=year(now)%>" ><%=year(now)%></option>
	    <option value="<%=year(now)-1%>" ><%=year(now)-1%></option>
	    </select> 
          </P></td>
         </tr>

	<tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Asesor:</p></td>
          <td class="TDD" width="69%" ><p CLASS="P1">
          
          	<SELECT name="VENDEDOR" style="font-family: Tahoma; font-size: 8pt" size="1" onchange="Javascript:enviar()" ondblclick="Javascript:enviar()" > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									
									SQL = " SELECT * FROM X300AF020 " 										
								    SQL = SQL & " WHERE A300020CCI = '" &  Session("glCiaInternet") & "'"																	
									If Session("glTipoUsuario") = "V" Then
									   SQL = SQL & " AND A300020CVE = '" &  Session("glCodVendedor") & "'"
									End If 
									SQL = SQL & " ORDER BY  A300020CVE " 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									IF Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "D" Then
									   Response.write "<OPTION value=000>TODOS</OPTION>" 					
									End If					
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300020CVE"))
										wDES = trim(rstQuery.Fields("A300020NOM"))							
										IF TRIM(wVEN) = wCOD THEN
										   wSEL = " selected"										   
										  ELSE 
										   wSEL = ""
										END IF 
										Response.write "<OPTION value=" & wCOD & wSEL & " >" & wCOD & " - " & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
									

					</SELECT>          </P></td>
         </tr>


 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          <input type="submit" value="Visualizar">   
          
          <input type="button" value="Regresar" onclick="window.open('X001A006.asp', 'main');" >   
          </td>
         </tr>


		 
	</table>
	</td>	
	</TR>	
	</table>
	
	</p> 
	</td> 
	</tr> 
	</table> 
	
	
</FORM>
</BODY>
</HTML>