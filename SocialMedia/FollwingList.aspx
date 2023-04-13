<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FollwingList.aspx.cs" Inherits="SocialMedia.FriendRequestList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <asp:Repeater ID="rpt_followingist" runat="server">
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
                                                        <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("profile") == DBNull.Value ? "/Images/avatar.jpg" : Eval("profile") %>' class="avatar-130 img-fluid" AlternateText="Profile-image" />
                                                        <%--<img src='<%# Eval("profile") == DBNull.Value ? "/Images/avatar.png" : Eval("profile") %>'  loading="lazy" class="avatar-130 img-fluid" />--%>
                                                    </div>
                                                    <%--<%#Eval("profile" ) %>'--%>
                                                    <div class="user-data-block mt-md-0 mt-2">
                                                        <h4>
                                                            <a href="friend-profile.html"><%#Eval("username") %></a>
                                                        </h4>
                                                        <h6>
                                                            <<%#Eval("username1") %>>
                                                        </h6>
                                                        <p class="mb-2 mb-md-0">Join On : <%#Eval("created_date","{0:dd-MMM-yy}") %></p>
                                                    </div>
                                                </div>
                                                <asp:LinkButton ID="btn_req" runat="server" class="btn btn-primary">Request Send</asp:LinkButton>
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
        <div class="row" id="nomsg" runat="server" visible="false">
            <div class="card card-body">
                <label>No Following!</label>
            </div>
        </div>
    </div>
</asp:Content>
