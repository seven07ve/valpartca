<%

	SUB Mostrar_Titulo()

		%>
		  <TR>
		  <td CLASS="TDT" colspan=5><%= wTIT %></td>		  
		  </TR>	
		<%

	END SUB
	

	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wC01 = "Archivo"
			wC02 = "Descripción"
			wC03 = "Tamaño"
			wC04 = "Fecha"
			wC05 = "Hora"
		END IF			
		'
		
		%>
		  <TR>
			<td CLASS="<%=wCLASS%>" width="15%" aLIGN="center"><%= wTIURL & wC01 & wTFURL %></td>
			<td CLASS="<%=wCLASS%>" width="40%" ALIGN="left"><%=  wC02  %></td>
			<td CLASS="<%=wCLASS%>" width="15%" ALIGN="center"><%=  wC03  %></td>		  
			<td CLASS="<%=wCLASS%>" width="15%" ALIGN="center"><%=  wC04  %></td>		  
			<td CLASS="<%=wCLASS%>" width="15%" ALIGN="center"><%=  wC05  %></td>		  			
		  </TR>	
		<%
	
	end SUB	%>
