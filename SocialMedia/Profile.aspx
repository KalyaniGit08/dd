<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SocialMedia.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body profile-page p-0">
                        <div class="profile-header">
                            <div class="position-relative">
                                <img src="../assets/images/page-img/profile-bg1.jpg" alt="profile-bg" class="rounded img-fluid" loading="lazy">
                                <ul class="header-nav list-inline d-flex flex-wrap justify-end p-0 m-0">
                                    <%-- <li><a href="#" class="material-symbols-outlined">edit
                                    </a>
                                    </li>--%>
                                </ul>
                            </div>
                            <div class="user-detail text-center mb-3">
                                <div class="profile-img">
                                    <img src="" id="uimg" runat="server" alt="profile-img" class="avatar-130 img-fluid" loading="lazy">
                                </div>
                                <div class="profile-detail">
                                    <h3 class="" id="uname" runat="server"></h3>
                                </div>
                            </div>
                            <div class="profile-info p-3 d-flex align-items-center justify-content-between position-relative">
                                <div class="social-links">
                                    <ul class="social-data-block d-flex align-items-center justify-content-between list-inline p-0 m-0">
                                        <li class="text-center pe-3">
                                            <a href="#">
                                                <img src="../assets/images/icon/08.png" class="img-fluid rounded" alt="facebook" loading="lazy"></a>
                                        </li>
                                        <li class="text-center pe-3">
                                            <a href="#">
                                                <img src="../assets/images/icon/09.png" class="img-fluid rounded" alt="Twitter" loading="lazy"></a>
                                        </li>
                                        <li class="text-center pe-3">
                                            <a href="#">
                                                <img src="../assets/images/icon/10.png" class="img-fluid rounded" alt="Instagram" loading="lazy"></a>
                                        </li>
                                        <li class="text-center pe-3">
                                            <a href="#">
                                                <img src="../assets/images/icon/11.png" class="img-fluid rounded" alt="Google plus" loading="lazy"></a>
                                        </li>
                                        <li class="text-center pe-3">
                                            <a href="#">
                                                <img src="../assets/images/icon/12.png" class="img-fluid rounded" alt="You tube" loading="lazy"></a>
                                        </li>
                                        <li class="text-center md-pe-3 pe-0">
                                            <a href="#">
                                                <img src="../assets/images/icon/13.png" class="img-fluid rounded" alt="linkedin" loading="lazy"></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="social-info">
                                    <ul class="social-data-block d-flex align-items-center justify-content-between list-inline p-0 m-0">
                                        <li class="text-center ps-3">
                                            <h6>Posts</h6>
                                            <p class="mb-0" id="post" runat="server"></p>
                                        </li>
                                        <li class="text-center ps-3">
                                            <h6>Friends</h6>
                                            <p class="mb-0" id="friend" runat="server"></p>
                                        </li>
                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-4 col-lg-4">
                <div class="card">
                    <div class="card-body p-0">
                        <div class="user-tabing">
                            <ul class="nav nav-pills d-flex align-items-center justify-content-center profile-feed-items p-0 m-0">

                                <li class="nav-item col-12 col-sm-3 p-0">
                                    <a class="nav-link active" href="#Abouts" data-bs-toggle="pill" data-bs-target="#Abouts" role="button">Abouts</a>
                                </li>
                                <li class="nav-item col-12 col-sm-3 p-0">
                                    <a class="nav-link" href="#Friends" data-bs-toggle="pill" data-bs-target="#Friends" role="button">Friends</a>
                                </li>
                                <li class="nav-item col-12 col-sm-3 p-0">
                                    <a class="nav-link" href="#Photos" data-bs-toggle="pill" data-bs-target="#Photos" role="button">Photos</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="Abouts" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <h4>Contact Information</h4>
                                <hr>
                                <div class="row">
                                    <div class="col-3">
                                        <h6>Email</h6>
                                    </div>
                                    <div class="col-9">
                                        <a href="#" class="mb-0" id="email" runat="server"></a>
                                    </div>
                                    <div class="col-3">
                                        <h6>Mobile</h6>
                                    </div>
                                    <div class="col-9">
                                        <p class="mb-0" id="mobile" runat="server"></p>
                                    </div>
                                    <div class="col-3">
                                        <h6>Address</h6>
                                    </div>
                                    <div class="col-9">
                                        <p class="mb-0" id="address" runat="server"></p>
                                    </div>
                                </div>

                                <h4 class="mt-3">Basic Information</h4>
                                <hr>
                                <div class="row">
                                    <div class="col-4">
                                        <h6>Birth Date</h6>
                                    </div>
                                    <div class="col-8">
                                        <p class="mb-0" id="dob" runat="server"></p>
                                    </div>

                                    <div class="col-4">
                                        <h6>Gender</h6>
                                    </div>
                                    <div class="col-8">
                                        <p class="mb-0" id="gender" runat="server"></p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="Photos" role="tabpanel">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <div class="header-title">
                                    <h4 class="card-title">Photos</h4>
                                </div>
                                <div class="card-header-toolbar d-flex align-items-center">
                                    <p class="m-0"><a href="javacsript:void();">Add Photo </a></p>
                                </div>
                            </div>
                            <div class="card-body">
                                <ul class="profile-img-gallary p-0 m-0 list-unstyled">
                                    <asp:Repeater ID="rpt_photo" runat="server">
                                        <ItemTemplate>

                                            <li class="">
                                                <a data-fslightbox="gallery" href='<%#Eval("image_url") %>'>
                                                    <img src='<%#Eval("image_url") %>' class="img-fluid" alt="photo-profile" loading="lazy" style="width: 140px; height: 110px;">
                                                </a>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <li id="error_msg" runat="server" visible="false">No Photos Available!</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="Friends" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <ul class="request-list list-inline m-0 p-0">
                                    <asp:Repeater ID="rpt_friendlist" runat="server">
                                        <ItemTemplate>

                                            <li class="d-flex align-items-center  flex-wrap">
                                                <div class="user-img img-fluid flex-shrink-0">
                                                    <asp:Image runat="server" class="rounded-circle avatar-40" ImageUrl='<%Eval("profile") %>' />
                                                    <%--<img src="../assets/images/user/13.jpg" alt="story-img" class="rounded-circle avatar-40">--%>
                                                </div>
                                                <div class="flex-grow-1 ms-3">
                                                    <h6><%# Eval("username") %></h6>
                                                    <p class="mb-0">friends</p>
                                                </div>
                                                <div class="d-flex align-items-center mt-2 mt-md-0">
                                                    <a href="#" class=" btn btn-primary rounded">Follow</a>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <label id="msg" runat="server" visible="false">No Friends!</label>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-lg-8">
                <div id="post-modal-data" class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Create Post</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="user-img">
                                <img src="" id="img_user" runat="server" alt="userimg" class="avatar-60 rounded-circle">
                            </div>
                            <div class="post-text ms-3 w-100 ">
                                <a href="CreatePost.aspx"  class="form-control rounded" style="border: none;">Create New Post</a>
                                <%--<input type="text" class="form-control rounded" placeholder="Write something here..." style="border: none;">--%>
                            </div>
                        </div>
                        <hr>
                        <ul class="post-opt-block d-flex list-inline m-0 p-0 flex-wrap">
                            <li class="bg-soft-primary rounded p-2 pointer d-flex align-items-center me-3 mb-md-0 mb-2">
                                <img src="../assets/images/small/07.png" alt="icon" class="img-fluid me-2" loading="lazy">
                                Photo/Video</li>
                            <li class="bg-soft-primary rounded p-2 pointer d-flex align-items-center me-3 mb-md-0 mb-2">
                                <img src="../assets/images/small/08.png" alt="icon" class="img-fluid me-2" loading="lazy">
                                Tag Friend</li>
                            <li class="bg-soft-primary rounded p-2 pointer d-flex align-items-center me-3">
                                <img src="../assets/images/small/09.png" alt="icon" class="img-fluid me-2" loading="lazy">
                                Feeling/Activity</li>
                            <li class="bg-soft-primary rounded p-2 pointer text-center">
                                <div class="card-header-toolbar d-flex align-items-center">
                                    <div class="dropdown">
                                        <div class="dropdown-toggle lh-1" id="post-option" data-bs-toggle="dropdown">
                                            <span class="material-symbols-outlined">more_horiz</span>
                                        </div>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="post-option" style="">
                                            <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#post-modal">Check in</a>
                                            <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#post-modal">Live Video</a>
                                            <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#post-modal">Gif</a>
                                            <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#post-modal">Watch Party</a>
                                            <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#post-modal">Play with Friend</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
             
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                            <h4>Posts</h4>
                            
                        </div>
                    </div>
                </div>
                <asp:Repeater ID="rpt_postlist" runat="server">
                    <ItemTemplate>
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex  justify-content-between">
                                    <div class="me-3">
                                        <div class="iq-profile-avatar status-online">
                                            <asp:Image ID="user_img" runat="server" Width="40" class="rounded-circle img-fluid" ImageUrl='<%#Eval("profile") %>' loading="lazy" />
                                        </div>
                                    </div>
                                    <div class="w-100">
                                        <div class="d-flex justify-content-between">
                                            <div class="">
                                                <h5 class="mb-0 d-inline-block"><%#Eval("username") %></h5>
                                                <span class="mb-0 d-inline-block">Add New Post</span>
                                                <p class="mb-0 text-primary"><%#Eval("created_date" ,"{0:dd-MMM-yyyy}") %></p>
                                            </div>
                                            <div class="card-post-toolbar">
                                                <div class="dropdown">
                                                    <span class="dropdown-toggle material-symbols-outlined" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">more_horiz
                                                    </span>
                                                    <div class="dropdown-menu m-0 p-0">
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                                <span class="material-symbols-outlined">save
                                                                </span>
                                                                <div class="data ms-2">
                                                                    <h6>Save Post</h6>
                                                                    <p class="mb-0">Add this to your saved items</p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                                <span class="material-symbols-outlined">edit
                                                                </span>
                                                                <div class="data ms-2">
                                                                    <h6>Edit Post</h6>
                                                                    <p class="mb-0">Update your post and saved items</p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                                <span class="material-symbols-outlined">cancel
                                                                </span>
                                                                <div class="data ms-2">
                                                                    <h6>Hide From Timeline</h6>
                                                                    <p class="mb-0">See fewer posts like this.</p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                                <span class="material-symbols-outlined">delete
                                                                </span>
                                                                <div class="data ms-2">
                                                                    <h6>Delete</h6>
                                                                    <p class="mb-0">Remove thids Post on Timeline</p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item p-3" href="#">
                                                            <div class="d-flex align-items-top">
                                                                <span class="material-symbols-outlined">notifications
                                                                </span>
                                                                <div class="data ms-2">
                                                                    <h6>Notifications</h6>
                                                                    <p class="mb-0">Turn on notifications for this post</p>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="user-post mt-2">
                                    <a href="#">
                                        <asp:Image ID="img_post" runat="server" Style="height: 500px" ImageUrl='<%#Eval("image_url") %>' class="img-fluid rounded w-100" loading="lazy" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="col-sm-12" id="nopost" runat="server" visible="false" >
                    <div class="card card-block card-stretch card-height">
                        <div class="card-body">
                            <div class="user-post">
                                <div class=" d-grid grid-rows-2 grid-flow-col gap-3">
                                    <div class="row-span-2 row-span-md-1">
                                        <img src="/Images/nopost.png" alt="post-image" class="img-fluid rounded w-100" loading="lazy">
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<div class="card card-body">
                    <label id="msg_err" runat="server" visible="false">No Post Availble!</label>
                </div>--%>
            </div>
        </div>
    </div>

</asp:Content>
