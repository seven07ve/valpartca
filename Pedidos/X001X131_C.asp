<%

    SUB Mostrar_Titulo()

		wC = chr(34)
   	
   	    wColspan = "9"
   	
   		
		Response.Write "<tr>"
		Response.Write "<td style=""height:25px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " colspan=" & wColspan & ">" & wTIT  & "</td> "
			
		Response.Write "</tr>"

	END SUB
	

	

	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wITE = "Item"
			wC03 = "Cant."
			wC01 = "Nro. de Parte"
			wC02 = "Descripcion"
			wC05 = "Marca"
			wC04 = "P. Unitario"
			wC06 = "% Desc."				
			wC07 = "Precio Neto"			
			wC09 = "Monto Neto"
			
			wEstilo = "style=""border-style: solid; border-width: 1px"""
		END IF

		wC = chr(34)
   
		Response.Write "<tr>"
		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "5%" & wC & " align=" & wC & "center" & wC & ">" & wITE & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "11%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "28%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "left" & wC & ">" & wC05 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "right" & wC & ">" & wC04 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "7%" & wC & " align=" & wC & "right" & wC & ">" & wC06 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "right" & wC & ">" & wC07 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "13%" & wC & " align=" & wC & "right" & wC & ">" & wC09 & "</td> "

				
	
	end SUB	
	
	SUB Mostrar_Linea_Total()
				
		
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "82%" & wC & " align=" & wC & "right" & wC & ">" & wC04 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "18%" & wC & " align=" & wC & "right" & wC & ">" & wC09 & "</td> "

				
	
	end SUB	
	
	%>

