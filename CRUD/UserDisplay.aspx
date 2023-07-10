<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDisplay.aspx.cs" Inherits="CRUD.UserDisplay" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
        type="text/css" />
</head>
<body style="padding-top: 10px">
    <div class="col-xs-8 col-xs-offset-2">
        <form id="form1" runat="server" class="form-horizontal">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Register</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="inputUsername" class="control-label col-xs-2">
                            User Name: 
                        </label>
                        <div class="col-xs-10">
                            <input type="text" runat="server" class="form-control"
                                id="inputUsername" placeholder="Username" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputUserNo" class="control-label col-xs-2">
                            User No:
                        </label>
                        <div class="col-xs-10">
                            <input type="number" runat="server" class="form-control"
                                id="inputUserNo" placeholder="UserNo" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-10 col-xs-offset-2">
                            <asp:Button ID="Create" runat="server" OnClick="Create_Click" Text="Create" />
                        </div>
                    </div>
                    
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Results</h3>
                </div>
                <div class="panel-body">
                    <div class="col-xs-10">
                        <asp:GridView ID="GridView" runat="server" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="569px" AutoGenerateColumns="False">
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />

                            <Columns>
                                <asp:TemplateField HeaderText="UserID">  
                                <EditItemTemplate>  
                                    <asp:TextBox ID="txtUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:TextBox>  
                                </EditItemTemplate>  
                                <ItemTemplate>  
                                    <asp:Label ID="LblUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>  
                                </ItemTemplate>  
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="UserName">  
                                    <EditItemTemplate>  
                                        <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>  
                                    </EditItemTemplate>  
                                    <ItemTemplate>  
                                        <asp:Label ID="LblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>  
                                    </ItemTemplate>  
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="UserNo">  
                                    <EditItemTemplate>  
                                        <asp:TextBox ID="txtUserNo" runat="server" Text='<%# Bind("UserNo") %>'></asp:TextBox>  
                                    </EditItemTemplate>  
                                    <ItemTemplate>  
                                        <asp:Label ID="LblUserNo" runat="server" Text='<%# Bind("UserNo") %>'></asp:Label>  
                                    </ItemTemplate>  
                                </asp:TemplateField> 
                                 <asp:TemplateField HeaderText="CreateDate">  
                                    <EditItemTemplate>  
                                        <asp:TextBox ID="txtCreateDate" runat="server" Text='<%# Bind("CreateDate") %>'></asp:TextBox>  
                                    </EditItemTemplate>  
                                    <ItemTemplate>  
                                        <asp:Label ID="LblCreateDate" runat="server" Text='<%# Bind("CreateDate") %>'></asp:Label>  
                                    </ItemTemplate>  
                                </asp:TemplateField> 
                                 <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                ItemStyle-Width="150" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>

