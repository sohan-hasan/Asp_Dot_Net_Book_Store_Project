<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataViewControl.aspx.cs" Inherits="BookStore2.DataViewControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3>Grid View Control</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="BookId" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:TemplateField HeaderText="BookId" InsertVisible="False" SortExpression="BookId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="BookName" SortExpression="BookName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BookName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PurchaseDate" SortExpression="PurchaseDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VendorEmail" SortExpression="VendorEmail">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("VendorEmail") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("VendorEmail") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VendorAge" SortExpression="VendorAge">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("VendorAge") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("VendorAge") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ImageName" SortExpression="ImageName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ImageName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ImageName") %>'></asp:Label>
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
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("GenreId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("GenreId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AuthorId" SortExpression="AuthorId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("AuthorId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("AuthorId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PublisherId" SortExpression="PublisherId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("PublisherId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("PublisherId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Product] ORDER BY [BookId]"></asp:SqlDataSource>
        <br />
        <h3>Details View</h3>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="BookId" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <Fields>
                <asp:TemplateField HeaderText="BookId" InsertVisible="False" SortExpression="BookId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="BookName" SortExpression="BookName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BookName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PurchaseDate" SortExpression="PurchaseDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VendorEmail" SortExpression="VendorEmail">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("VendorEmail") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("VendorEmail") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("VendorEmail") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VendorAge" SortExpression="VendorAge">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("VendorAge") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("VendorAge") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("VendorAge") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ImageName" SortExpression="ImageName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ImageName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ImageName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("ImageName") %>'></asp:Label>
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
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GenreId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GenreId") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("GenreId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="AuthorId" HeaderText="AuthorId" SortExpression="AuthorId" />
                <asp:BoundField DataField="PublisherId" HeaderText="PublisherId" SortExpression="PublisherId" />
                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Product] WHERE ([BookId] = @BookId) ORDER BY [BookId]">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="BookId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br />
        <h3>Drop Down</h3>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="GenreName" DataValueField="GenreId" AutoPostBack="True"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Genre] ORDER BY [GenreName]"></asp:SqlDataSource>
        <br />
        <h3>Form View</h3>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="BookId" DataSourceID="SqlDataSource4" ForeColor="#333333">
            <EditItemTemplate>
                BookId:
                <asp:Label ID="BookIdLabel1" runat="server" Text='<%# Eval("BookId") %>' />
                <br />
                BookName:
                <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                <br />
                PurchaseDate:
                <asp:TextBox ID="PurchaseDateTextBox" runat="server" Text='<%# Bind("PurchaseDate") %>' />
                <br />
                VendorEmail:
                <asp:TextBox ID="VendorEmailTextBox" runat="server" Text='<%# Bind("VendorEmail") %>' />
                <br />
                VendorAge:
                <asp:TextBox ID="VendorAgeTextBox" runat="server" Text='<%# Bind("VendorAge") %>' />
                <br />
                ImageName:
                <asp:TextBox ID="ImageNameTextBox" runat="server" Text='<%# Bind("ImageName") %>' />
                <br />
                ImageUrl:
                <asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>' />
                <br />
                GenreId:
                <asp:TextBox ID="GenreIdTextBox" runat="server" Text='<%# Bind("GenreId") %>' />
                <br />
                AuthorId:
                <asp:TextBox ID="AuthorIdTextBox" runat="server" Text='<%# Bind("AuthorId") %>' />
                <br />
                PublisherId:
                <asp:TextBox ID="PublisherIdTextBox" runat="server" Text='<%# Bind("PublisherId") %>' />
                <br />
                Price:
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                BookName:
                <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                <br />
                PurchaseDate:
                <asp:TextBox ID="PurchaseDateTextBox" runat="server" Text='<%# Bind("PurchaseDate") %>' />
                <br />
                VendorEmail:
                <asp:TextBox ID="VendorEmailTextBox" runat="server" Text='<%# Bind("VendorEmail") %>' />
                <br />
                VendorAge:
                <asp:TextBox ID="VendorAgeTextBox" runat="server" Text='<%# Bind("VendorAge") %>' />
                <br />
                ImageName:
                <asp:TextBox ID="ImageNameTextBox" runat="server" Text='<%# Bind("ImageName") %>' />
                <br />
                ImageUrl:
                <asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>' />
                <br />
                GenreId:
                <asp:TextBox ID="GenreIdTextBox" runat="server" Text='<%# Bind("GenreId") %>' />
                <br />
                AuthorId:
                <asp:TextBox ID="AuthorIdTextBox" runat="server" Text='<%# Bind("AuthorId") %>' />
                <br />
                PublisherId:
                <asp:TextBox ID="PublisherIdTextBox" runat="server" Text='<%# Bind("PublisherId") %>' />
                <br />
                Price:
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                BookId:
                <asp:Label ID="BookIdLabel" runat="server" Text='<%# Eval("BookId") %>' />
                <br />
                BookName:
                <asp:Label ID="BookNameLabel" runat="server" Text='<%# Bind("BookName") %>' />
                <br />
                PurchaseDate:
                <asp:Label ID="PurchaseDateLabel" runat="server" Text='<%# Bind("PurchaseDate") %>' />
                <br />
                VendorEmail:
                <asp:Label ID="VendorEmailLabel" runat="server" Text='<%# Bind("VendorEmail") %>' />
                <br />
                VendorAge:
                <asp:Label ID="VendorAgeLabel" runat="server" Text='<%# Bind("VendorAge") %>' />
                <br />
                ImageName:
                <asp:Label ID="ImageNameLabel" runat="server" Text='<%# Bind("ImageName") %>' />
                <br />
                ImageUrl:
                <asp:Label ID="ImageUrlLabel" runat="server" Text='<%# Bind("ImageUrl") %>' />
                <br />
                GenreId:
                <asp:Label ID="GenreIdLabel" runat="server" Text='<%# Bind("GenreId") %>' />
                <br />
                AuthorId:
                <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Bind("AuthorId") %>' />
                <br />
                PublisherId:
                <asp:Label ID="PublisherIdLabel" runat="server" Text='<%# Bind("PublisherId") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                <br />

            </ItemTemplate>
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Product] WHERE ([GenreId] = @GenreId) ORDER BY [BookName]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="GenreId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <h3>List View</h3>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="BookId" DataSourceID="SqlDataSource4" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">BookId:
                    <asp:Label ID="BookIdLabel" runat="server" Text='<%# Eval("BookId") %>' />
                    <br />BookName:
                    <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                    <br />PurchaseDate:
                    <asp:Label ID="PurchaseDateLabel" runat="server" Text='<%# Eval("PurchaseDate") %>' />
                    <br />VendorEmail:
                    <asp:Label ID="VendorEmailLabel" runat="server" Text='<%# Eval("VendorEmail") %>' />
                    <br />VendorAge:
                    <asp:Label ID="VendorAgeLabel" runat="server" Text='<%# Eval("VendorAge") %>' />
                    <br />ImageName:
                    <asp:Label ID="ImageNameLabel" runat="server" Text='<%# Eval("ImageName") %>' />
                    <br />ImageUrl:
                    <asp:Label ID="ImageUrlLabel" runat="server" Text='<%# Eval("ImageUrl") %>' />
                    <br />GenreId:
                    <asp:Label ID="GenreIdLabel" runat="server" Text='<%# Eval("GenreId") %>' />
                    <br />AuthorId:
                    <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Eval("AuthorId") %>' />
                    <br />PublisherId:
                    <asp:Label ID="PublisherIdLabel" runat="server" Text='<%# Eval("PublisherId") %>' />
                    <br />Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">BookId:
                    <asp:Label ID="BookIdLabel1" runat="server" Text='<%# Eval("BookId") %>' />
                    <br />BookName:
                    <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                    <br />PurchaseDate:
                    <asp:TextBox ID="PurchaseDateTextBox" runat="server" Text='<%# Bind("PurchaseDate") %>' />
                    <br />VendorEmail:
                    <asp:TextBox ID="VendorEmailTextBox" runat="server" Text='<%# Bind("VendorEmail") %>' />
                    <br />VendorAge:
                    <asp:TextBox ID="VendorAgeTextBox" runat="server" Text='<%# Bind("VendorAge") %>' />
                    <br />ImageName:
                    <asp:TextBox ID="ImageNameTextBox" runat="server" Text='<%# Bind("ImageName") %>' />
                    <br />ImageUrl:
                    <asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>' />
                    <br />GenreId:
                    <asp:TextBox ID="GenreIdTextBox" runat="server" Text='<%# Bind("GenreId") %>' />
                    <br />AuthorId:
                    <asp:TextBox ID="AuthorIdTextBox" runat="server" Text='<%# Bind("AuthorId") %>' />
                    <br />PublisherId:
                    <asp:TextBox ID="PublisherIdTextBox" runat="server" Text='<%# Bind("PublisherId") %>' />
                    <br />Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">BookName:
                    <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                    <br />PurchaseDate:
                    <asp:TextBox ID="PurchaseDateTextBox" runat="server" Text='<%# Bind("PurchaseDate") %>' />
                    <br />VendorEmail:
                    <asp:TextBox ID="VendorEmailTextBox" runat="server" Text='<%# Bind("VendorEmail") %>' />
                    <br />VendorAge:
                    <asp:TextBox ID="VendorAgeTextBox" runat="server" Text='<%# Bind("VendorAge") %>' />
                    <br />ImageName:
                    <asp:TextBox ID="ImageNameTextBox" runat="server" Text='<%# Bind("ImageName") %>' />
                    <br />ImageUrl:
                    <asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>' />
                    <br />GenreId:
                    <asp:TextBox ID="GenreIdTextBox" runat="server" Text='<%# Bind("GenreId") %>' />
                    <br />AuthorId:
                    <asp:TextBox ID="AuthorIdTextBox" runat="server" Text='<%# Bind("AuthorId") %>' />
                    <br />PublisherId:
                    <asp:TextBox ID="PublisherIdTextBox" runat="server" Text='<%# Bind("PublisherId") %>' />
                    <br />Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">BookId:
                    <asp:Label ID="BookIdLabel" runat="server" Text='<%# Eval("BookId") %>' />
                    <br />BookName:
                    <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                    <br />PurchaseDate:
                    <asp:Label ID="PurchaseDateLabel" runat="server" Text='<%# Eval("PurchaseDate") %>' />
                    <br />VendorEmail:
                    <asp:Label ID="VendorEmailLabel" runat="server" Text='<%# Eval("VendorEmail") %>' />
                    <br />VendorAge:
                    <asp:Label ID="VendorAgeLabel" runat="server" Text='<%# Eval("VendorAge") %>' />
                    <br />ImageName:
                    <asp:Label ID="ImageNameLabel" runat="server" Text='<%# Eval("ImageName") %>' />
                    <br />ImageUrl:
                    <asp:Label ID="ImageUrlLabel" runat="server" Text='<%# Eval("ImageUrl") %>' />
                    <br />GenreId:
                    <asp:Label ID="GenreIdLabel" runat="server" Text='<%# Eval("GenreId") %>' />
                    <br />AuthorId:
                    <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Eval("AuthorId") %>' />
                    <br />PublisherId:
                    <asp:Label ID="PublisherIdLabel" runat="server" Text='<%# Eval("PublisherId") %>' />
                    <br />Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">BookId:
                    <asp:Label ID="BookIdLabel" runat="server" Text='<%# Eval("BookId") %>' />
                    <br />BookName:
                    <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                    <br />PurchaseDate:
                    <asp:Label ID="PurchaseDateLabel" runat="server" Text='<%# Eval("PurchaseDate") %>' />
                    <br />VendorEmail:
                    <asp:Label ID="VendorEmailLabel" runat="server" Text='<%# Eval("VendorEmail") %>' />
                    <br />VendorAge:
                    <asp:Label ID="VendorAgeLabel" runat="server" Text='<%# Eval("VendorAge") %>' />
                    <br />ImageName:
                    <asp:Label ID="ImageNameLabel" runat="server" Text='<%# Eval("ImageName") %>' />
                    <br />ImageUrl:
                    <asp:Label ID="ImageUrlLabel" runat="server" Text='<%# Eval("ImageUrl") %>' />
                    <br />GenreId:
                    <asp:Label ID="GenreIdLabel" runat="server" Text='<%# Eval("GenreId") %>' />
                    <br />AuthorId:
                    <asp:Label ID="AuthorIdLabel" runat="server" Text='<%# Eval("AuthorId") %>' />
                    <br />PublisherId:
                    <asp:Label ID="PublisherIdLabel" runat="server" Text='<%# Eval("PublisherId") %>' />
                    <br />Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
