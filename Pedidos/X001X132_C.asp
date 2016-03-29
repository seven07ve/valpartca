
<head>
<meta http-equiv="Content-Language" content="es-ve">
</head>

<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=4 height=28>" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_SubTitulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td colspan=4 align=""Left"" bgcolor=""#FFFFF"" ><font face=""Tahoma"" size=""2""><b>" & wTIT  & "</b></font></td> "
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()

		wT1 = "20%"
		wT2 = "15%"
		wT3 = "50%"
		wT4 = "15%"		
				
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		IF wCLASS = "TDS" then	
			wColor = "black"
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			wC01 = "Pedido"			
			wC02 = "Nro. de Parte"
			wC03 = "Descripción"
			wC04 = "Unidades"			
			
			wCLASS2 = wCLASS
			wAlign03 = "right"			
			wEstilof = ""
		END IF

		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		
		Response.Write "<tr>"
		Response.Write "<td   " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "center" & wC & ">" & wC01 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT2 & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "left" & wC & ">" & wC03 & "</td>" 
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "right" & wC & ">" & wC04 & "</td> "
		
	end SUB
	
	SUB Mostrar_Linea_Total()

		wT1 = "6%"
		wT3 = "14%"
		wT6 = "16%"
		wT10 = "13%"
		wT11 = "7%"
		wColor = "black"
				
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		
		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		
		Response.Write "<tr>"
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wC01 & "</td> "
		Response.Write "<td colspan=2 " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "left" & wC & ">" & wC03 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT11 & wC & " align=" & wC & "left" & wC & ">" & wC11 & "</td> "	
		Response.Write "<td colspan=2 " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT06 & wC & " align=" & wC & "left" & wC & "><b>" & wC09 & "</b></td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT10 & wC & " align=" & wC & "right" & wC & "><font color=" & wColor & "><b>" & wC10 & "</b></font></td> "
		
	end SUB

	%>



