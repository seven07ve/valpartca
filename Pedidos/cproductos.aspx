<%@ page language="VB" autoeventwireup="false" inherits="cproductos, App_Web_it_y_cjo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Productos</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black"
            GridLines="Horizontal" style="color: black; font-family: Tahoma" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Font-Names="Tahoma" Font-Size="Small" PageSize="16">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="A300003CPR" HeaderText="Nro. de Parte" SortExpression="A300003CPR" >
                    <ItemStyle Width="14%" />
                </asp:BoundField>
                <asp:BoundField DataField="A300003REF" HeaderText="Homologo" SortExpression="A300003REF" >
                    <ItemStyle Width="12%" />
                </asp:BoundField>
                <asp:BoundField DataField="A300003DEL" HeaderText="Descripci&#243;n" SortExpression="A300003DEL"  >
                    <ItemStyle Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="A300003MAR" HeaderText="Marca" SortExpression="A300003MAR" >
                    <ItemStyle Width="12%" />
                </asp:BoundField>
                <asp:BoundField DataField="A300019PUA" HeaderText="Precio" SortExpression="A300019PUA" DataFormatString="{0:0,0.00}"  >
                    <ItemStyle Width="13%" HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="A300019CIN" HeaderText="Existencia" SortExpression="A300019CIN" DataFormatString="{0:0}">
                    <ItemStyle Width="6%" HorizontalAlign="Right"/>
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Carvica %>"
            SelectCommand="SELECT A300003CPR, A300003DEL, A300019CIN, A300003STS, A300019PUA, A300019CIN, A300003MAR, A300003REF, A300019PIM FROM X300AQ003 WHERE A300003CCI ='CAR' AND A300003CIA ='01' AND A300003TPR ='091'  ">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
