<%

	SUB Mostrar_Titulo()

		wC = chr(34)
		
		IF (Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G") and wSTSPED = "0" THEN
			wColspan = "11"
			Else
			IF Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G" THEN
				wColspan = "10"
			Else
				wColspan = "9"
			End If
		END IF
   
		Response.Write "<tr height=25 bgcolor=white>" 
		Response.Write "<td  style=""border-style: solid; border-width: 1px"" CLASS=" & wC & "TDt" & wC & " colspan=" & wColspan & " bgcolor=""white"">" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	
	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			
			wSTSPED = Request.QueryString("STSPED")		

		
			IF (Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G") and wSTSPED = "0" THEN
				wCHK = "<input TYPE='button' NAME='Submit' onclick='enviar();' value='X' name='B1' style='font-family: Tahoma; font-size: 9pt; font-weight: bold; width: 23; height: 20'>"
			ELSE
				wCHK = "&nbsp;"
			END IF 
			wC01 = "Número"
			wNER = "Número ERP"
			wC02 = "Cliente"
			wC03 = "Fecha"
			wC04 = "Cantidad"				

			wC06 = "Neto"
			wC08 = "Iva"
			wC09 = "Total"
			wSTS = "Estatus"
			wC07 = "Detalle"
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			
		END IF
   
		wC = chr(34)
   
		Response.Write "<tr>"
		IF (Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G") and wSTSPED = "0" THEN
			Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "4%" & wC & " align=" & wC & "center" & wC & ">" & wCHK & "</td> "
			wW = "28%"
		  Else
			wW = "26%"
		END IF 
		Response.Write "<td height=25 " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "8%" & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		'Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "8%" & wC & " align=" & wC & "center" & wC & ">" & wNER & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wW & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "center" & wC & ">" & wC03 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "right" & wC & ">" & wC04 & "</td> "		
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "11%" & wC & " align=" & wC & "right" & wC & ">" & wC06 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "6%" & wC & " align=" & wC & "right" & wC & ">" & wC08 & "</td> "
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "11%" & wC & " align=" & wC & "right" & wC & ">" & wC09 & "</td> "
		IF Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G" THEN 
			Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "5%" & wC & " align=" & wC & "Center" & wC & ">" & wSTS & "</td> "
		END IF 
		Response.Write "<td " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & "7%" & wC & " align=" & wC & "center" & wC & ">" & wTDIURL & wC07 & wTFURL & "</td> "
   
	
	end SUB	%>
