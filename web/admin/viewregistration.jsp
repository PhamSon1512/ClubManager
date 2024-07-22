<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../admin/layout/adminhead.jsp"/>
    <body>
        <div class="page-wrapper doctris-theme toggled">
            <c:if test="${!isTokenAccess}">
                <jsp:include page="../admin/layout/menu.jsp"/>
            </c:if>
            <main class="page-content bg-light">
                <c:if test="${!isTokenAccess}">
                    <jsp:include page="../admin/layout/headmenu.jsp"/>
                </c:if>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row">
                            <div class="col-md-10 row">
                                <div class="col-md-4">
                                    <h5 class="mb-0">Registrations</h5>
                                    <div id="statusMessage" class="alert" role="alert" style="display: none;"></div>
                                </div>
                         
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table mb-0 table-center">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3">Serial No.</th>
                                                <th class="border-bottom p-3">Name</th>
                                                <th class="border-bottom p-3">Email</th>
                                                <th class="border-bottom p-3">Purpose</th>
                                                <th class="border-bottom p-3">Committees</th>
                                                <th class="border-bottom p-3">Description</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3">Submitted On</th>
                                                <c:if test="${!isTokenAccess}">
                                                    <th class="border-bottom p-3">Actions</th>
                                                </c:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${not empty registrations}">
                                                    <c:forEach var="registration" items="${registrations}" varStatus="status">
                                                        <tr>
                                                            <td class="p-3">${(page - 1) * 8 + status.index + 1}</td>
                                                            <td class="p-3">${registration.name}</td>
                                                            <td class="p-3">${registration.email}</td>
                                                            <td class="p-3">${registration.purpose}</td>
                                                            <td class="p-3">${registration.committees}</td>
                                                            <td class="p-3">${registration.description}</td>
                                                            <td class="p-3">${registration.status}</td>
                                                            <td class="p-3">${registration.createdAt}</td>
                                                            <c:if test="${!isTokenAccess}">
                                                                <td class="p-3">
                                                                    <div class="button-container">
                                                                        <form method="post" action="accept">
                                                                            <input type="hidden" name="registrationId" value="${registration.id}" />
                                                                            <button type="submit" class="accept btn btn-success btn-sm">Accept</button>
                                                                        </form>
                                                                        <form method="post" action="reject">
                                                                            <input type="hidden" name="registrationId" value="${registration.id}" />
                                                                            <button type="submit" class="reject btn btn-danger btn-sm">Reject</button>
                                                                        </form>
                                                                    </div>
                                                                </td>
                                                            </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td colspan="${isTokenAccess ? 8 : 9}" class="text-center">No registrations to display.</td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <c:if test="${num > 1}">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center mt-4">
                                    <c:forEach begin="1" end="${num}" var="i">
                                        <li class="page-item ${page == i ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}&token=${param.token}">${i}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </c:if>

                        <c:if test="${not empty successMessage}">
                            <div class="alert alert-success mt-4">${successMessage}</div>
                        </c:if>
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger mt-4">${errorMessage}</div>
                        </c:if>
                    </div>
                </div>
                <c:if test="${!isTokenAccess}">
                    <jsp:include page="../admin/layout/footer.jsp"/>
                </c:if>
            </main>
        </div>

        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/simplebar.min.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>
    </body>
   
</html>