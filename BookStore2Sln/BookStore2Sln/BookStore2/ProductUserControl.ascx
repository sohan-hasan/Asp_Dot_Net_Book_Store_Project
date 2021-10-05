<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductUserControl.ascx.cs" Inherits="BookStore2.ProductUserControl" %>
<style>
    .img {
        height: 70px;
        width: 60px;
    }

    .auto-style1 {
        margin-bottom: 0px;
    }

    .auto-style3 {
        width: 262px;
    }

    .auto-style4 {
        height: 23px;
    }

    .auto-style7 {
        text-align: center;
    }
</style>
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table>
            <asp:HiddenField ID="HiddenImageName" runat="server" />
            <asp:HiddenField ID="HiddenImageUrl" runat="server" />
            <tr>
                <td colspan="2">
                    <h2 class="auto-style7">Genre wise Books</h2>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>

                <td>&nbsp;</td>
            </tr>
            <tr style="border:1px solid #ddd">
                <td style="border-right:1px solid #ddd; padding:10px">Author<br /></br>
                    <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox><br /></br>
                    <asp:Button ID="btnAuthor" runat="server" Text="Save" Width="91px" CausesValidation="false" OnClick="btnAuthor_Click" CssClass="btn-info" />
                </td>
                <td style="border-right:1px solid #ddd; padding:10px">Genre<br /></br>
                    <asp:TextBox ID="txtGenre" runat="server"></asp:TextBox><br />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Name must be in Upper Case" ControlToValidate="txtGenre" Display="Dynamic" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator></br>
                    <asp:Button ID="btnGenreSave" runat="server" Text="Save" Width="91px" CausesValidation="False" OnClick="btnGenreSave_Click" CssClass="btn-info"/>
                </td>
                <td style="border-right:1px solid #ddd; padding:10px">Publisher<br /></br>
                    <asp:TextBox ID="txtPublisher" runat="server"></asp:TextBox><br /><br />
                    <asp:Button ID="btnPublisher" runat="server" Text="Save" Width="91px" CausesValidation="false" OnClick="btnPublisher_Click" CssClass="btn-info" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>

                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <h2 class="auto-style7">Add Book</h2><br />
                </td>
            </tr>
            <tr>
                <td>Book Name</td>
                <td>
                    <asp:TextBox ID="txtBookName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name Required" ControlToValidate="txtBookName" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Purchase Date</td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox><asp:ImageButton ID="ImageButton1" runat="server" Height="33px" ImageUrl="~/App_Image/CalenderLogo.png" Width="35px" OnClick="ImageButton1_Click" CausesValidation="false" /><br />
                    <asp:Calendar ID="Calendar1" runat="server" Height="114px" Width="160px" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="rfbDate" runat="server" ErrorMessage="Date Required" ControlToValidate="txtDate" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Vendor Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Format" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Vendor Age</td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvAge" runat="server" ErrorMessage="Age Required" ControlToValidate="txtAge" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age must be greater than 18" ControlToValidate="txtAge" Display="Dynamic" ForeColor="Red" MaximumValue="90" MinimumValue="18">*</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td>Book's Image</td>
                <td>
                    <asp:Image ID="Image1" runat="server" class="img" /><br />
                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="if(confirm('upload'+this.value+'?')) this.form.submit()" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Genre</td>
                <td>
                    <asp:DropDownList ID="ddlGenre" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvGenre" runat="server" ErrorMessage="Please select a Genre." ControlToValidate="ddlGenre" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Author</td>
                <td>
                    <asp:DropDownList ID="ddlAuthor" runat="server"></asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ErrorMessage="Please select an Author." ControlToValidate="ddlAuthor" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Publisher</td>
                <td>
                    <asp:DropDownList ID="ddlPublisher" runat="server"></asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPublisher" runat="server" ErrorMessage="Please select a Publisher name." Display="Dynamic" ForeColor="Red" ControlToValidate="ddlPublisher">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Price</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ErrorMessage="Price Required" ControlToValidate="txtPrice" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSaveProduct" runat="server" Text="Save" Width="100px" Height="38px" OnClick="btnSaveProduct_Click" CssClass="btn-info" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" Width="100px" CssClass="auto-style1 btn-danger" Height="38px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnSaveProduct" />
    </Triggers>
</asp:UpdatePanel>

