<%@ Page Language="C#" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

   <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" />
    
        <div >
            ColorPicker Demonstration</div>
        <div>
        <b>Default color picker: </b>
        <br />
        <asp:TextBox runat="server" ID="Color1" MaxLength="6" AutoCompleteType="None" /><br />
        <ajaxToolkit:ColorPickerExtender ID="defaultCPE" runat="server" OnClientColorSelectionChanged="colorChanged" TargetControlID="Color1" />
        <div style="font-size: 90%">
            <em>(Set the focus to the textbox to show the color picker popup; the popup dismisses automatically
                when you choose a color)</em></div>
        </div>
        <script type="text/javascript">
            function colorChanged(sender) {
                sender.get_element().style.color = "#" + sender.get_selectedColor();
            }
        </script>
        <br />