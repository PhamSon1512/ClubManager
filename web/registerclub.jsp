<%-- 
    Document   : registerclub
    Created on : May 27, 2024, 8:10:10 AM
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
                            <p class="para-desc text-white-50 mb-0">Our club management website makes organizing and managing school clubs easy. With tools for event planning and member management, students and teachers can connect and work efficiently.   </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="section">
            <div class="container">
                <h2 class="mb-0">Register Club</h2>
                <div class="row">
                    <div class="col-lg-7">
                        <div class="card border-0 shadow rounded overflow-hidden">
                            <div class="tab-content p-4" id="pills-tabContent">
                                <form action="regisclub" method="POST">
                                    <div class="row">
                                        <div class="p-6">
                                            <h4 class="mb-0">Profile</h4>
                                        </div>
                                        <br><br>
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label class="form-label">Name<span class="text-danger">*</span></label>
                                                <input class="form-control" value="${account.fullname}">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label class="form-label">Telephone<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="${account.phone_number}">
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Email<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="${account.email}">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Club List<span class="text-danger">*</span></label>
                                                <select name="clublist" oninvalid="Select(this);" oninput="Select(this);" id="mySelect" class="form-control department-name select2input">
                                                    <c:forEach var="club" items="${clubList}">
                                                        <option value="${club.name}">${club.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Purpose of participation<span class="text-danger">*</span></label>
                                                <select required="" name="purpose" class="form-control department-name select2input custom-select" id="purpose-select" onchange="toggleCustomPurposeInput()">
                                                    <option value="Learn">Learn</option>
                                                    <option value="Make friends">Make friends</option>
                                                    <option value="Skills development">Skills development</option>
                                                    <option value="Entertainment">Entertainment</option>
                                                    <option value="Other">Other (please specify)</option>
                                                </select>
                                                <input type="text" name="custom_purpose" class="form-control mt-2 custom-input" id="custom-purpose" placeholder="Enter your purpose" style="display: none;">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Committees<span class="text-danger">*</span></label>
                                                <select required="" name="commit" class="form-control department-name select2input custom-select" id="commit-select">
                                                    <option value="chuyenmon">Ban Chuyen Mon</option>
                                                    <option value="vanhoa">Ban Van Hoa</option>
                                                    <option value="truyenthong">Ban Truyen Thong</option>
                                                    <option value="haucan">Ban Hau Can</option>
                                                    <option value="noidung">Ban Noi Dung</option>
                                                    <option value="media">Ban Media</option>
                                                </select>
                                            </div>
                                        </div>

                                        <script>
                                            function toggleCustomPurposeInput() {
                                                var selectElement = document.getElementById('purpose-select');
                                                var customPurposeInput = document.getElementById('custom-purpose');
                                                if (selectElement.value === 'Other') {
                                                    customPurposeInput.style.display = 'block';
                                                } else if (customPurposeInput.value.trim() === '') {
                                                    alert('Please enter your purpose.');
                                                    customPurposeInput.focus();
                                                } else {
                                                    customPurposeInput.style.display = 'none';
                                                }
                                            }
                                        </script>
                                        <!--end col-->

                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Introduce Yourself<span class="text-danger">*</span></label>
                                                <textarea required="" name="description" id="comments2" rows="4" class="form-control"></textarea>
                                            </div>
                                        </div><!--end col-->
                                        <button type="submit" class="btn btn-primary">Register</button>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </section>
        <jsp:include page="layout/footer.jsp"/>
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
            <jsp:include page="layout/search.jsp"/>
            <jsp:include page="layout/facebookchat.jsp"/>

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

    </body>

</html>
