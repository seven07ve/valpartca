<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=2>" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			SELECT CASE wNOMTAB
				CASE "X300ZQ005"
					wC01 = "Supervisor"
				CASE "X300ZQ006"
					wC01 = "Vendedor"
			END SELECT		
			wC02 = "Nombre"

		END IF

		'
		
		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "25%" & wC & " align=" & wC & "left" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td CLASS=" & wC & wCLASS & wC & " width=" & wC & "75%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "


	
	end SUB	%>
