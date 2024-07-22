<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="row mb-4">
                            <div class="col-md-10">
                                <h5 class="mb-0">Pending Contacts</h5>
                                <c:if test="${not empty message}">
                                    <div class="alert alert-${messageType}">${message}</div>
                                </c:if>
                            </div>
                        </div>
                        <!-- Contacts Table -->
                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table mb-0 table-center">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3">Name</th>
                                                <th class="border-bottom p-3">Email</th>
                                                <th class="border-bottom p-3">Message</th>
                                                <th class="border-bottom p-3">Created At</th>
                                                <th class="border-bottom p-3">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="contact" items="${contacts}">
                                                <tr>
                                                    <td class="p-3">${contact.fullName}</td>
                                                    <td class="p-3">${contact.email}</td>
                                                    <td class="p-3">${contact.message}</td>
                                                    <td class="p-3">${contact.createdAt}</td>
                                                    <td class="p-3">
                                                        <button onclick="openResponseModal(${contact.contactId}, '${contact.email}')" class="btn btn-sm btn-primary">Respond</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../admin/layout/footer.jsp"/>
            </main>
        </div>

        <!-- Response Modal -->
        <div class="modal fade" id="responseModal" tabindex="-1" aria-labelledby="responseModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="responseModalLabel">Respond to Contact</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="responseForm" action="respond" method="POST">
                            <input type="hidden" id="contactId" name="contactId">
                            <input type="hidden" id="contactEmail" name="contactEmail">
                            <div class="mb-3">
                                <label for="responseSubject" class="form-label">Subject</label>
                                <input type="text" class="form-control" id="responseSubject" name="subject" required>
                            </div>
                            <div class="mb-3">
                                <label for="responseMessage" class="form-label">Message</label>
                                <textarea class="form-control" id="responseMessage" name="message" rows="4" required></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Send Response</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/simplebar.min.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script>
            function openResponseModal(contactId, email) {
                document.getElementById('contactId').value = contactId;
                document.getElementById('contactEmail').value = email;
                var modal = new bootstrap.Modal(document.getElementById('responseModal'));
                modal.show();
            }
        </script>
    </body>
</html>