<link rel=stylesheet type="text/css" href="X001Z900.CSS">



<%

	'CLIENTES NO ATENDIDOS
	  

    
	strCnn	= Application("XDTA300_ConnectionString")

	IF LEN(TRIM(wCVE)) > 0 THEN

	SQL = "SELECT A300002CCL, A300002RSO, A300002DIL, A300002NT1 " 
	SQL = SQL & " FROM X300AF002 WHERE "
	SQL = SQL & " A300002CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " A300002CIA = '" & Session("glCia") & "' AND  "
	SQL = SQL & " A300002CVE = '" & wCVE & "' AND "
	SQL = SQL & "  A300002CCL NOT IN "
	SQL = SQL & "  (SELECT B300200CCL FROM X300BF200 WHERE "
	SQL = SQL & "   B300200CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & "   B300200CIA = '" & Session("glCia") & "' AND  "
	SQL = SQL & "   B300200CVE = '" & wCVE & "' AND "
	SQL = SQL & "   B300200FEC >= '" & wFED & "' AND "
	SQL = SQL & "   B300200FEC <= '" & wFEH & "' )"	
	SQL = SQL & " ORDER BY A300002CCL, A300002RSO "
    'Response.Write sql
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0
	wC= CHR(34)
	wC01 = ""
	wCuenta = 0
	DO WHILE NOT rstQuery.EOF 
	
		IF wCuenta = 0 THEN %>
		
		<table align="center" BORDER="1" WIDTH="99%" cellspacing="0" cellpadding="4"  >
		 <TR>
		 <td CLASS="TDT" colspan=4 height="30" >Clientes No Atendidos</td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="8%" ><p CLASS="P1" align="center">Código</p></td>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Descripción</p></td>
          <td class="TDS" width="12%" ><p CLASS="P1" align="left">Teléfono</p></td>
          <td class="TDS" width="50%" ><p CLASS="P1" align="left">Dirección</p></td>
         </tr>
		
		<%END IF
	
		If wC01 <> trim(rstQuery.Fields(0)) Then

			wC01 = trim(rstQuery.Fields(0))
			wC02 = trim(rstQuery.Fields(1))		
			wC03 = trim(rstQuery.Fields(2))		
			wC04 = trim(rstQuery.Fields(3))		

			Response.Write "<tr>"
			Response.Write "<td class=" & wC & "TDD" & wC & " width=" & wC & "8%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=" & wC & "center" & wC & ">" & wC01 & "</p></td>"
	        Response.Write "<td class=" & wC & "TDD" & wC & " width=" & wC & "30%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=left>" & wC02 & "</p></td>"
	        Response.Write "<td class=" & wC & "TDD" & wC & " width=" & wC & "12%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=left>" & wC04 & "</p></td>"
	        Response.Write "<td class=" & wC & "TDD" & wC & " width=" & wC & "50%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=left>" & wC03 & "</p></td>"
			Response.Write "</tr>"
			wCuenta = wCuenta + 1
		
		End if

		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	
	IF wCuenta > 0 THEN
	
		wC01 = wCuenta
		wC02 = ""
		wC03 = ""
		wC04 = ""
		wCLASS = "TD1"

		
		Response.Write "<tr>"
		Response.Write "<td class=" & wC & wCLASS & wC & " width=" & wC & "8%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=" & wC & "center" & wC & ">" & wC01 & "</p></td>"
        Response.Write "<td class=" & wC & wCLASS & wC & " width=" & wC & "30%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=left>" & wC02 & "</p></td>"
        Response.Write "<td class=" & wC & wCLASS & wC & " width=" & wC & "12%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=left>" & wC04 & "</p></td>"
        Response.Write "<td class=" & wC & wCLASS & wC & " width=" & wC & "50%" & wC & " ><p CLASS=" & wC & "PH" & wC & " align=left>" & wC03 & "</p></td>"
		Response.Write "</tr>"

	
	END IF 

	END IF 


	%>


	</table>

<br>



