
<head>
<meta http-equiv="Content-Language" content="es-ve">
</head>

<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=9 height=""30"">" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_SubTitulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td colspan=8 align=""Left"" bgcolor=""#FFFFF"" ><font face=""Tahoma"" size=""2""><b>" & wTIT  & "</b></font></td> "
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()

		wT1 = "8%"
		wT2 = "8%"
		wT3 = "8%"
		wT4 = "9%"
		wT5 = "10%"
		wT11 = "6%"
		wT6 = "6%"
		wT7 = "10%"
		wT8 = "10%"
		wT9 = "10%"
		wT12 = "6%"
		wT13 = "6%"
		wT10 = "10%"
		
				
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			wCHK = "&nbsp;"

			wC01 = "Documento"
			wC02 = "Motivo"
			wC03 = "Tipo Doc."
			wC04 = "Fecha Documento"
			wC05 = "Fecha <br> Vencimiento"
			wC06 = "Dias <br> Transcu."
			wC11 = "Dias <br> Vencidos"
			wC07 = "Creditos"
			wC08 = "Saldo Total"
			wC09 = "S. No Vencido"
			wC10 = "Monto"
			wDEA = "% Desc."
			wC13 = "Aplicar <br> Descuento"
			wCLASS2 = wCLASS
			wAlign03 = "right"			
			wEstilof = ""
		END IF

		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		
		Response.Write "<tr>"
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "4%" & wC & " align=" & wC & "center" & wC & ">" & wCHK & "</td> "
		Response.Write "<td   " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wTDIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & ">" & wC04 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT6 & wC & " align=" & wC & "center" & wC & ">" & wC06 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "center" & wC & ">" & wC05 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT11 & wC & " align=" & wC & "center" & wC & ">" & wC11 & "</td> "
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT12 & wC & " align=" & wC & "center" & wC & ">" & wDEA & "</td> "
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT12 & wC & " align=" & wC & "center" & wC & ">" & wC12 & "</td> "
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT13 & wC & " align=" & wC & "center" & wC & ">" & wC13 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT10 & wC & " align=" & wC & "right" & wC & "><font color=" & wColor & "><B>" & wC10 & "</B></font></td>"
		
	end SUB
	
	SUB Mostrar_Linea_Total()

		wT1 = "9%"
		wT2 = "30%"
		wT3 = "8%"
		wT4 = "9%"
		wT5 = "10%"
		wT11 = "6%"
		wT12 = "6%"
		wT6 = "10%"
		wT7 = "10%"
		wT8 = "10%"
		wT9 = "10%"
		wT10 = "10%"
				
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			wC01 = "Documento"
			wC02 = "Motivo"
			wC03 = "Tipo Doc."
			wC04 = "Fecha Documento"
			wC05 = "Fecha Vencimiento"
			wC06 = "Dias Trans."
			wC11 = "Dias Venci."
			wC07 = "Creditos"
			wC08 = "Saldo Total"
			wC09 = "S. No Vencido"
			wC10 = "Monto"
			wC12 = "% Desc."
			wCLASS2 = wCLASS
			wAlign03 = "right"			
			wEstilof = ""
		END IF

		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wC01 & "</td> "
		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & ">" & wC04 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT6 & wC & " align=" & wC & "center" & wC & ">" & wC06 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "center" & wC & ">" & wC05 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT11 & wC & " align=" & wC & "center" & wC & ">" & wC11 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT11 & wC & " align=" & wC & "center" & wC & ">" & wC12 & "</td> "
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT11 & wC & " align=" & wC & "center" & wC & ">" & wDEA & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT10 & wC & " align=" & wC & "right" & wC & "><font color=" & wColor & "><B>" & wC10 & "</B></font></td>"
		
	End Sub

	%>



