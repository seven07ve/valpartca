  <INPUT TYPE="Hidden" NAME="PROCESO" value="<%=wProceso%>">          
  <INPUT TYPE="button" ID="cmdSubmit" NAME="cmdSubmit" VALUE="<%=wProceso%>" onclick="return cmdSubmit_onclick()" >
  <%if wProceso = "Actualizar" then%>
 		<INPUT TYPE="button" NAME="cmdEliminar" onclick="return cmdEliminar_onclick()"  VALUE="Eliminar">
  <%end if %>		  
  <INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'>
