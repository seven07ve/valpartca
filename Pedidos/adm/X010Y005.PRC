  <INPUT TYPE="Hidden" NAME="PROCESO" value="<%=wProceso%>">          
  <INPUT TYPE="button" NAME="cmdSubmit" VALUE="<%=wProceso%>">
  <%if wProceso = "Actualizar" then%>
 		<INPUT TYPE="button" NAME="cmdEliminar" VALUE="Eliminar">
  <%end if %>		  
  <INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:history.back()'>
