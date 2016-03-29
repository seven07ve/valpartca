<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%

	SUB Mostrar_Titulo()

		wC = chr(34)
		
		wColspan = "5"
	
		Response.Write "<tr height=25 bgcolor=white>" 
		Response.Write "<td  style=""border-style: solid; border-width: 1px"" CLASS=" & wC & "TDt" & wC & " colspan=" & wColspan & " bgcolor=""white"">" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			'wCHK = "&nbsp;"
			wC01 = "<input TYPE='button' NAME='Submit' onclick='enviar();' value='Actualizar' name='B1' style='font-family: Tahoma; font-size: 8pt; font-weight: bold; width: 67; height: 24'>"
			'wC01 = "Código"
			wC02 = "Descripción"
			wC03 = "&nbsp;"
			wC04 = "Por"
			wCHK2 = "No Mostrar Precios"
			wSTS = "Estatus"
				

					wEstilo = "style=""border-style: solid; border-width: 1px"""
			
		END IF
   
		wC = chr(34)
   
		Response.Write "<tr>"
		'Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "center" & wC & ">" & wCHK & "</td> "
		Response.Write "<td height=25 " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "11%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "45%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
			Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "30%" & wC & " align=" & wC & "center" & wC & ">" & wSTS & "</td> "
		'Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "20%" & wC & " align=" & wC & "left" & wC & ">" & wCHK2 & "</td> "
		'Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "20%" & wC & " align=" & wC & "left" & wC & ">" & wC03 & "</td> 
		'Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "14%" & wC & " align=" & wC & "left" & wC & ">" & wC04 & "</td> "		
		'Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "7%" & wC & " align=" & wC & "left" & wC & ">" & wTDIURL & wC07 & wTFURL & "</td> "
   
	
	end SUB	%>
