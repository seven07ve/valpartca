<%@ Language=VBScript %>
<% Response.Expires = 0 %>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Y004.PRC"-->

<script language="Javascript">

function enviar() {

	document.frmGral.submit(); 
	
}

</script>
<!--#include file="X001Z001.INC"-->
</HEAD>

<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="18" rightmargin="0"  topmargin="0"   >

<%

	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wURLW = Request.ServerVariables("URL")
	'wBody = "<body>"
	'Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 
	
	wVEN = Request.Form("VENDEDOR") 

	wTIT = "Estadisticas de Ventas" 

    If trim(wVEN) = "" Then	
       If Session("glTipoUsuario") = "A" Then
       	  wVEN = "000"       	  	
       End If 	
       If Session("glTipoUsuario") = "G" Then
       	  wVEN = "000"       	  	
       End If 	
       If Session("glTipoUsuario") = "D" Then
       	  wVEN = "000"       	  	
       End If 	
       If Session("glTipoUsuario") = "V" Then
     	  wVEN = Session("glCodVendedor")
       End If 		
    End If 

	'Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G" 
	'Session("glCodVendedor")
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	
	SQL = "SELECT Z300002MON " 	
	SQL = SQL & " FROM X300ZF002 "
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "		
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	If NOT rstQuery.EOF Then	
		wMON = trim(rstQuery.Fields("Z300002MON"))
	End If
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	
	SQL = "SELECT  D300003POS, D300003TPO, (D300003DEM * D300003CON) AS D300003DEM, "
    SQL = SQL & " (D300003PRD * D300003CON) AS D300003PRD, (D300003FAC * D300003CON) AS D300003FAC, "
    SQL = SQL & " (D300003INS * D300003CON) AS D300003INS, (D300003PRE * D300003CON) AS D300003PRE, "
    SQL = SQL & " (D300003FOR * D300003CON) AS D300003FOR, D300003FED, D300003FEH "
    SQL = SQL & " FROM X300DF003"
    SQL = SQL & " WHERE D300003CCI = '" & Session("glCiaInternet") & "' "	
    If Trim(wVEN) <> "000" Then
       SQL = SQL & " AND "
       SQL = SQL & " D300003CVE = '" & Trim(wVEN) & "'"
    End If
    'response.write SQL 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	Do While Not rstQuery.EOF
		If Trim(wVEN) <> "000" Then
           wPOS = Trim(rstQuery.Fields("D300003POS"))
          Else
           wPOS = "0"
        End If
        wTPO = Trim(rstQuery.Fields("D300003TPO"))
        wDEM = CLng(rstQuery.Fields("D300003DEM"))
        wINS = CLng(rstQuery.Fields("D300003INS"))
        wFAC = CLng(rstQuery.Fields("D300003FAC"))
        wPRE = CLng(rstQuery.Fields("D300003PRE"))
        wFED = rstQuery.Fields("D300003FED")
        wFEH = rstQuery.Fields("D300003FEH")
                
        wTDEM = wTDEM + wDEM
        wTINS = wTINS + wINS
        wTFAC = wTFAC + wFAC
        wTPRE = wTPRE + wPRE

		rstQuery.MoveNext
    Loop
    rstQuery.Close
    Set rstQuery = Nothing
    
    If wTPO > 0 Then
       wDIA_FED = Day(wFED)
       If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
       wMES_FED = Month(wFED)
       If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
       wANO_FED = Right(Year(wFED), 2)
       wFED = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED
       wDIA_FEH = Day(wFEH)
       If Len(Trim(wDIA_FEH)) = "1" Then: wDIA_FEH = "0" & wDIA_FEH: End If
       wMES_FEH = Month(wFEH)
       If Len(Trim(wMES_FEH)) = "1" Then: wMES_FEH = "0" & wMES_FEH: End If
       wANO_FEH = Right(Year(wFEH), 2)
       wFEH = wDIA_FEH & "/" & wMES_FEH & "/" & wANO_FEH
       Else
       wFED = "0"
       wFEH = "0"
    End If
    
    
    IF ISNULL(wTPRE) OR wTPRE = 0 THEN
	    wPPE = FormatNumber(0, 1)
	    wPPF = FormatNumber(0, 1)
	ELSE
	    wPPE = FormatNumber((wTDEM / wTPRE) * 100, 1)
	    wPPF = FormatNumber((wTFAC / wTPRE) * 100, 1)		    	
    END IF  
    
    
    wSDEM = FormatNumber(wTDEM,0) 'Convertir_X201CV003(wTDEM)
    wSINS = FormatNumber(wTINS,0) 'Convertir_X201CV003(wTINS)
    wSFAC = FormatNumber(wTFAC,0) 'Convertir_X201CV003(wTFAC)
    wSPRE = FormatNumber(wTPRE,0) 'Convertir_X201CV003(wTPRE)

	
	
	Function Convertir_X201CV003(wVAL)
     
     Dim wVAL2 
     Dim wVAL3 
          
     wVAL3 = wVAL
       
     
     If Len(Trim(wVAL)) >= "1" And Len(Trim(wVAL)) <= "6" Then
       If wVAL <= CLng("0") Then: wVAL2 = "0.0": End If
       If wVAL >= CLng("1") And wVAL <= CLng("199999") Then: wVAL2 = "0.1": End If
       If wVAL >= CLng("200000") And wVAL <= CLng("299999") Then: wVAL2 = "0.2": End If
       If wVAL >= CLng("300000") And wVAL <= CLng("399999") Then: wVAL2 = "0.3": End If
       If wVAL >= CLng("400000") And wVAL <= CLng("499999") Then: wVAL2 = "0.4": End If
       If wVAL >= CLng("500000") And wVAL <= CLng("599999") Then: wVAL2 = "0.5": End If
       If wVAL >= CLng("600000") And wVAL <= CLng("699999") Then: wVAL2 = "0.6": End If
       If wVAL >= CLng("700000") And wVAL <= CLng("799999") Then: wVAL2 = "0.7": End If
       If wVAL >= CLng("800000") And wVAL <= CLng("899999") Then: wVAL2 = "0.8": End If
       If wVAL >= CLng("900000") And wVAL <= CLng("999999") Then: wVAL2 = "0.9": End If
    End If
    
    
    If CLng(Len(Trim(wVAL3))) >= CLng("7") Then
              
       If Len(Trim(wVAL3)) = "7" Then: wVAL2 = Left(Trim(wVAL3), 1): End If
       If Len(Trim(wVAL3)) = "8" Then: wVAL2 = Left(Trim(wVAL3), 2): End If
       If Len(Trim(wVAL3)) = "9" Then: wVAL2 = Left(Trim(wVAL3), 3): End If
       If Len(Trim(wVAL3)) = "10" Then: wVAL2 = Left(Trim(wVAL3), 4): End If
       If Len(Trim(wVAL3)) = "11" Then: wVAL2 = Left(Trim(wVAL3), 5): End If
       If Len(Trim(wVAL3)) = "12" Then: wVAL2 = Left(Trim(wVAL3), 6): End If
       
       wVAL3 = Right(wVAL3, 6)
       wVAL3 = CLng(wVAL3)
            
       If wVAL3 >= CLng("000000") And wVAL3 <= CLng("099999") Then: wVAL2 = wVAL2 & ".0": End If
       If wVAL3 >= CLng("100000") And wVAL3 <= CLng("199999") Then: wVAL2 = wVAL2 & ".1": End If
       If wVAL3 >= CLng("200000") And wVAL3 <= CLng("299999") Then: wVAL2 = wVAL2 & ".2": End If
       If wVAL3 >= CLng("300000") And wVAL3 <= CLng("399999") Then: wVAL2 = wVAL2 & ".3": End If
       If wVAL3 >= CLng("400000") And wVAL3 <= CLng("499999") Then: wVAL2 = wVAL2 & ".4": End If
       If wVAL3 >= CLng("500000") And wVAL3 <= CLng("599999") Then: wVAL2 = wVAL2 & ".5": End If
       If wVAL3 >= CLng("600000") And wVAL3 <= CLng("699999") Then: wVAL2 = wVAL2 & ".6": End If
       If wVAL3 >= CLng("700000") And wVAL3 <= CLng("799999") Then: wVAL2 = wVAL2 & ".7": End If
       If wVAL3 >= CLng("800000") And wVAL3 <= CLng("899999") Then: wVAL2 = wVAL2 & ".8": End If
       If wVAL3 >= CLng("900000") And wVAL3 <= CLng("999999") Then: wVAL2 = wVAL2 & ".9": End If
       
    End If
     
    Convertir_X201CV003 = wVAL2
     
