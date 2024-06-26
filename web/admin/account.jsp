<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../admin/layout/adminhead.jsp"/>
    <body>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../admin/layout/menu.jsp"/>
            <main class="page-content bg-light">
                <jsp:include page="../admin/layout/headmenu.jsp"/>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row">
                            <div class="col-md-11 row">
                                <div class="col-md-4">
                                    <h5 class="mb-0">Account</h5>
                                    <h6>${requestScope.success}</h6>
                                </div>
                                <div class="col-md-7">
                                    <div class="search-bar p-0 d-lg-block ms-2">                                                        
                                        <div id="search" class="menu-search mb-0">
                                            <form action="patientmanage?action=search" method="POST" id="searchform" class="searchform">
                                                <div>
                                                    <input type="text" class="form-control border rounded-pill" name="search" id="s" placeholder="Find account...">
                                                    <input type="submit" id="searchsubmit" value="Search">
                                                </div>
                                            </form>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="justify-content-md-end row">
                                    <div class="d-grid">
                                        <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#filter">Filter</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table mb-0 table-center">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" >ID</th>
                                                <th class="border-bottom p-3" >Full Name</th>
                                                <th class="border-bottom p-3" >Username</th>
                                                <th class="border-bottom p-3" >Email</th>
                                                <th class="border-bottom p-3" >Phone Number</th>
                                                <th class="border-bottom p-3" >Role</th>
                                                <th class="border-bottom p-3" >Status</th>
                                                <th class="border-bottom p-3" ></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${accountList}" var="account">
                                                <tr>
                                                    <td class="p-3">${account.user_id}</td>
                                                    <td class="p-3">${account.fullname}</td>
                                                    <td class="p-3">${account.username}</td>
                                                    <td class="p-3">${account.email}</td>
                                                    <td class="p-3">${account.phone_number}</td>
                                                    <td class="p-3">
                                                        <c:choose>
                                                            <c:when test="${account.status == 0}">User</c:when>
                                                            <c:when test="${account.status == 1}">Admin</c:when>
                                                            <c:when test="${account.status == 2}">Manager</c:when>
                                                            <c:otherwise>Unknown</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="p-3">
                                                        <c:choose>
                                                            <c:when test="${account.setting.setting_id == 0}">Deactivated</c:when>
                                                            <c:when test="${account.setting.setting_id == 1}">Activated</c:when>
                                                            <c:when test="${account.setting.setting_id == 2}">Banned</c:when>
                                                            <c:otherwise>Unknown</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="p-3"><!-- nút edit --></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <c:set var="page" value="${page}"/>
                            <div class="row text-center">
                                <div class="col-12 mt-4">
                                    <div class="d-md-flex align-items-center text-center justify-content-between">
                                        <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                            <c:forEach begin="${1}" end="${num}" var="i">
                                                <li class="page-item ${i==page?"active":""}"><a class="page-link" href="account?action=all&page=${i}">${i}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../admin/layout/footer.jsp"/>
            </main>
        </div>

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/simplebar.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/select2.init.js"></script>
        <script src="assets/js/flatpickr.min.js"></script>
        <script src="assets/js/flatpickr.init.js"></script>
        <script src="assets/js/jquery.timepicker.min.js"></script> 
        <script src="assets/js/timepicker.init.js"></script> 
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>

    </body>
</html>
