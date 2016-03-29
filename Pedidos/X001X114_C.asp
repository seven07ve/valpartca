<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=12>" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()

		wT1 = "10%"
		wT2 = "28%"
		wT3 = "5%"		
		wT4 = "5%"		
		wT5 = "8%"		
		wT6 = "5%"
		wT7 = "6%"		
		wT8 = "5%"
		wT9 = "8%"
		wT10 = "8%"
		wT11 = "7%"
		wT12 = "5%"		
		
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			SELECT CASE wNOMTAB				
				CASE "X300ZF001"
					wC01 = "Usuario"
					wC02 = "Nombre"
					wC03 = "Sts."
					wC04 = "C/Iva"
					wC05 = "Tipo"
					wC06 = "Exist."
					wC07 = "Vended."
					wC08 = "Lin"
					wC09 = "Creado"
					wC10 = "Ult.Acc."
					wC11 = "Acc/Año"
					wC12 = "N/C"
			END SELECT		
		END IF

		'Alinear Campos
		wAlign03 = "left"
		
		
		
		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "center" & wC & ">" & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT2 & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT7 & wC & " align=" & wC & "center" & wC & ">" & wC07 & "</td> "
        	If Session("glTipoUsuario") <> "C" Then 		
	       	  Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "Center" & wC & ">" & wTIDURL & wC03 & wTFURL & "</td> "
        	End If 
        Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "center" & wC & ">"  & wTIUURL & wC05 & wTFURL & "</td> "
       	Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT6 & wC & " align=" & wC & "center" & wC & ">" & wC06 & "</td> "
		If Session("glTipoUsuario") <> "V" Then 
			Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT8 & wC & " align=" & wC & "center" & wC & ">" & wC08 & "</td> "
		End If 	
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & ">" & wC04 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT12 & wC & " align=" & wC & "center" & wC & ">" & wC12 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT9 & wC & " align=" & wC & "center" & wC & ">" & wC09 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT10 & wC & " align=" & wC & "center" & wC & ">" & wC10 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT11 & wC & " align=" & wC & "center" & wC & ">" & wC11 & "</td> "

	end SUB	%>