End Function


	wURL = "X001X115.asp"
	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >

    <div align="center">


       <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center"  height="100%">
<tr>
<td valign="top"  >

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">



    &nbsp;<table BORDER="1" WIDTH="545" cellspacing="0" align="center"   cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 2px; padding-left: 2px; padding-right: 2px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="5" >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="22"><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="25%" ><p CLASS="P1" align="left">Vendedor:</p></td>
          <td class="TDD" width="73%" ><p CLASS="P1">
					<SELECT name="VENDEDOR" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt" size="1" onchange="Javascript:enviar()" ondblclick="Javascript:enviar()" > 
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
									

					</SELECT>
          </P></td>
         </tr>

		 <tr>
          <td class="TDS" width="25%" ><p CLASS="P1" align="left">Posición en 
			Demanda:</p></td>
          <td class="TDD" width="73%" style="font-size: 10pt; font-family: Tahoma; text-align:right"><%=wPOS%>

          </td>
         </tr>

		 <tr>
          <td class="TDS" width="98%" colspan="2" height="21" >
			<p CLASS="P1" align="center"><b><span style="font-size: 11pt">Periodo desde: <%=wFED%> hasta: <%=wFEH%></span></b></p></td>
         </tr>


		 <tr>
          <td class="TDS" width="25%" ><p CLASS="P1" align="left">Pedidos:</p></td>
          <td class="TDD" width="73%" style="font-size: 10pt; font-family: Tahoma; text-align:right">
			<%=wSDEM & " " & wMON %></td>
         </tr>

		 <tr>
          <td class="TDS" width="25%" ><p CLASS="P1" align="left">Facturado:</p></td>
          <td class="TDD" width="73%" style="font-size: 10pt; font-family: Tahoma; text-align:right"><%=wSFAC & " " & wMON %></td>
         </tr>

		 <tr>
          <td class="TDS" width="25%" ><p CLASS="P1" align="left">B/O Pendiente:</p></td>
          <td class="TDD" width="73%" style="font-size: 10pt; font-family: Tahoma; text-align:right">
				<%=wSINS & " " & wMON %></td>
         </tr>

		 <tr>
          <td class="TDS" width="25%" ><p CLASS="P1" align="left">Presupuesto 
			del Mes:</p></td>
          <td class="TDD" width="73%" style="font-size: 10pt; font-family: Tahoma; text-align:right">
				<%=wSPRE & " " & wMON %></td>
    
         </tr>
<tr>
          <td class="TDS" width="98%" colspan="2" height="23" >
			<p CLASS="P1" align="center"><b><span style="font-size: 11pt">% Cumplimiento del Presupuesto</span></b></p></td>
    
         </tr>
	 <tr>
          <td class="TDS" width="25%" ><p CLASS="P1" align="left">En Pedidos:</p></td>
          <td class="TDD" width="73%" style="font-size: 10pt; font-family: Tahoma; text-align:right">
				<%=wPPE & " %" %></td>
    
         </tr>
	 <tr>
          <td class="TDS" width="25%" ><p CLASS="P1" align="left">En 
			Facturación:</p></td>
          <td class="TDD" width="73%" style="font-size: 10pt; font-family: Tahoma; text-align:right">
				<%=wPPF  & " %" %></td>
    
         </tr>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          <input type="button" name="Imprimir" Value="Imprimir" onclick="javascript:window.print()">         
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
	
	<p>&nbsp;</td>
</tr> 
<!--
<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>-->
</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
</table>

	</div>
</FORM>
</BODY>
</HTML>
