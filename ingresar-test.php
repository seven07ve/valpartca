<?php

<form NAME="frmGral" METHOD="post" ACTION="../Pedidos/defaults.asp" target="_parent" >
                    
                                    
                    
                    
                    
						<input name="CIA" type="hidden"  value="VAL"/>
	
						
						
						
						
						<tr>
							<td ><div align="right">
                            <strong>Usuario:</strong>
                        </div></td>
							<td ><input name="LOGIN" size="15" maxlength="15"  value="<%=Session("glUsuario")%>" onkeypress="validar();"/></td>
							<td><input type="submit" name="cmdEnviar" value="Entrar" onclick="javascript:enviar();" tabindex="2" style="font-weight: bold;  border-style:solid; border-width:2px; width:55px; height:25px" /></td>
						</tr>
						<tr>
							<td ><strong>Contraseña:</strong></td>
							<td ><input name="PASSWORD" type="password" maxlength="10" size="15" value="" onkeypress="validar();" /></td>
							<td>&nbsp;</td>
						</tr>

                </form>