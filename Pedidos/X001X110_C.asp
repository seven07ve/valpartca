<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=5>" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
					wC01 = "Usuario"
					wC02 = "Nombre"
					wC03 = "Clase"
					wC04 = "Detalle"
					wC05 = "Status"
			'END SELECT		
		END IF

		'Alinear Campos
		wAlign03 = "left"
		SELECT CASE wNOMTAB
			CASE "X300AF003"
				wAlign03 = "right"
		END SELECT		
		'
		
		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "15%" & wC & " align=" & wC & "left" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "45%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "15%" & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "15%" & wC & " align=" & wC & "center" & wC & ">" & wTIDURL & wC04 & wTFURL & "</td> "
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "center" & wC & ">" & wC05 & "</td> "


	
	end SUB	%>