<%
		'DOCUMENTOS DEMORADOS
		wNOMTAB = "X300CQ204"
		wPAR = wPAR & "&CAMC01=B300120CPR" 
		wCAMC01 = "C300204CCL"
		wCAMC02 = "C300204NFA" 
		wCAMC03 = "A300002RSO" 
		wCAMC04 = "C300204MOT"	
		wCAMC05 = "C300204TDO"	
		wCAMC06 = "C300204FPR"	
		wCAMC07 = "C300204FVF"	
		wCAMC08 = "C300204SNV"
		wCAMC09 = "C300204SEA"
		wCAMC10 = "C300204SEB"
		wCAMC11 = "C300204SEC"	
		wCAMC12 = "C300204SED"	
		
		
		
		
		
	
		SQL = "SELECT " & wCAMC01 & ", " & wCAMC02 
		SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04 
		SQL = SQL & ", " & wCAMC05 & ", " & wCAMC06 
		SQL = SQL & ", " & wCAMC07 & ", " & wCAMC08
		SQL = SQL & ", " & wCAMC09 & ", " & wCAMC10  
		SQL = SQL & ", " & wCAMC11 & ", " & wCAMC12  
		SQL = SQL & ", '0','0','0' as STV "
		SQL = SQL & " FROM " &  wNOMTAB & " A " 		
		SQL = SQL & " WHERE "
		SQL = SQL & " C300204CCI ='" & Session("glCiaInternet") & "'  "
		SQL = SQL & " AND C300204CIA ='" & Session("glCia") & "' "		
		SQL = SQL & " AND C300204CVE ='" & wCVE & "' "
		SQL = SQL & " AND C300204TDO ='CHD' "
		SQL = SQL & " AND DATEDIFF(day, C300204FPR, Getdate()) >= 3 "
		'SQL = SQL & " ORDER BY C300204FPR " 

		SQL = SQL & " UNION " 
		
		SQL = SQL & " SELECT " & wCAMC01 & ", " & wCAMC02 
		SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04 
		SQL = SQL & ", " & wCAMC05 & ", " & wCAMC06 
		SQL = SQL & ", " & wCAMC07 & ", " & wCAMC08
		SQL = SQL & ", " & wCAMC09 & ", " & wCAMC10  
		SQL = SQL & ", " & wCAMC11 & ", " & wCAMC12  
		SQL = SQL & ", '0','0','0' as STV "
		SQL = SQL & " FROM " &  wNOMTAB & " B " 		
		SQL = SQL & " WHERE "
		SQL = SQL & " C300204CCI ='" & Session("glCiaInternet") & "'  "
		SQL = SQL & " AND C300204CIA ='" & Session("glCia") & "' "		
		SQL = SQL & " AND C300204CVE ='" & wCVE & "' "
		SQL = SQL & " AND C300204TDO ='FAC' "
		SQL = SQL & " AND DATEDIFF(day, C300204FPR, Getdate()) >= 60 "
		SQL = SQL & " ORDER BY A300002RSO, C300204FPR " 
		
		
		'Response.Write SQL
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
    	rstQuery.Open sql , strCnn
    	'rstQueryData = rstQuery.GetRows 
		wTipo = "D"
		wCLASS = "TDD"
		wCuenta = 0
		wTC03 = 0 
		wTC08 = 0
		wTC09 = 0
		wCCL = "0"
		response.write "<p><table border=""1"" width=""99%""  cellspacing=""0"" cellpadding=""2"" align=""center"">" 
		DO WHILE NOT rstQuery.EOF 
			
			If wCuenta = 0 Then

				wTIT = "Documentos Demorados"
				Mostrar_Titulo

				wTipo = "E"
				wCLASS = "TDS"
				wShowURL = "N"
				Mostrar_Linea
				
			End If 
			
			
			IF wCCL <> trim(rstQuery.Fields(0)) THEN
				
				IF wCCL <> "0" Then
					
					 Imprimir_Sub_Totales
					 					 		
					 wCuenta = 0			 
					 wTC06 = 0
					 wTC07 = 0
					 wCS08 = 0
					 wTC09 = 0
					 wTC10 = 0
					 wSSNV = 0
					 wSSVE = 0
					 wSDPR = 0
				End If
				
				wTIT = trim(rstQuery.Fields(0)) & " - " & trim(rstQuery.Fields(2)) 
				wTC07 = 0
				Mostrar_SubTitulo			
			    wCCL = trim(rstQuery.Fields(0))
			    
			END IF 
	
			wC01 = trim(rstQuery.Fields(1))
			wC02 = trim(rstQuery.Fields(3))
			wC03 = trim(rstQuery.Fields(4))
			wC04 = trim(rstQuery.Fields(5))	
			wC05 = trim(rstQuery.Fields(6))	
			wC06 = trim(rstQuery.Fields(7))	
			wC07 = trim(rstQuery.Fields(8))
			wCS08 = wCS08 + cdbl(trim(rstQuery.Fields(9)))
			wC09 = trim(rstQuery.Fields(10))
			wC10 = cdbl(rstQuery.Fields(7))
			wSTV = CDBL(rstQuery.Fields("STV"))
	
					
			wC11 = wC10  
			
			IF wC03 = "ADEL" THEN
				wC10 = (wC10*-1) 
			END IF 
		
			IF wC03 = "0" THEN
				wC03 = "FACT"			
			END IF 
		
			IF wC03 = "1" THEN
				wC03 = "N/C"			
			END IF 
		
			wC06 = DateDiff("d", cdate(wC04), Now)
		
			'RESPONSE.WRITE "1. " & wSTC & "<BR>"
			'RESPONSE.WRITE "2. " & wSTV
			
			IF wC03 <> "ADEL" THEN
				
				IF wSTC <> "0" THEN
					'wDPRC = (wC10/wSTC) 
					wDPRC = wC06 * wDPRC 
			      ELSE
					wDPRC = 0 
				END IF 
			
				'wDPRV = (wC10/wSTV) 
				wDPRV = wC06 * wDPRV 
			
			  ELSE
				wDPRC = 0 
			
				wDPRV = 0
			END IF 
			
		
				
			
			wC11 = DateDiff("d", cdate(wC05), Now)
			
			IF wC11 < 0 OR wC03 = "ADEL" THEN
				wC11 = 0
				wColor = "Black"
				wSSNV = wSSNV + cdbl(wC10)
				wTSNV = wTSNV + cdbl(wC10)
				Else
				wColor = "Red"
				wSSVE = wSSVE + cdbl(wC10)
				wTSVE = wTSVE + cdbl(wC10)
			END IF 
			
					
			IF isnull(wC03) or wC03 = "" Then
				wC03 = "&nbsp;"
			End If  
			
			IF wC03 <> "ADEL" THEN	
				wSDPR = wSDPR + cdbl(wDPRC)
				wTDPR = wTDPR + cdbl(wDPRV)	
			END IF 
			
			wTC06 = wTC06 + cdbl(wC06)
			wTC07 = wTC07 + cdbl(wC07)
			wTC09 = wTC09 + cdbl(wC09)
			wTC10 = wTC10 + cdbl(wC10)
			
			wTTC06 = wTTC06 + cdbl(wC06)
			wTTC07 = wTTC07 + cdbl(wC07)
			wTTC08 = wTTC08 + cdbl(trim(rstQuery.Fields(9)))
			wTTC09 = wTTC09 + cdbl(wC09)
			wTTC10 = wTTC10 + cdbl(wC10)
			
			'wC06 = formatnumber(wC06,2)
			IF wSTSIMP <> "E" THEN 
				wC07 = formatnumber(wC07,2)
				wC08 = formatnumber(wCS08,2)
				wC09 = formatnumber(wC09,2)
				wC10 = formatnumber(wC10,2)
			  ELSE
			    wC07 = Replace(wC07, ".", ",")
				wC08 = Replace(wCS08, ".", ",")
				wC09 = Replace(wC09, ".", ",")
				wC10 = Replace(wC10, ".", ",")
			END IF 
		
			wC04 = right("0" & Day(wC04),2) & "-" & right("0" & Month(wC04),2) & "-" & Year(wC04)	
			wC05 = right("0" & Day(wC05),2) & "-" & right("0" & Month(wC05),2) & "-" & Year(wC05)	
			
			wCLASS = "TDD"
			wCLASS2 = "TDD2"

			Mostrar_Linea
				
			rstQuery.MoveNext 
			wCuenta = wCuenta + 1
			wTCuenta = wTCuenta + 1	

		LOOP
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		
			IF wCuenta > 0 then
				'Imprimir_Sub_Totales	
				Imprimir_Totales
			end if
		
		
			
			Sub Imprimir_Sub_Totales()
			
			
			wCLASS = "TD1"
			wCLASS2 = "TD3"
			
			wTipo = "T"
			wColor = "black"
			wC01 = wCuenta
			wC02 = "<u>Total Bs.</u>"		
			wC03 = "Vencido: <font color=red>" & formatnumber(wSSVE,2) & "</font>"
			wC04 = "&nbsp;"
			
			
			wC09 = ""
					
			IF Session("glTipoUsuario") <> "C" THEN
				'wC11 = "<u>DP</u>: " & formatnumber(wSDPR,2)
				wC11 = "&nbsp;"
			 ELSE
				wC11 = "&nbsp;"
			END IF  		
			
			wC06 = "&nbsp;" 
			IF wSTSIMP <> "E" THEN 
				wC07 = formatnumber(wTC07,2)
				wC08 = formatnumber(wTC08,2)
				wC10 = formatnumber(wTC10,2)
			  ELSE
				wC07 = Replace(wTC07, ".", ",")
				wC08 = Replace(wTC08, ".", ",")
				wC10 = Replace(wTC10, ".", ",")
			END IF	
			
			wTABLAT = "<table BORDER=""0"" WIDTH=""100%"" cellspacing=""0"">"
			wTABLAT = wTABLAT & "<TR><TD align=left CLASS=" & wC & wCLASS2 & wC & ">"
			wTABLAT = wTABLAT & "<b><u>Sub-Total</u></b>:</TD>"
			wTABLAT = wTABLAT & "<TD align=right CLASS=" & wC & wCLASS2 & wC & "><b>" & wC10 
			wTABLAT = wTABLAT & "</b></TD></TR></TABLE>"
			wC10 = wTABLAT
			
			
			
			Mostrar_Linea_Total
			
			
			
		End Sub
		
		Sub Imprimir_Totales()
			
			
			wCLASS = "TD1"
			wCLASS2 = "TD3"
			
			wTipo = "T"
			wColor = "black"
			wC01 = "<p>" & wTCuenta & "</p>"
			wC02 = "<u>Total Bs.</u>"		
			wC03 = "<p>Vencido: <font color=red>" & formatnumber(wTSVE,2) & "</font></p>"
			wC04 = "&nbsp;"
			
			
			wC09 = ""
			
			IF Session("glTipoUsuario") <> "C" THEN
				'wC11 = "<p><u>TDP</u>: " & formatnumber(wTDPR,2)'"<p><u> Total: </u></p>"
				wC11 = "&nbsp;"
			  ELSE
				wC11 = "&nbsp;"
			END IF 
			
			
			wC06 = "&nbsp;" 'formatnumber(wTTC06,2)
			IF wSTSIMP <> "E" THEN 
				wC07 = formatnumber(wTTC07,2)
				wC08 = formatnumber(wTTC08,2)
				wC10 = "<p>" & formatnumber(wTTC10,2) & "</p>" 
			  ELSE
				wC07 = Replace(wTTC07, ".", ",")
				wC08 = Replace(wTTC08, ".", ",")
				wC10 = "<p>" & Replace(wTTC10, ".", ",") & "</p>"
			END IF	
		
		
			wTABLAT = "<table BORDER=""0"" WIDTH=""100%"" cellspacing=""0"">"
			wTABLAT = wTABLAT & "<TR><TD align=left CLASS=" & wC & wCLASS2 & wC & ">"
			wTABLAT = wTABLAT & "<p><b><u>Total</u></b>:</p></TD>"
			wTABLAT = wTABLAT & "<TD align=right CLASS=" & wC & wCLASS2 & wC & "><b>" & wC10 
			wTABLAT = wTABLAT & "</b></TD></TR></TABLE>"
			wC10 = wTABLAT

		
		
			Mostrar_Linea_Total
		
	
		
		
		END SUB 
	


	
	
	
				
		
%><!--#include file="X001X136_C.ASP"-->