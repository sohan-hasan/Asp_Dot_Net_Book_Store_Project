<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookStore2.Registration.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto" style="margin:75px; background:#1e5f3b; padding:40px;">
                <h1 class="text-center">User Register</h1>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">User Name</label>
                    <asp:TextBox ID="txtUserName" runat="server" class="form-control"></asp:TextBox><br />
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                      <asp:TextBox ID="txtPassword" runat="server"  class="form-control" TextMode="Password"></asp:TextBox><br />
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Confirm Password</label>
                      <asp:TextBox ID="txtConfirmPass" runat="server" class="form-control"  TextMode="Password"></asp:TextBox>
                       <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password &amp; Confirm Password must match." ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass" Display="Dynamic" ForeColor="Red">Compare Validator</asp:CompareValidator>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Email</label>
                      <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="mb-3 form-check">
                    <asp:CheckBox ID="chkBoxRememberMe" runat="server" Text="&nbsp;&nbsp;Remember Me" CssClass="text-info" />
                </div>
                      <asp:Button ID="Button1" runat="server" Text="Register" OnClick="btnRegister_Click"   CssClass="btn-info" /><br />
                     <a href="../Login.aspx">Go To Login Page</a>
            </div>
            </div>
        </div>
    
</asp:Content>
