<%-- 
    Document   : changePassword
    Created on : Jun 6, 2024, 10:21:47 AM
    Author     : sodok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
    <jsp:include page="layout/head.jsp"/>
    <body>
        <div class="back-to-home rounded d-none d-sm-block">
            <a href="home" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
        </div>

        <!-- Hero Start -->
        <section class="bg-home d-flex bg-light align-items-center">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-8">
                        <div class="text-center mb-4">
                            <img src="assets/images/bg/fpt.png" alt="FPT Logo" class="img-fluid" style="max-width: 200px;">
                        </div>
                        <div class="card login-page bg-white shadow mt-4 rounded border-0">
                            <div class="card-body">

                                <p style="color: red; align-content: center;">
                                    <c:if test="${errNewPass != null}">
                                        ${errNewPass}
                                    </c:if>
                                </p>
                                <form action="forgotpass" method="POST" class="login-form mt-4" onSubmit="document.getElementById('submit').disabled = true;">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            
                                             
                                            
                                            <p class="text-muted">Hãy nhập mật khẩu mới của bạn.</p>
                                            <div class="mb-3">
                                                <label class="form-label">Mật khẩu mới : <span class="text-danger">*</span></label>
                                                <input  type="password" id="password" class="form-control" name="password" required="">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Nhập lại mật khẩu : <span class="text-danger">*</span></label>
                                                <input type="password" class="form-control" name="repassword" required="">
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="d-grid">
                                                <button id="submit" class="btn btn-primary">Xác nhận</button>
                                            </div>
                                        </div>
                                        <div class="mx-auto">
                                            <p class="mb-0 mt-3"><a href="user?action=login" class="text-dark h6 mb-0">Đăng nhập</a></p>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>
    </body>

</html>
