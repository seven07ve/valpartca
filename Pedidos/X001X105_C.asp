<%

	SUB Mostrar_Titulo()

		%>
		  <TR>
		  <td CLASS="TDT" colspan=5><%= wTIT %></td>		  
		  </TR>	
		<%

	END SUB
	
	SUB Mostrar_Linea_Mas()

		
		wBgcolor = "white" 'Azul Claro
		wColor="black" 'Negro
		wSize = 2
		%>
		  <TR>
		  <td colspan=3 width="100%" ALIGN="left" bgcolor="<%=wBgcolor%>">
		  <font face="Comic Sans MS" color="<%=wColor%>" size=<%=wSize%>>
		  <%= "Nota: Solo se muestran los primeros " & Session("glRegistros") & " Registros" %>
		  </font></td>		  
		</TR>	
		<%
	
	END SUB

	SUB Mostrar_Linea()
				
		IF wCLASS = "TDS" then	
			wC01 = "Codigo"
			wC02 = "Descripción"
			wC03 = "Precio"
			wC04 = "% Promoción"
			wC05 = "Bs. Promoción"

		END IF

		'
		
		%>
		  <TR>
			<td CLASS="<%=wCLASS%>" width="14%" aLIGN="center"><%= wTIURL & wC01 & wTFURL %></td>
			<td CLASS="<%=wCLASS%>" width="50%" ALIGN="left"><%=  wC02  %></td>
			<td CLASS="<%=wCLASS%>" width="12%" ALIGN="right"><%=  wC03  %></td>
			<td CLASS="<%=wCLASS%>" width="12%" ALIGN="right"><%=  wC04  %></td>
			<td CLASS="<%=wCLASS%>" width="12%" ALIGN="right"><%=  wC05  %></td>			
		  </TR>	
		<%
	
	end SUB	%>
