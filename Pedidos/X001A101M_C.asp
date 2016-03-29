<%



	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td style=""height:25px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " colspan=9><b>" & wTIT  & "</B></td> "
		'Response.Write "<td style=""height:25px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " colspan=3><input type=button Value=Procesar></td> "
		Response.Write "</tr>"

	END SUB
	

	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wC01 = "Item"
			wC02 = "Descripcion"
			wC03 = "Cant"
			wC04 = "Precio"
			wC04F = "Precio Bs.F"

			wC05 = "Marca"
			wC06 = "Homologo"
			wC07 = "% Imp"			
			wC09 = "Neto con Imp"
			wC09F = "N. con Imp Bs.F"

			wEstilo = "style=""border-style: solid; border-width: 1px"""
		END IF

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "12%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "25%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "5%" & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "8%" & wC & " align=" & wC & "right" & wC & ">" & wC04 & "</td> "		
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "8%" & wC & " align=" & wC & "right" & wC & ">" & wC04F & "</td> "	
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "15%" & wC & " align=" & wC & "center" & wC & ">" & wC05 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "center" & wC & ">" &  wC06 & "</td> "
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "center" & wC & ">" & wC07 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "right" & wC & ">" & wC09 & "</td> "		
	    'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "11%" & wC & " align=" & wC & "right" & wC & ">" & wC09F & "</td> "	
	
	end SUB	%>

