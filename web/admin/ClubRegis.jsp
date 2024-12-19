<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
                            <div class="col-md-12 row">
                                <div class="col-md-4">
                                    <h5 class="mb-0">Club Registration</h5>
                                </div>
                                <div class="col-md-7">
                                    <div class="search-bar p-0 d-lg-block ms-2">                                                        
                                        <div id="search" class="menu-search mb-0">
                                            <form action="approveClub?action=search" method="POST" id="searchform" class="searchform">
                                                <div>
                                                    <input type="text" class="form-control border rounded-pill" name="search" id="s" placeholder="Search club registrations..." value="${searchTerm}">
                                                    <input type="submit" id="searchsubmit" value="Search">
                                                </div>
                                            </form>
                                        </div>
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
                                                <th class="border-bottom p-3">ID</th>
                                                <th class="border-bottom p-3">Club Name</th>
                                                <th class="border-bottom p-3">Email</th>
                                                <th class="border-bottom p-3">Category</th>
                                                <th class="border-bottom p-3">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${pendingRegistrations}" var="reg">
                                                <tr>
                                                    <td class="p-3">${reg.registration_id}</td>
                                                    <td class="p-3"><a href="#" class="text-dark fw-bold view-club" data-id="${reg.registration_id}">${reg.name}</a></td>
                                                    <td class="p-3"><a href="#" class="text-dark fw-bold view-user" data-email="${reg.email}" data-bs-toggle="modal" data-bs-target="#userModal">${reg.email}</a></td>
                                                    <td class="p-3">${reg.category_name}</td>
                                                    <td class="p-3">
                                                        <button class="btn btn-sm btn-success approve-btn" data-id="${reg.registration_id}">Approve</button>
                                                        <button class="btn btn-sm btn-danger reject-btn" data-id="${reg.registration_id}">Reject</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <!-- Account Modal -->
                                        <div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-xl">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editUserModalLabel">Account Information</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form id="editUserForm" method="POST" action="account?action=updateUser">
                                                            <input type="hidden" name="userId" id="editUserId">
                                                            <div class="row">
                                                                <div class="col-md-4 text-center">
                                                                    <img id="editUserAvatar" src="" alt="User Avatar" class="img-fluid rounded-circle mb-3">
                                                                    <p id="editUserEmail" class="text-muted mb-3"></p>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    <div class="mb-3">
                                                                        <label for="editFullname" class="form-label">Full Name</label>
                                                                        <input type="text" class="form-control" id="editFullname" name="fullname" required readonly="">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="editUsername" class="form-label">Username</label>
                                                                        <input type="text" class="form-control" id="editUsername" name="username" required readonly="">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="editPhone" class="form-label">Phone Number</label>
                                                                        <input type="tel" class="form-control" id="editPhone" name="phone" readonly="">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="editRole" class="form-label">Role</label>
                                                                        <select class="form-control" id="editRole" name="role" required readonly="">
                                                                            <option value="0">User</option>
                                                                            <option value="1">Admin</option>
                                                                            <option value="2">Manager</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="mb-3">

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <c:set var="page" value="${page}"/>
                        <div class="row text-center">
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <c:forEach begin="${1}" end="${num}" var="i">
                                            <li class="page-item ${i==page?"active":""}"><a class="page-link" href="approveClub?action=list&page=${i}">${i}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../admin/layout/footer.jsp"/>
            </main>
        </div>

        <!-- Club Details Modal -->
        <div class="modal fade" id="clubModal" tabindex="-1" aria-labelledby="clubModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="clubModalLabel">Club Registration Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-4 text-center">
                                <img id="clubImage" src="" alt="Club Image" class="img-fluid rounded-circle mb-3">
                            </div>
                            <div class="col-md-8">
                                <div class="mb-3">
                                    <label for="clubName" class="form-label">Club Name</label>
                                    <input type="text" class="form-control" id="clubName" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="clubEmail" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="clubEmail" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="clubCategory" class="form-label">Club Category</label>
                                    <input type="text" class="form-control" id="clubCategory" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="clubDescription" class="form-label">Description</label>
                                    <textarea class="form-control" id="clubDescription" rows="4" readonly></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
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

        <script>
            $(document).ready(function () {
                $('.view-club').click(function (e) {
                    e.preventDefault();
                    var clubId = $(this).data('id');
                    $.ajax({
                        url: 'approveclub?action=viewClub&id=' + clubId,
                        type: 'GET',
                        dataType: 'json',
                        success: function (club) {
                            $('#clubImage').attr('src', club.image || 'assets/images/default-club-image.png');
                            $('#clubName').val(club.name);
                            $('#clubEmail').val(club.email);
                            $('#clubCategory').val(club.category_name);
                            $('#clubDescription').val(club.description);
                            $('#clubModal').modal('show');
                        },
                        error: function (xhr, status, error) {
                            alert('Error fetching club information: ' + xhr.responseText);
                        }
                    });
                });

                $('#userModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget);
                    var userEmail = button.data('email');
                    var modal = $(this);

                    $.ajax({
                        url: 'approveclub?action=viewUser&email=' + userEmail,
                        type: 'GET',
                        dataType: 'json',
                        success: function (account) {
                            // Cập nhật nội dung modal
                            modal.find('#editUserAvatar').attr('src', account.avatar_url || 'assets/images/avata.png');
                            modal.find('#editUserEmail').text(account.email);
                            modal.find('#editFullname').val(account.fullname);
                            modal.find('#editUsername').val(account.username);
                            modal.find('#editPhone').val(account.phone_number);
                            if (account.setting && account.setting.value !== undefined) {
                                modal.find('#editRole').val(account.setting.value);
                            }
                        },
                        error: function (xhr, status, error) {
                            alert('Error fetching user information: ' + xhr.responseText);
                        }
                    });
                });



                $('.approve-btn').click(function () {
                    var registrationId = $(this).data('id');
                    if (confirm('Are you sure you want to approve this club?')) {
                        $.post('approveclub?action=approve', {registrationId: registrationId}, function (response) {
                            alert(response);
                            location.reload();
                        });
                    }
                });

                $('.reject-btn').click(function () {
                    var registrationId = $(this).data('id');
                    if (confirm('Are you sure you want to reject this club?')) {
                        $.post('approveclub?action=reject', {registrationId: registrationId}, function (response) {
                            alert(response);
                            location.reload();
                        });
                    }
                });
            });
        </script>
        <style>
            #editUserAvatar {
                width: 200px;
                height: 200px;
                object-fit: cover;
                border-radius: 50%;
                margin: 0 auto;
                display: block;
            }
            #clubImage {
                width: 300px;
                height: 300px;
                object-fit: cover;
                border-radius: 50%;
                margin: 0 auto;
                display: block;
            }
        </style>
    </body>
</html>