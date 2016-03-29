
<head>
<meta http-equiv="Content-Language" content="es-ve">
</head>

<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td height=""25"" CLASS=" & wC & "TDT" & wC & " colspan=6>" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()

		wT1 = "10%"
		wT2 = "45%"
		wT3 = "10%"
		wT4 = "35%"
		wT5 = "8%"
		wT6 = "10%"
		
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			wC01 = "C. Cliente"
			wC02 = "Nombre"
			wC03 = "C. Vendedor"
			wC04 = "Nombre"
			'wC05 = "Cant."		
			'wC06 = "Fecha"
			wAlign03 = "right"			
			wEstilof = ""
		END IF

		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		'wEstilof &
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "left" & wC & ">" & wC01 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT2 & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "left" & wC & ">" & wC03 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "left" & wC & ">" & wC04 & "</td> "
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "center" & wC & ">" & wC05 & "</td> "
	    'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT6 & wC & " align=" & wC & "center" & wC & ">" & wC06 & "</td> "

	
	end SUB	%>

