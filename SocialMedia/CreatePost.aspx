<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePost.aspx.cs" Inherits="SocialMedia.CreatePost" %>

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
                right: -9px;
                z-index: 1;
                top: -7px;
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
                width: 200px;
                height: 200px;
                position: relative;
                /*border-radius: 100%;*/
                border: 6px solid #F8F8F8;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
            }

                .avatar-upload .avatar-preview > img {
                    width: 100%;
                    height: 100%;
                    /*border-radius: 100%;*/
                    background-size: cover;
                    background-repeat: no-repeat;
                    background-position: center;
                }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row mt-4">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="card card-body">
                        <div class="card-header">
                            <h5>Create New Post</h5>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="user-img">
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
                                            Text="Upload Image" OnClick="btn_Click" />
                                    </div>
                                </div>
                                <div class="post-text ms-3 w-100" action="#">
                                    <input type="text" id="txt_posttext" runat="server" class="form-control rounded" placeholder="Write something here..." style="border: none;" />

                                </div>
                            </div>
                            <hr />
                            <ul class="d-flex flex-wrap align-items-center list-inline m-0 p-0">
                                <li class="col-md-2 mb-3">
                                    <div class="bg-soft-primary rounded p-2 pointer me-3">
                                        <a href="#"></a>
                                        <img src="../assets/images/small/10.png" alt="icon" class="img-fluid" loading="lazy" />
                                        Check in
                                    </div>
                                </li>
                                <li class="col-md-10 mb-3">
                                    <div class="rounded p-2 pointer me-3">
                                        <input type="text" id="txt_location" runat="server" class="form-control rounded" placeholder="Add Your Location" style="border: none;" />
                                    </div>
                                </li>
                            </ul>
                            <hr />

                            <button type="submit" class="btn btn-primary d-block w-100 mt-3" id="btn_post" runat="server" onserverclick="btn_post_ServerClick">Post</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
    </form>
</body>
</html>
