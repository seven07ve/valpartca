  <INPUT TYPE="Hidden" NAME="PROCESO" value="<%=wProceso%>">          
  <%if wProceso = "Actualizar" then%>
 		<INPUT TYPE="button" NAME="cmdEliminar" VALUE="Eliminar">
 	 <% ELSE %>
		<INPUT TYPE="button" NAME="cmdSubmit" VALUE="<%=wProceso%>"> 	 	
  <%end if %>		  
  <INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'>
