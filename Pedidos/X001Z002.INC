<% 
    Sub Cargar_Palabras_Filtrado(wTexto)

        'Dim I As Integer
        'Dim wCaracter As String
        'Dim wPalabra As String
        'Dim wCuenta As Integer
        'Dim wCarga As Boolean


        glPalabra01 = "" : glPalabra02 = "" : glPalabra03 = "" : glPalabra04 = ""


        wPalabra = ""
        wTexto = Trim(wTexto)
        wCuenta = 1
        wCarga = False

        For I = 1 To Len(wTexto)
            wCaracter = Mid(wTexto, I, 1)
            If (wCaracter <> " ") Or I = Len(wTexto) Then
                wPalabra = wPalabra & wCaracter
                If I = Len(wTexto) Then
                    wCarga = True
                End If
            Else
                wCarga = True
            End If
            If wCarga = True Then
                Select Case wCuenta
                    Case 1
                        Session("glPalabra01") = wPalabra
                    Case 2
                        Session("glPalabra02") = wPalabra
                    Case 3
                        Session("glPalabra03") = wPalabra
                    Case 4
                        Session("glPalabra04") = wPalabra
                End Select
                wPalabra = ""
                wCuenta = wCuenta + 1
                wCarga = False
            End If
        Next 



    End Sub
    
%>