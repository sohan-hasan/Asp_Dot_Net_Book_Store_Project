<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SqlDS.aspx.cs" Inherits="BookStore2.SqlDS_aspx" %>

<%@ Register Src="~/ProductUserControl.ascx" TagPrefix="uc1" TagName="ProductUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    
   <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="BookId" DataSourceID="SqlDataSource1" GridLines="Vertical" OnRowDeleting="GridView1_RowDeleting1" OnRowUpdating="GridView1_RowUpdating1">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="false"/>
            <asp:BoundField DataField="BookId" HeaderText="BookId" InsertVisible="False" ReadOnly="True" SortExpression="BookId" />
            <asp:TemplateField HeaderText="BookName" SortExpression="BookName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PurchaseDate" SortExpression="PurchaseDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VendorEmail" SortExpression="VendorEmail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("VendorEmail") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("VendorEmail") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VendorAge" SortExpression="VendorAge">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("VendorAge") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("VendorAge") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ImageName" SortExpression="ImageName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ImageName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ImageName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ImageUrl" SortExpression="ImageUrl">
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Style="height: 60px; width: 70px;" ImageUrl='<%# Eval("ImageUrl") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GenreId" SortExpression="GenreId">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGenre" runat="server" SelectedValue='<%#Bind("GenreId") %>' DataTextField="GenreName" DataValueField="GenreId" DataSourceID="SqlDataSource2">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlGenre" runat="server" SelectedValue='<%#Bind("GenreId") %>' DataTextField="GenreName" DataValueField="GenreId" DataSourceID="SqlDataSource2" Enabled="false">
                        </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AuthorId" SortExpression="AuthorId">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlAuthor" runat="server" SelectedValue='<%#Bind("AuthorId") %>' DataTextField="AuthorName" DataValueField="AuthorId" DataSourceID="SqlDataSource3">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlAuthor" runat="server" SelectedValue='<%#Bind("AuthorId") %>' DataTextField="AuthorName" DataValueField="AuthorId" DataSourceID="SqlDataSource3" Enabled="false">
                        </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PublisherId" SortExpression="PublisherId">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlPublisher" runat="server" SelectedValue='<%#Bind("PublisherId") %>' DataTextField="PublisherName" DataValueField="PublisherId" DataSourceID="SqlDataSource4">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPublisher" runat="server" SelectedValue='<%#Bind("PublisherId") %>' DataTextField="PublisherName" DataValueField="PublisherId" DataSourceID="SqlDataSource4" Enabled="false">
                        </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Product] WHERE [BookId] = @BookId" InsertCommand="INSERT INTO [Product] ([BookName], [PurchaseDate], [VendorEmail], [VendorAge], [ImageName], [ImageUrl], [GenreId], [AuthorId], [PublisherId], [Price]) VALUES (@BookName, @PurchaseDate, @VendorEmail, @VendorAge, @ImageName, @ImageUrl, @GenreId, @AuthorId, @PublisherId, @Price)" SelectCommand="SELECT * FROM [Product] ORDER BY [BookId]" UpdateCommand="UPDATE [Product] SET [BookName] = @BookName, [PurchaseDate] = @PurchaseDate, [VendorEmail] = @VendorEmail, [VendorAge] = @VendorAge, [ImageName] = @ImageName, [ImageUrl] = @ImageUrl, [GenreId] = @GenreId, [AuthorId] = @AuthorId, [PublisherId] = @PublisherId, [Price] = @Price WHERE [BookId] = @BookId">
        <DeleteParameters>
            <asp:Parameter Name="BookId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BookName" Type="String" />
            <asp:Parameter Name="PurchaseDate" Type="DateTime" />
            <asp:Parameter Name="VendorEmail" Type="String" />
            <asp:Parameter Name="VendorAge" Type="Int32" />
            <asp:Parameter Name="ImageName" Type="String" />
            <asp:Parameter Name="ImageUrl" Type="String" />
            <asp:Parameter Name="GenreId" Type="Int32" />
            <asp:Parameter Name="AuthorId" Type="Int32" />
            <asp:Parameter Name="PublisherId" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BookName" Type="String" />
            <asp:Parameter Name="PurchaseDate" Type="DateTime" />
            <asp:Parameter Name="VendorEmail" Type="String" />
            <asp:Parameter Name="VendorAge" Type="Int32" />
            <asp:Parameter Name="ImageName" Type="String" />
            <asp:Parameter Name="ImageUrl" Type="String" />
            <asp:Parameter Name="GenreId" Type="Int32" />
            <asp:Parameter Name="AuthorId" Type="Int32" />
            <asp:Parameter Name="PublisherId" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="BookId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Genre] ORDER BY [GenreName]"></asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Author] ORDER BY [AuthorName]"></asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Publisher] ORDER BY [PublisherName]"></asp:SqlDataSource>
       <uc1:ProductUserControl runat="server" ID="ProductUserControl" />
   </div>
</asp:Content>
