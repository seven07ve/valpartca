<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr height=25 bgcolor=white>" 
		Response.Write "<td  style=""border-style: solid; border-width: 1px"" CLASS=" & wC & "TDt" & wC & " colspan=7 bgcolor=""white"">" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wC01 = "Número"
			wNER = "Número ERP"
			wC02 = "Cliente"
			wC03 = "Fecha"
			wC04 = "Cantidad"			
			wC06 = "P. Neto con IVA "
			wSTS = "Estatus"	
			wC07 = "Detalle"
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			
		END IF
   
		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "left" & wC & ">" & wC01 & "</td> "
		'Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "center" & wC & ">" & wNER & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "33%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "right" & wC & ">" & wC04 & "</td> "		
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "12%" & wC & " align=" & wC & "right" & wC & ">" & wC06 & "</td> "
		IF Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G" THEN 
			Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "Center" & wC & ">" & wSTS & "</td> "
		END IF 
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "7%" & wC & " align=" & wC & "center" & wC & ">" & wTDIURL & wC07 & wTFURL & "</td> "
   
	
	end SUB	%>
