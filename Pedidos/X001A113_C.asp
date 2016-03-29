<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr height=30 bgcolor=white>" 
		Response.Write "<td  style=""border-style: solid; border-width: 1px"" CLASS=" & wC & "TDt" & wC & " colspan=7 bgcolor=""white"">" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wCHK = "&nbsp;"
			wC01 = "Número"
			wC02 = "Cliente"
			wC03 = "Fecha"
			wC04 = "Tipo"		
			wPUS = "Generado por:"		
			wSTS = "Estatus"
			wDET = "Ver"
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			
		END IF
   
		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "7%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "33%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "8%" & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "12%" & wC & " align=" & wC & "left" & wC & ">" & wPUS & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "17%" & wC & " align=" & wC & "left" & wC & ">" & wC04 & "</td> "		
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "13%" & wC & " align=" & wC & "left" & wC & ">" & wSTS & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "Center" & wC & ">" & wTIURLD & wDET & wTFURL & "</td> "

   
	
	end SUB	%>
