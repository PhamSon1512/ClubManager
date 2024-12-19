<%-- 
    Document   : registerclub
    Created on : Jul 16, 2024, 9:44:45 AM
    Author     : sodok
--%>

<%@page import="model.Account, dal.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

    <jsp:include page="layout/head.jsp"/>
    <body>
        <jsp:include page="layout/menu.jsp"/>

        <section class="bg-half-260 d-table w-100" style="background: url('assets/images/bg/logo.jpg') center;">
            <div class="bg-overlay bg-overlay-"></div>
            <div class="container">
                <div class="row mt-5 mt-lg-0">
                    <div class="col-12">
                        <div class="heading-title">
                            <img src="assets/images/bg/fpt.png" height="50" alt="">
                            <h4 class="display-4 fw-bold text-white title- mt-3 mb-4">Simplifying <br> Club Management</h4>
                            <p class="para-desc text-white-50 mb-0">Our club management website makes organizing and managing school clubs easy. With tools for event planning and member management, students and teachers can connect and work efficiently.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="section">
            <div class="container">
                <h2 class="mb-0">Club Registration</h2>
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success" role="alert">
                        ${successMessage}
                    </div>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMessage}
                    </div>
                </c:if><br>
                <div class="row">
                    <div class="col-lg-7">
                        <div class="card border-0 shadow rounded overflow-hidden">
                            <div class="tab-content p-4" id="pills-tabContent">
                                <%
                                    Account account = null;
                                    if (session.getAttribute("account") != null) {
                                        account = (Account) session.getAttribute("account");
                                    }
                                %>
                                <% if (account != null) { %>
                                <form action="clubregister" method="POST" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="p-6">
                                            <h4 class="mb-0">Club Information</h4>
                                        </div>
                                        <br><br>
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label"> Club Name<span class="text-danger">*</span></label>
                                                <input name="clubName" type="text" class="form-control">
                                                <div id="clubnameError" class="text-danger">
                                                    <%= request.getAttribute("clubnameError") != null ? request.getAttribute("clubnameError") : "" %>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Email<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="<%= account.getEmail() %>" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Club Categories<span class="text-danger">*</span></label>
                                                <select class="form-control" id="category-select" name="category">
                                                    <c:forEach items="${listCategories}" var="C">
                                                        <option value="${C.category_id}">${C.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Club Description<span class="text-danger">*</span></label>
                                                <textarea required="" name="description" id="comments2" rows="4" class="form-control"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Club Images<span class="text-danger">*</span></label>
                                                <div id="myfileupload">
                                                    <input type="file" name="clubImage" id="uploadfile" onchange="readURL(this);" style="display: none;" />
                                                </div>
                                                <div id="thumbbox">
                                                    <img class="rounded" height="40%" width="60%" alt="Thumb image" id="thumbimage" style="display: none" />
                                                    <a class="removeimg" href="javascript:"></a>
                                                </div>
                                                <div id="boxchoice">
                                                    <a href="javascript:" class="Choicefile btn btn-primary"><i class="fas fa-cloud-upload-alt"></i> Choose image</a>
                                                    <span id="filename" class="ml-2">No image have been uploaded</span>
                                                    <p style="clear:both"></p>
                                                </div> 
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="layout/footer.jsp"/>
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/flatpickr.min.js"></script>
        <script src="assets/js/flatpickr.init.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/select2.init.js"></script>
        <script src="assets/js/jquery.timepicker.min.js"></script>
        <script src="assets/js/timepicker.init.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/vn.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="assets/js/sweetalert.min.js"></script>

        <style>
            .Choicefile {
                display: inline-block;
                background: #396CF0;
                padding: 5px 10px;
                color: #fff;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 14px;
                border: none;
                outline: none;
            }

            .Choicefile:hover {
                background: #2d5ac7;
            }

            #uploadfile {
                display: none;
            }
            #filename {
                margin-left: 5px;
                font-size: 14px;
            }
        </style>

        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result).show();
                    };
                    reader.readAsDataURL(input.files[0]);
                    $(".Choicefile").text("Change");
                    $(".removeimg").show();
                    $("#filename").text(input.files[0].name);
                }
            }

            $(document).ready(function () {
                $(".Choicefile").click(function () {
                    $("#uploadfile").click();
                });

                $(".removeimg").click(function () {
                    $("#thumbimage").attr('src', '').hide();
                    $("#uploadfile").val('');
                    $(".Choicefile").html('<i class="fas fa-cloud-upload-alt"></i> Choose image');
                    $("#filename").text("No image uploaded");
                    $(this).hide();
                });

                $("#uploadfile").change(function () {
                    readURL(this);
                });
            });
        </script>

    </body>
</html>