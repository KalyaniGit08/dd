<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AllPeople.aspx.cs" Inherits="SocialMedia.FriendList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Sweetlaert2 css -->
    <link rel="stylesheet" href="assets/vendor/sweetalert2/dist/sweetalert2.min.css" />



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <asp:Repeater ID="rpt_friendlist" runat="server" OnItemCommand="rpt_friendlist_ItemCommand" OnItemDataBound="rpt_friendlist_ItemDataBound">
                <ItemTemplate>
                    <div class="col-md-6">
                        <div class="card card-block card-stretch card-height">
                            <div class="card-body profile-page p-0">
                                <div class="profile-header-image">
                                    <div class="cover-container">
                                        <img src="assets/images/page-img/profile-bg2.jpg" alt="profile-bg" class="rounded img-fluid w-100" loading="lazy">
                                    </div>
                                    <div class="profile-info p-4">
                                        <div class="user-detail">
                                            <div class="d-flex flex-wrap justify-content-between align-items-start">
                                                <div class="profile-detail d-flex">
                                                    <div class="profile-img pe-4">
                                                        <asp:Image  ID="img" runat="server" ImageUrl='<%# Eval("profile") == DBNull.Value ? "/Images/avatar.jpg" : Eval("profile") %>' class="avatar-130 img-fluid" AlternateText="Profile-image"/>
                                                        <%--<img src='<%# Eval("profile") == DBNull.Value ? "/Images/avatar.png" : Eval("profile") %>'  loading="lazy" class="avatar-130 img-fluid" />--%>
                                                    </div>
                                                    <%--<%#Eval("profile" ) %>'--%>
                                                    <div class="user-data-block mt-md-0 mt-2">
                                                        <h4>
                                                            <a href="friend-profile.html"><%#Eval("username") %></a>
                                                        </h4>
                                                       <%-- <h6><<%#Eval("username1") %>></h6>--%>
                                                        <p class="mb-2 mb-md-0">Join On : <%#Eval("created_date","{0:dd-MMM-yy}") %></p>
                                                    </div>
                                                </div>
                                                <asp:LinkButton ID="btn_req" runat="server" class="btn btn-primary" CommandName="Request" CommandArgument='<%#Eval("id")%>'>Following</asp:LinkButton>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>




    </div>
</asp:Content>
