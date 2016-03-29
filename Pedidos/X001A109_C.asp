<%
	
	'SUB Mostrar_Titulo()

	'	wC = chr(34)
   
	'	Response.Write "<tr>"
	'	Response.Write "<td style=""height:25px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " colspan=10>" & wTIT  & "</td> "
	'	Response.Write "</tr>"

	'END SUB
	

	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS1" then	
			wC01 = "Item"
			wC02 = "Descripcion"
			wC03 = "Cantidad"
			wC04 = "Precio"
			wC05 = "% Prom."
			wC06 = "Bs. Prom."
			wC07 = "% Imp."
			wC08 = "Kilos"
			wC09 = "Neto"
			wEstilo = "style=""border-style: solid; border-width: 1px"""
		END IF

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "36%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "08%" & wC & " align=" & wC & "right" & wC & ">" & wC03 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "08%" & wC & " align=" & wC & "right" & wC & ">" & wC04 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "7%" & wC & " align=" & wC & "right" & wC & ">" & wC05 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "7%" & wC & " align=" & wC & "right" & wC & ">" &  wC06 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "right" & wC & ">" & wC07 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "08%" & wC & " align=" & wC & "right" & wC & ">" & wC08 & "</td> "		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "right" & wC & ">" & wC09 & "</td> "		
	
	end SUB	%><%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
   		IF wSPP = "0" THEN
   		   wColspan = "1"
   		 ELSE
   	  	   wColspan = "2"
   	  	END IF
   		
		Response.Write "<tr>"
		Response.Write "<td style=""height:32px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " colspan=" & wColspan & "><B>" & wTIT  & "</B></td> "
		
		IF wSPP = "0" THEN
			Response.write "<td align=right style=""height:25px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " ><input type=button Value=""Registrar Pago"" onclick=Javascript:Procesar();> </td> "
		END IF
		
		'Response.Write "<td style=""height:25px; border-style: solid; border-width: 1px"" CLASS=" & wC & "TDT1" & wC & " colspan=3><input type=button Value=Procesar></td> "
		Response.Write "</tr>"

	END SUB
	

	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wC01 = "Factura"
			wC02 = "Descripcion"
			wC03 = "Cant"
			wC04 = "Monto"
			wC04F = "Precio Bs.F"

			wC05 = "Marca"
			wC06 = "Homologo"
			wC07 = "% Imp"			
			wC09 = "Monto"
			wC09F = "N. con Imp Bs.F"

			wEstilo = "style=""border-style: solid; border-width: 1px"""
		END IF

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "60%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "40%" & wC & " align=" & wC & "right" & wC & ">" & wC09 & "</td> "		

		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "15%" & wC & " align=" & wC & "center" & wC & ">" & wC05 & "</td> "		
		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "center" & wC & ">" &  wC06 & "</td> "

		'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "right" & wC & ">" & wC09 & "</td> "		

	
	end SUB	%>

