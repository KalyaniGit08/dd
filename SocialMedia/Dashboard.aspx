<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SocialMedia.Dashoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-lg-8 row m-0 p-0">
                <div class="col-sm-12">
                    <div id="post-modal-data" class="card card-block card-stretch card-height">
                        <div class="card-header d-flex justify-content-between">
                            <div class="header-title">
                                <h4 class="card-title">Create Post</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="user-img">
                                    <img src="" id="user_img" runat="server" alt="userimg" class="avatar-60 rounded-circle" loading="lazy">
                                </div>
                                <div class="post-text ms-3 w-100 ">
                                    <a href="CreatePost.aspx" class="form-control rounded" style="border: none;">Create New Post...</a>
                                </div>
                            </div>
                            <hr>
                            <ul class=" post-opt-block d-flex list-inline m-0 p-0 flex-wrap">
                                <li class="me-3 mb-md-0 mb-2">
                                    <a href="#" class="btn btn-soft-primary">
                                        <img src="../assets/images/small/07.png" alt="icon" class="img-fluid me-2" loading="lazy">
                                        Photo/Video
                                    </a>
                                </li>
                                <li class="me-3 mb-md-0 mb-2">
                                    <a href="#" class="btn btn-soft-primary">
                                        <img src="../assets/images/small/08.png" alt="icon" class="img-fluid me-2" loading="lazy">
                                        Tag Friend
                                    </a>
                                </li>
                                <li class="me-3">
                                    <a href="#" class="btn btn-soft-primary">
                                        <img src="../assets/images/small/09.png" alt="icon" class="img-fluid me-2" loading="lazy">
                                        Feeling/Activity
                                    </a>
                                </li>
                                <li>
                                    <div class="btn btn-soft-primary">
                                        <div class="card-header-toolbar d-flex align-items-center">
                                            <div class="dropdown">
                                                <div class="dropdown-toggle lh-1" id="post-option" data-bs-toggle="dropdown">
                                                    <span class="material-symbols-outlined">more_horiz
                                                    </span>
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
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>

                <asp:Repeater ID="rpt_postlist" runat="server" OnItemCommand="rpt_postlist_ItemCommand" OnItemDataBound="rpt_postlist_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-sm-12">
                            <div class="card card-block card-stretch ">
                                <div class="card-body">
                                    <div class="user-post-data">
                                        <div class="d-flex justify-content-between">
                                            <div class="me-3">
                                                <asp:Image ID="user_img" runat="server" Width="40" class="rounded-circle img-fluid" ImageUrl='<%#Eval("profile") %>' loading="lazy" />
                                            </div>
                                            <div class="w-100">
                                                <div class="d-flex justify-content-between">
                                                    <div class="">
                                                        <asp:Label runat="server" Style="display: none;"><%#Eval("post_id") %></asp:Label>
                                                        <h5 class="mb-0 d-inline-block"><%#Eval("username") %></h5>
                                                        <span class="mb-0 d-inline-block">Add New Post</span>
                                                        <p class="mb-0 text-primary"><%#Eval("created_date" ,"{0:dd-MMM-yyyy}") %></p>
                                                    </div>
                                                    <div class="card-post-toolbar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <p><%#Eval("post_text") %></p>
                                    </div>


                                    <div class="user-post">
                                        <a href="javascript:void(0);">
                                            <asp:Image ID="img_post" runat="server" Style="height: 500px;" ImageUrl='<%#Eval("image_url") %>' class="img-fluid rounded w-100" loading="lazy" />
                                        </a>
                                    </div>


                                    <div class="comment-area mt-3">
                                        <div class="d-flex justify-content-between align-items-center flex-wrap">
                                            <div class="like-block position-relative d-flex align-items-center">
                                                <div class="d-flex align-items-center">
                                                    <div class="like-data">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                                <img src="../assets/images/icon/01.png" class="img-fluid" alt="">
                                                            </span>
                                                            <div class="dropdown-menu py-2">

                                                                <asp:LinkButton ID="btn_like" runat="server" CommandName="like" CommandArgument='<%#Eval("user_id") + "," + Eval("post_id")%>' class="ms-2 me-2" data-bs-toggle="tooltip" data-bs-placement="top" title="Like">
                                                                <img src="../assets/images/icon/01.png" class="img-fluid" alt="" loading="lazy">
                                                                </asp:LinkButton>

                                                                <%--<asp:Label runat="server" ID="like" class="ms-2 me-2" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Like" >
                                                            <img src="../assets/images/icon/01.png" class="img-fluid" alt="" loading="lazy"></asp:Label>--%>
                                                                 <a class="me-2" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Love">
                                                            <img src="../assets/images/icon/02.png" class="img-fluid" alt="" loading="lazy"></a>
                                                        <a class="me-2" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Happy">
                                                            <img src="../assets/images/icon/03.png" class="img-fluid" alt="" loading="lazy"></a>
                                                        <a class="me-2" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="HaHa">
                                                            <img src="../assets/images/icon/04.png" class="img-fluid" alt="" loading="lazy"></a>
                                                        <a class="me-2" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Think">
                                                            <img src="../assets/images/icon/05.png" class="img-fluid" alt="" loading="lazy"></a>
                                                        <a class="me-2" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Sade">
                                                            <img src="../assets/images/icon/06.png" class="img-fluid" alt="" loading="lazy"></a>
                                                        <a class="me-2" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Lovely">
                                                            <img src="../assets/images/icon/07.png" class="img-fluid" alt="" loading="lazy"></a>
                                                            </div>
                                                        </div>
                                                    </div>




                                                    <div class="total-like-block ms-2 me-3">
                                                        <div class="dropdown">
                                                            <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
                                                                <asp:Label runat="server"><%#Eval("LikeCNT") %></asp:Label>
                                                                Likes
                                                            </span>
                                                            <%-- <asp:Label id="like_count" runat="server"></asp:Label>--%>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="#">Max Emum</a>
                                                                <a class="dropdown-item" href="#">Bill Yerds</a>
                                                                <a class="dropdown-item" href="#">Hap E. Birthday</a>
                                                                <a class="dropdown-item" href="#">Tara Misu</a>
                                                                <a class="dropdown-item" href="#">Midge Itz</a>
                                                                <a class="dropdown-item" href="#">Sal Vidge</a>
                                                                <a class="dropdown-item" href="#">Other</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="total-comment-block">
                                                    <div class="dropdown">
                                                        <span class="dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">20 Comment
                                                        </span>
                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item" href="#">Max Emum</a>
                                                            <a class="dropdown-item" href="#">Bill Yerds</a>
                                                            <a class="dropdown-item" href="#">Hap E. Birthday</a>
                                                            <a class="dropdown-item" href="#">Tara Misu</a>
                                                            <a class="dropdown-item" href="#">Midge Itz</a>
                                                            <a class="dropdown-item" href="#">Sal Vidge</a>
                                                            <a class="dropdown-item" href="#">Other</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="share-block d-flex align-items-center feather-icon mt-2 mt-md-0">
                                                <a href="javascript:void(0);" data-bs-toggle="offcanvas" data-bs-target="#share-btn" aria-controls="share-btn" class="d-flex align-items-center">
                                                    <span class="material-symbols-outlined md-18">
                                                    </span>
                                                    <span class="ms-1">Share</span></a>
                                            </div>
                                        </div>

                                        <hr>

                                        <ul class="post-comments list-inline p-0 m-0">
                                            <li class="mb-2">
                                                <div class="d-flex">
                                                    <div class="user-img">
                                                        <img src="../assets/images/user/02.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid" loading="lazy">
                                                    </div>
                                                    <div class="comment-data-block ms-3">
                                                        <h6>Monty Carlo</h6>
                                                        <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void(0);">like</a>
                                                            <a href="javascript:void(0);">reply</a>
                                                            <a href="javascript:void(0);">translate</a>
                                                            <span>5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="d-flex">
                                                    <div class="user-img">
                                                        <img src="../assets/images/user/03.jpg" alt="userimg" class="avatar-35 rounded-circle img-fluid" loading="lazy">
                                                    </div>
                                                    <div class="comment-data-block ms-3">
                                                        <h6>Paul Molive</h6>
                                                        <p class="mb-0">Lorem ipsum dolor sit amet</p>
                                                        <div class="d-flex flex-wrap align-items-center comment-activity">
                                                            <a href="javascript:void(0);">like</a>
                                                            <a href="javascript:void(0);">reply</a>
                                                            <a href="javascript:void(0);">translate</a>
                                                            <span>5 min </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>

                                        <div class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                                           
                                            <asp:TextBox ID="txt_comment" runat="server" class="form-control rounded"  placeholder="Enter Your Comment"></asp:TextBox>
                                            <%--<input type="text" id="txt_comment" runat="server" class="form-control rounded" placeholder="Enter Your Comment">--%>
                                            <div class="comment-attagement d-flex">
                                                <asp:LinkButton ID="btn_send" runat="server" class="btn btn-md btn-primary" CommandName="comment" CommandArgument='<%#Eval("post_id") %>'>Send</asp:LinkButton>
                                                <%--<button id="btn_sendmsg" runat="server" class="btn btn-md btn-primary"   onserverclick="btn_sendmsg_ServerClick">send</button>--%>
                                            </div>
                                        </div>

                                    </div>
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

            </div>

            <div class="col-lg-4">

                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Suggested Pages</h4>
                        </div>
                        <div class="card-header-toolbar d-flex align-items-center">
                            <div class="dropdown">
                                <div class="dropdown-toggle" id="dropdownMenuButton01" data-bs-toggle="dropdown" aria-expanded="false" role="button">
                                    <span class="material-symbols-outlined">more_horiz
                                    </span>
                                </div>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton01">
                                    <a class="dropdown-item d-flex align-items-center" href="#"><span class="material-symbols-outlined me-2 md-18">visibility
                                    </span>View</a>
                                    <a class="dropdown-item d-flex align-items-center" href="#"><span class="material-symbols-outlined me-2 md-18">delete
                                    </span>Delete</a>
                                    <a class="dropdown-item d-flex align-items-center" href="#"><span class="material-symbols-outlined me-2 md-18">edit
                                    </span>Edit</a>
                                    <a class="dropdown-item d-flex align-items-center" href="#"><span class="material-symbols-outlined me-2 md-18">print
                                    </span>Print</a>
                                    <a class="dropdown-item d-flex align-items-center" href="#"><span class="material-symbols-outlined me-2 md-18">file_download
                                    </span>Download</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <ul class="suggested-page-story m-0 p-0 list-inline">
                            <li class="mb-3">
                                <div class="d-flex align-items-center mb-3">
                                    <img src="../assets/images/page-img/42.png" alt="story-img" class="rounded-circle img-fluid avatar-50" loading="lazy">
                                    <div class="stories-data ms-3">
                                        <h5>Iqonic Studio</h5>
                                        <p class="mb-0">Lorem Ipsum</p>
                                    </div>
                                </div>
                                <img src="../assets/images/small/img-1.jpg" class="img-fluid rounded" alt="Responsive image" loading="lazy">
                                <div class="mt-3">
                                    <a href="#" class=" d-flex align-items-center justify-content-center"><span class="material-symbols-outlined me-2 md-18">thumb_up
                                    </span>Like Page</a>
                                </div>
                            </li>
                            <li class="">
                                <div class="d-flex align-items-center mb-3">
                                    <img src="../assets/images/page-img/42.png" alt="story-img" class="rounded-circle img-fluid avatar-50" loading="lazy">
                                    <div class="stories-data ms-3">
                                        <h5>Cakes & Bakes </h5>
                                        <p class="mb-0">Lorem Ipsum</p>
                                    </div>
                                </div>
                                <img src="../assets/images/small/img-2.jpg" class="img-fluid rounded" alt="Responsive image">
                                <div class="mt-3">
                                    <a href="#" class=" d-flex align-items-center justify-content-center"><span class="material-symbols-outlined me-2 md-18">thumb_up
                                    </span>Like Page</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 text-center">
                <img src="../assets/images/page-img/page-load-loader.gif" alt="loader" style="height: 100px;" loading="lazy">
            </div>
        </div>
    </div>

</asp:Content>
