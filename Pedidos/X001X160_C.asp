
<head>
<meta http-equiv="Content-Language" content="es-ve">
</head>

<%

	Sub Mostrar_Logo()
		
		'IF wIMP = "S" THEN
		
			
			wFECHA = right("0" & Day(Date),2) & "-" & right("0" & Month(Date),2) & "-" & Year(Date)	
			
			'Response.Write "<table width = ""100%"" align=""center"" border=2>"
	    	Response.Write "<tr>"
	   		Response.Write "<td colspan=4>"
			Response.Write "<p><img border=""0"" src=" & wURI & " ></p>"
	    	Response.Write "</td>" 
			Response.Write "</tr>"
			Response.Write "<tr>"
			Response.Write "<td colspan=5>"
			Response.Write "<p align=""center"" style=""margin-top: 3px; margin-bottom: 3px""><font face=""Tahoma"" size=""2""><b>Fecha del Reporte: </b>" & wFECHA & "</p>"
	    	Response.Write "</td>"
			Response.Write "</tr>"
	    	'Response.Write "</table>"
	
		'END IF
		
	End Sub 	


	SUB Mostrar_Titulo()

		wC = chr(34)
   
		Response.Write "<tr>"
		Response.Write "<td CLASS=" & wC & "TDT" & wC & " colspan=5>" & wTIT  & "</td> "
		Response.Write "</tr>"


	END SUB
	

	SUB Mostrar_Linea()

		wT1 = "14%"
		wT2 = "16%"
		wT3 = "30%"
		wT4 = "10%"
		wT5 = "13%"
		wT6 = "6%"
		
		wEstilof = "<font face=""Tahoma"" style=""font-family: Tahoma; font-size:10pt"">"
		IF wCLASS = "TDS" then	
			wEstilo = "style=""border-style: solid; border-width: 1px"""
			IF wNOMTAB = "X300AQ003" THEN
				wC01 = "Nro. de Parte"
			  ELSE
				wC01 = "Código"
			END IF 			
			wC04 = "Transito"
			wHOM = "Homologos"
			wSUS = "Sustitutos"
			wREF = "Ubicación"
			wC02 = "Descripción"
			wC07 = "Inventario"
			wC05 = "Precio Neto Bs.F"
			wC05F = "Precio Neto Bs.F"
			wFAM = "Línea"
			wC06 = "Foto"
			wAlign03 = "right"			
			wEstilof = ""
		END IF

		'Alinear Campos
		wAlign03 = "right"
			
		wC = chr(34)
   		
		Response.Write "<tr>"
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT1 & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wTIURL & wC01 & wTFURL & "</td> "
		Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT3 & wC & " align=" & wC & "left" & wC & ">" & wC02 & "</td> "
		IF wNOMTAB = "X300AF003" THEN
			Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT2 & wC & " align=" & wC & "center" & wC & ">" & wFAM & "</td> "
			Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & ">" & wC07 & "</td> "
			Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & ">" & wC06 & "</td> "
			IF wIMP <> "S" THEN
				'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wTSURL & wSUS & wTFURL & "</td> "
				'Response.Write "<td  " & wEstilo & " CLASS=" & wC & wCLASS & wC & " width=" & wC & wT4 & wC & " align=" & wC & "center" & wC & ">" & wEstilof & wTHURL & wHOM & wTFURL & "</td> "
			END IF 
		END IF
		
	

	
	end SUB	%>

