<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProfileEdit.aspx.cs" Inherits="SocialMedia.ProfileEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=ImgPrv.ClientID%>').prop('src', e.target.result)
                        .width(240)
                        .height(150);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>


   <script>
       var loadFile = function (event) {
           var output = document.getElementById('output');
           output.src = URL.createObjectURL(event.target.files[0]);
           output.onload = function () {
               URL.revokeObjectURL(output.src) // free memory
           }
       };
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="cse" runat="server"></asp:ScriptManager>
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body p-0">
                        <div class="iq-edit-list">
                            <ul class="iq-edit-profile row nav nav-pills" role="tablist">
                                <li class="col-md-3 p-0">
                                    <a class="nav-link active" data-bs-toggle="pill" href="#personal-information" aria-selected="true" role="tab">Personal Information
                                    </a>
                                </li>
                                <li class="col-md-3 p-0">
                                    <a class="nav-link" data-bs-toggle="pill" href="#chang-pwd" aria-selected="false" role="tab" tabindex="-1">Change Password
                                    </a>
                                </li>
                                <li class="col-md-3 p-0">
                                    <a class="nav-link" data-bs-toggle="pill" href="#emailandsms" aria-selected="false" role="tab" tabindex="-1">Email and SMS
                                    </a>
                                </li>
                                <li class="col-md-3 p-0">
                                    <a class="nav-link" data-bs-toggle="pill" href="#manage-contact" aria-selected="false" role="tab" tabindex="-1">Manage Contact
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="iq-edit-list-data">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="personal-information" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <div class="header-title">
                                        <h4 class="card-title">Personal Information</h4>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div class="form-group row align-items-center">
                                            <div class="col-md-12">
                                                <div class="profile-img-edit">
                                                    <%--<img class="profile-pic" src="../assets/images/user/11.png" alt="profile-pic" loading="lazy">
                                                    <div class="p-image d-flex align-items-center justify-content-center">
                                                        <span class="material-symbols-outlined">edit</span>
                                                        <input class="file-upload" type="file" accept="image/*">
                                                    </div>--%> 
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>


                                                            <asp:Image ID="ImgPrv" Height="150px" Width="240px" runat="server" /><br />
                                                            <asp:FileUpload ID="flupImage" runat="server" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>


                                                    <%--<asp:FileUpload ID="upload1" runat="server" />--%>
                                                    <button ID="btnPreview" runat="server" onserverclick="btnPreview_ServerClick">Upload & Preview</button>
                                                    <hr />
                                                    <%--<asp:Image ID="imgDetail" Visible="false" runat="server" />--%>

                                                </div>
                                            </div>
                                        </div>
                                        <div class=" row align-items-center">
                                          
                                            <div class="form-group col-sm-6">
                                                <label for="uname" class="form-label">User Name:</label>
                                                <input type="text" class="form-control" id="uname" runat="server" placeholder="Bni@01">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="cname" class="form-label">Mobile:</label>
                                                <input type="text" class="form-control" id="cname" maxlength="10" runat="server" placeholder="9086763467">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="form-label d-block">Gender:</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="male" runat="server" value="option1">
                                                    <label class="form-check-label" for="inlineRadio10">Male</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="female" runat="server" value="option1">
                                                    <label class="form-check-label" for="inlineRadio11">Female</label>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="dob" class="form-label">Date Of Birth:</label>
                                                <input type="date" class="form-control" id="dob" runat="server" placeholder="1984-01-24">
                                            </div>
                                        
                                            <div class="form-group col-sm-6">
                                                <label class="form-label">Country:</label>
                                                <input  id="txt_country" runat="server" class="form-control"/>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="form-label">State:</label>
                                                <input  id="txt_state" runat="server" class="form-control"/>
                                            </div>
                                            <div class="form-group col-sm-12">
                                                <label class="form-label">Address:</label>
                                                <textarea class="form-control" id="txt_address" name="address"  runat="server" rows="5" style="line-height: 22px;">                                                  
                                 </textarea>
                                            </div>
                                        </div>
                                       <button id="btn_submit" runat="server"  class="btn btn-primary me-2" onserverclick="btn_submit_ServerClick">Submit</button>
<%--                                        <asp:Button  ID="btn_submit" runat="server"  class="btn btn-primary me-2" Text="Submit" OnClick="btn_submit_Click"/>--%>
                  <asp:Button  ID="btn_update" runat="server" class="btn bg-soft-danger" Text="Update" OnClick="btn_update_Click" />
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="chang-pwd" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">Change Password</h4>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div class="form-group">
                                            <label for="cpass" class="form-label">Current Password:</label>
                                            <a href="#" class="float-end">Forgot Password</a>
                                            <input type="Password" class="form-control" id="cpass" value="">
                                        </div>
                                        <div class="form-group">
                                            <label for="npass" class="form-label">New Password:</label>
                                            <input type="Password" class="form-control" id="npass" value="">
                                        </div>
                                        <div class="form-group">
                                            <label for="vpass" class="form-label">Verify Password:</label>
                                            <input type="Password" class="form-control" id="vpass" value="">
                                        </div>
                                        <button type="submit" class="btn btn-primary me-2">Submit</button>
                                        <button type="reset" class="btn bg-soft-danger">Cancle</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                       </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
