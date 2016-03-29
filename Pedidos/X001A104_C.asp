<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr height=25 bgcolor=white>" 
		Response.Write "<td  style=""border-style: solid; border-width: 1px"" CLASS=" & wC & "TDt" & wC & " colspan=9 bgcolor=""white"">" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wCHK = "&nbsp;"
			wC01 = "Número"
			wC02 = "Cliente"
			wC03 = "Fecha"
			wC04 = "Tipo"		
			wSTS = "Estatus"
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			
		END IF
   
		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "7%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "43%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "8%" & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "32%" & wC & " align=" & wC & "left" & wC & ">" & wC04 & "</td> "		
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "Center" & wC & ">" & wSTS & "</td> "

   
	
	end SUB	%>