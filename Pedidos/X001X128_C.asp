
<head>
<meta http-equiv="Content-Language" content="es-ve">
</head>

<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		IF Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "V" THEN 	
			Response.Write "<td height=""25"" CLASS=" & wC & "TDT" & wC & " colspan=12>" & wTIT  & "</td> "
		ELSE
			Response.Write "<td height=""25"" CLASS=" & wC & "TDT" & wC & " colspan=10>" & wTIT  & "</td> "
		END IF 
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_SubTitulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		IF Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "V" THEN 	
			Response.Write "<td colspan=12 align=""Left"" bgcolor=""#FFFFF"" ><font face=""Tahoma"" size=""2""><b>" & wTIT  & "</b></font></td> "
		    ELSE
			Response.Write "<td colspan=10 align=""Left"" bgcolor=""#FFFFF"" ><font face=""Tahoma"" size=""2""><b>" & wTIT  & "</b></font></td> "
		END IF 
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()
		
		wTS = "5%"
		wT1 = "8%"
		wT2 = "7%"
		wT3 = "7%"
		wT4 = "8%"
		wT5 = "9%"
		wT11 = "6%"
		wT6 = "10%"
		wT7 = "10%"
		wT8 = "10%"
		wT9 = "10%"
		wT10 = "10%"
				
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			wSTS = "P. Int."
			wC01 = "Documento"
			wC02 = "Motivo"
			wC03 = "Tipo Doc."
			wC04 = "Fecha. Doc."
			wC05 = "Fecha Venc."
			wC11 = "Dias"
			wC06 = "Debitos"
			wC07 = "Creditos"
			wC08 = "Saldo Total"
			wC09 = "S. No Vencido"
			wC10 = "S. Vencido"
			wCLASS2 = wCLASS
			wAlign03 = "right"			
			wEstilof = ""
		END IF

		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		
		Response.Write "<tr>"
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wTS & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wSTS & "</td>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wC01 & "</td> "
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT2 & wC & " align=" & wC & "center" & wC & ">" & wC02 & "</td> "
		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & ">" & wC04 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "center" & wC & ">" & wC05 & "</td> "
			
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT11 & wC & " align=" & wC & "center" & wC & ">" & wC11 & "</td> "
		IF Session("glTipoUsuario") <> "C" Then
			'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT6 & wC & " align=" & wC & "right" & wC & ">" & wC06 & "</td> "
			'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT7 & wC & " align=" & wC & "right" & wC & ">" & wC07 & "</td> "
		End If
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT8 & wC & " align=" & wC & "right" & wC & ">" & wC08 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT9 & wC & " align=" & wC & "right" & wC & "><font color=""#0000FF"">" & wC09 & "</font></td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT10 & wC & " align=" & wC & "right" & wC & "><font color=""red"">" & wC10 & "</font></td> "
		
	end SUB
	
	SUB Mostrar_Linea_Total()
		
		wTS = "6%"
		wT1 = "9%"
		wT2 = "23%"
		wT3 = "8%"
		wT4 = "9%"
		wT5 = "10%"
		wT11 = "6%"
		wT6 = "10%"
		wT7 = "10%"
		wT8 = "10%"
		wT9 = "10%"
		wT10 = "10%"
				
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			wSTS = "Pag. Int."
			wC01 = "Documento"
			wC02 = "Motivo"
			wC11 = "Dias"
			wC06 = "Debitos"
			wC07 = "Creditos"
			wC08 = "Saldo Total"
			wC09 = "S. No Vencido"
			wC10 = "S. Vencido"
			wCLASS2 = wCLASS
			wAlign03 = "right"			
			wEstilof = ""
		END IF

		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		
		Response.Write "<tr>"
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wTS & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wSTS & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wC01 & "</td> "
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT2 & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "center" & wC & "></td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & "></td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "center" & wC & "></td> "
			
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT11 & wC & " align=" & wC & "center" & wC & ">" & wC11 & "</td> "
		'IF Session("glTipoUsuario") <> "C" Then
			'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT6 & wC & " align=" & wC & "right" & wC & ">" & wC06 & "</td> "
			'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT7 & wC & " align=" & wC & "right" & wC & ">" & wC07 & "</td> "
		'End If
		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT8 & wC & " align=" & wC & "right" & wC & ">" & wC08 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT9 & wC & " align=" & wC & "right" & wC & "><font color=""#0000FF"">" & wC09 & "</font></td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT10 & wC & " align=" & wC & "right" & wC & "><font color=""red"">" & wC10 & "</font></td> "
		
	end SUB

	%>



