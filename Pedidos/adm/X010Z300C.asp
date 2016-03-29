
<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr height=25 bgcolor=white>" 
		Response.Write "<td  CLASS=" & wC & "TDt" & wC & " colspan=4 bgcolor=""white"">Noticias</td> "
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wFECHAP_02 = "Fecha"
			wC01 = "Titulo"
			wC02 = "Status"
			wC03 = "Usuario"			
		END IF
   
		wC = chr(34)
        Response.Write wCOCEL
		Response.Write "<tr "& wCOCEL & ">"
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "20%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wFECHAP_02 & wTFURL & "</td> "
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "40%" & wC & " align=" & wC & "left" & wC & ">" & wC01 & "</td> "
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "20%" & wC & " align=" & wC & "center" & wC & ">" & wC02 & "</td> "
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "20%" & wC & " align=" & wC & "left" & wC & ">" & wC03 & "</td> "				
		
		
   
	
	end SUB	%>

