
<head>
<meta http-equiv="Content-Language" content="es-ve">
</head>

<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td height=""26"" CLASS=" & wC & "TDT" & wC & " colspan=7>" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()

		wT1 = "14%"
		wT2 = "14%"
		wT3 = "36%"
		wT4 = "10%"
		wT5 = "8%"
		wT6 = "10%"
		
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			wC01 = "Nro. de Parte"
			wC02 = "Homologo"
			wC03 = "Descripción"
			wC04 = "Nro. Pedido"
			wC05 = "Cant."		
			wC06 = "Fecha"
			wC07 = "Monto"
			wAlign03 = "right"			
			wEstilof = ""
		END IF

		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "left" & wC & ">" & wEstilof & wC01 & "</td> "
		IF wIMP <> "S" THEN
			Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT2 & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		END IF 
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "left" & wC & ">" & wC03 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "left" & wC & ">" & wC04 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "center" & wC & ">" & wC05 & "</td> "
	    Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "Right" & wC & ">" & wC07 & "</td> "
	    Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT6 & wC & " align=" & wC & "center" & wC & ">" & wC06 & "</td> "

	
	end SUB	%>

