
<head>
<meta http-equiv="Content-Language" content="es-ve">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<%

	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		IF Session("glTipoUsuario") = "EG" THEN
			Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=8>" & wTIT  & "</td> "
		  ELSE
			IF Session("glMostrarTR") = "1" THEN 'Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" OR  	
				Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=9>" & wTIT  & "</td> "
			  ELSE
				Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=9>" & wTIT  & "</td> "	
			END IF 	
		END IF  
		Response.Write "</tr>"


	END SUB
	
	
	SUB Mostrar_Sub_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
        	IF Session("glMostrarTR") = "1" THEN 'Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" OR 
			Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=9>" & wTIT  & "</td> "
		ELSE
			Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=9>" & wTIT  & "</td> "
		END IF 

		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()

		wT1 = "16%"
		wT2 = "12%"
		wT3 = "25%"
		wT4 = "10%"
		wT5 = "12%"
		wT6 = "4%"
		wT7 = "11%"
		wT8 = "5%"
		wT9 = "5%"
		wT11 = "4%"
		
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			wC01 = "Nro. de Parte"
			wC08 = "Referencia"
			wC02 = "Descripción"
			wC11 = "Unid. Empa."
			wC07 = "Marca"
			IF wPARCON = "1" THEN
				wC05 = "Precio Unit. con IVA Bs."
				wC05P = "Precio Par con IVA Bs."
			  ELSE
				IF Session("glAplicarIva") = "0" Then
					wC05 = "P. Unit. Neto sin IVA"
  				  Else
					wC05 = "P. Unit. Neto con IVA"
				End If 
			END IF 
			wBCK = "B/O"
			wIMG = "Imagen"
			wTRA = "Trans."
			wC06 = "Exist."
			wAlign03 = "right"			
			wEstilof = ""
			wCLASS2 = wCLASS
		END IF

		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wIMG & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "left" & wC & ">" & wEstilof & wC01 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT2 & wC & " align=" & wC & "left" & wC & ">" & wC08 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT11 & wC & " align=" & wC & "right" & wC & ">" & wC11 & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT7 & wC & " align=" & wC & "left" & wC & ">" & wC07 & "</td> "
	
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "right" & wC & ">" & wC05 & "</td> "   	
       	IF wPARCON = "1" THEN
			Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT5 & wC & " align=" & wC & "right" & wC & ">" & wC05P & "</td> "
		END IF 	
		
       	IF Session("glMostrarExistencia") = "1" THEN 
       	  Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT6 & wC & " align=" & wC & wAlign03 & wC & ">" & wTIDURL & wC06 & wTFURL & "</td> "
        End If 
        IF wPARCON <> "1" THEN
        	Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT9 & wC & " align=" & wC & wAlign03 & wC & ">" & wTIDURL & wBCK & wTFURL & "</td> "
        	IF Session("glMostrarTR") = "1" THEN ' Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" OR THEN 
        		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS2 & wC & " width=" & wC & wT8 & wC & " align=" & wC & wAlign03 & wC & ">" & wTIDURL & wTRA & wTFURL & "</td> "
        	END IF 
		END IF 
	
	end SUB	%>

