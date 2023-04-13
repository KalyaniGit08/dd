<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FollwersList.aspx.cs" Inherits="SocialMedia.FriendRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
   <div class="row">
      <div class="col-sm-12">
         <div class="card">
            <div class="card-header d-flex justify-content-between">
               <div class="header-title">
                  <h4 class="card-title">Friend Request</h4>
               </div>
            </div>
            <div class="card-body">
               <ul class="request-list list-inline m-0 p-0">
              
        <asp:Repeater ID="rpt_reqlist" runat="server" OnItemCommand="rpt_reqlist_ItemCommand">
            <ItemTemplate>
                <li class="d-flex align-items-center  justify-content-between flex-wrap">
                    <div class="user-img img-fluid flex-shrink-0">
                        <img src='<%# Eval("profile") == DBNull.Value ? "/Images/avatar.jpg" : Eval("profile") %>' alt="story-img" class="rounded-circle avatar-40" loading="lazy">
                    </div>
                    <div class="flex-grow-1 ms-3">
                        <h6><%#Eval("username") %></h6>
                        <p class="mb-0">friends</p>
                    </div>
                    <div class="d-flex align-items-center mt-2 mt-md-0">
                        <div class="confirm-click-btn">
                            <asp:LinkButton ID="btn_confirm" runat="server" class="me-3 btn btn-primary rounded confirm-btn" CommandName="confirm" CommandArgument='<%#Eval("id") %>'>Confirm</asp:LinkButton>
                        </div>
                        <asp:LinkButton ID="btn_delete" runat="server" class="btn btn-secondary rounded" CommandName="delete" CommandArgument='<%#Eval("id") %>'>Delete Request</asp:LinkButton>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
                     <li id="lbl_error" runat="server" visible="false">No Request!</li>

               </ul>
            </div>
         </div>     
      </div>
   </div>
</div>


    <script src="../assets/js/enchanter.js"></script>
  <!-- Sweet-alert Script -->
  <script src="../assets/vendor/sweetalert2/dist/sweetalert2.min.js" async></script>
  <script src="../assets/js/sweet-alert.js" defer></script>
 
</asp:Content>
