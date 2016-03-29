<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   		
		'IF wSTSPED = "0" THEN
		'	wColspan = "9"
		'	Else
			wColspan = "9"
			
			IF Session("glTipoUsuario") = "P" THEN
				wColspan = "8"
			END IF
		'END IF
	
		Response.Write "<tr height=25 bgcolor=white>" 
		Response.Write "<td  style=""border-style: solid; border-width: 1px"" CLASS=" & wC & "TDt" & wC & " colspan=" & wColspan & " bgcolor=""white"">" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then
		IF Session("glTipoUsuario") <> "P" THEN
			IF wSTSPED = "0" THEN	
				wCHK = "<input TYPE='button' NAME='Submit' onclick='enviar();' value='X' name='B1' style='font-family: Tahoma; font-size: 8pt; font-weight: bold; width: 20; height: 18'>"
			   ELSE
				wCHK = "&nbsp;"
		END IF
			END IF 		
			wC01 = "Número"
			wNRC = "RC/Papel"
			wC02 = "Cliente"
			wPUS = "Generado por:"
			wC03 = "Fecha"
			wC04 = "Monto del Pago"	
			wC05 = "Monto Cancelado"							
			wADJ = "Adj."
			
			wOBR = "Observación"
			wSTS = "Estatus"
			wC07 = "Detalle"
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			
		END IF
   
		wC = chr(34)
   
		Response.Write "<tr>"
		IF wSTSPED = "0" THEN
			IF Session("glTipoUsuario") <> "P" THEN 
				IF wCLASS = "TDS" then
					Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "center" & wC & "><table cellspacing=1 border=0><tr><td >" & wCHK & "</td><td CLASS=" & wC & wCLASS & wC & ">Elim. Pago</td></tr></table></td>"
				ELSE
					Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "center" & wC & ">" & wCHK & "</td>"
				END IF
			END IF	 
		END IF
		Response.Write "<td height=23 " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "5%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		'Response.Write "<td height=23 " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "center" & wC & ">" & wNRC & "</td> " 
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "25%" & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "8%" & wC & " align=" & wC & "left" & wC & ">" & wPUS & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "5%" & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "right" & wC & ">" & wC04 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "right" & wC & ">" & wC05 & "</td> "
				

		IF wSTSPED <> "0" THEN
		'IF Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G" THEN 
			Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "11%" & wC & " align=" & wC & "Center" & wC & ">" & wSTS & "</td> "
		'END IF
		END IF
		
		IF wSTSIMP = "S" THEN
			Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "10%" & wC & " align=" & wC & "right" & wC & ">" & wOBR & "</td> "
		END IF	
		
		IF wSTSIMP <> "S" THEN
			Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "5%" & wC & " align=" & wC & "center" & wC & ">" & wTDIURL & wC07 & wTFURL & "</td> "
			Response.Write "<td height=23 " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "3%" & wC & " align=" & wC & "center" & wC & ">" & wADJ & "</td> "
		END IF
	
	end SUB	%>
