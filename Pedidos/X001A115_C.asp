	<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
   		IF wSPP = "0" THEN
   		   wColspan = "4"
   		 ELSE
   	  	   wColspan = "5"
   	  	END IF
   		
		Response.Write "<tr>"
		Response.Write "<td style=""height:25px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " colspan=" & wColspan & ">" & wTIT  & "</td> "
		
		IF wSPP = "0" THEN
			Response.write "<td align=right style=""height:25px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " ><input type=""button"" NAME=""cmdProcesar"" id=""cmdProcesar"" Value=""Procesar"" onclick=Javascript:Procesar();> </td> "
		END IF
		
		'Response.Write "<td style=""height:25px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " colspan=3><input type=button Value=Procesar></td> "
		Response.Write "</tr>"

	END SUB
	

	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wC01 = "Item"
			wC02 = "Grupo"
			wC03 = "Codigo"
			wC04 = "Producto"
			wC05 = "Cantidad"

			

			wEstilo = "style=""border-style: solid; border-width: 1px"""
		END IF

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "26%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "26%" & wC & " align=" & wC & "left" & wC & ">" & wC03 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "25%" & wC & " align=" & wC & "left" & wC & ">" & wC04 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "13%" & wC & " align=" & wC & "center" & wC & ">" & wC05 & "</td> "		
		
	
	end SUB	%>

