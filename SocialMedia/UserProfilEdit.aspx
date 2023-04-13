<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfilEdit.aspx.cs" Inherits="SocialMedia.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SocialVe</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .avatar-upload {
            position: relative;
            max-width: 205px;
            margin: 50px auto;
        }

            .avatar-upload .avatar-edit {
                position: absolute;
                right: 12px;
                z-index: 1;
                top: 10px;
            }

                .avatar-upload .avatar-edit input {
                    display: none;
                }

                    .avatar-upload .avatar-edit input + label {
                        display: inline-block;
                        width: 34px;
                        height: 34px;
                        margin-bottom: 0;
                        border-radius: 100%;
                        background: #FFFFFF;
                        border: 1px solid transparent;
                        box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
                        cursor: pointer;
                        font-weight: normal;
                        transition: all 0.2s ease-in-out;
                    }

                        .avatar-upload .avatar-edit input + label:hover {
                            background: #f1f1f1;
                            border-color: #d6d6d6;
                        }

            .avatar-upload .avatar-preview {
                width: 192px;
                height: 192px;
                position: relative;
                border-radius: 100%;
                border: 6px solid #F8F8F8;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
            }

                .avatar-upload .avatar-preview > img {
                    width: 100%;
                    height: 100%;
                    border-radius: 100%;
                    background-size: cover;
                    background-repeat: no-repeat;
                    background-position: center;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server"> 
        <div class="container">
            <div class="row mt-3 mb-4">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between" style="background-color: #50b5ff;">
                            <div class="header-title">
                                <h4 class="card-title text-white">Personal Information</h4>
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


                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                    <asp:FileUpload ID="imageUpload" runat="server" />
                                                    <%--<input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" onchange="previewFile()" />--%>
                                                    <label for="imageUpload"></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <asp:Image ID="imagePreview" runat="server" class="profile-pic" ImageUrl="https://www.loginradius.com/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png" />
                                                    <%--<img id="imagePreview" src="https://www.loginradius.com/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png">--%>
                                                </div>
                                                <asp:Button ID="btn" runat="server" class="btn btn-primary mt-3" Style="margin-left: 36px; }"
                                                    Text="Upload Profile" OnClick="btn_Click" />

                                            </div>

                                            <div>
                                            </div>

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
                                        <input type="text" class="form-control" id="cname" runat="server" placeholder="9086763467">
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
                                        <input id="txt_country" runat="server" class="form-control" />
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label class="form-label">State:</label>
                                        <input id="txt_state" runat="server" class="form-control" />
                                    </div>
                                    <div class="form-group col-sm-12">
                                        <label class="form-label">Address:</label>
                                        <textarea class="form-control" id="txt_address" name="address" runat="server" rows="5" style="line-height: 22px;">                                                  
                                 </textarea>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <asp:Button id="btn_sumbit" runat="server" class="btn btn-primary me-2" Text="Submit" OnClick="btn_sumbit_Click"/>
                                    <%--                                        <asp:Button  ID="btn_submit" runat="server"  class="btn btn-primary me-2" Text="Submit" OnClick="btn_submit_Click"/>--%>
                                    <asp:Button ID="btn_updatedata" runat="server" class="btn btn-danger" Text="Update"  OnClick="btn_updatedata_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>



    </form>

</body>
</html>
