<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=2>" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()

		wT1 = "20%"
		wT2 = "80%"
		
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			IF wNOMTAB = "X300ZF006" THEN
				wC01 = "Usuario"
				wC02 = "Nombre"			
			  ELSE
			  	wC01 = "C�digo"
			  	wc02 = "Familia"
			END IF
		END IF

		'Alinear Campos
		wAlign03 = "left"
		
		
		
		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT2 & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
	
	end SUB	%>
