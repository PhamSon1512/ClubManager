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
                        <c:forEach var="entry" items="${departmentMembersMap}">
                            <c:set var="deptInfo" value="${departmentInfoMap[entry.key]}" />
                            <div class="department-section mb-5">
                                <h2 class="department-title mb-4">${specialityMap[entry.key]}</h2>

                                <div id="department-info-${entry.key}" class="department-info card mb-4">
                                    <div class="card-header bg-primary text-white">
                                        <h3 class="mb-0">Department Information</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover mb-0">
                                                <thead class="bg-light">
                                                    <tr>
                                                        <th>Description</th>
                                                        <th>Current Projects</th>
                                                        <th>Regular Meeting Schedule</th>
                                                        <th>Edit</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td id="description-${entry.key}">${deptInfo.description}</td>
                                                        <td id="projects-${entry.key}">${deptInfo.currentProjects}</td>
                                                        <td id="schedule-${entry.key}">${deptInfo.regularMeetingSchedule}</td>
                                                        <td>
                                                            <button class="btn btn-primary btn-sm edit-dept" data-dept-id="${entry.key}" data-club-id="${clubId}">
    Edit
</button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <div id="members-${entry.key}" class="members card">
                                    <div class="card-header bg-success text-white">
                                        <h3 class="mb-0">Members</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-hover mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>Image</th>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Active Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="member" items="${entry.value}">
                                                        <tr class="member">
                                                            <td>
                                                                <img src="${not empty member.imageUrl ? member.imageUrl : 'assets/images/avata.png'}" 
                                                                     alt="Member Image" 
                                                                     class="avatar rounded-circle" width="40" height="40">
                                                            </td>
                                                            <td>${member.fullName}</td>
                                                            <td>${member.email}</td>
                                                            <td>
                                                                <button class="btn btn-sm ${member.active_status ? 'btn-success' : 'btn-danger'} toggle-active" 
                                                                        data-member-id="${member.user_id}" 
                                                                        data-active-status="${member.active_status}">
                                                                    ${member.active_status ? 'Active' : 'Non-Active'}
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <jsp:include page="../admin/layout/footer.jsp"/>
            </main>
        </div>

        <!-- Modal for editing department information -->
        <div class="modal fade" id="editDepartmentModal" tabindex="-1" role="dialog" aria-labelledby="editDepartmentModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editDepartmentModalLabel">Edit Department Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editDepartmentForm">
                            <input type="hidden" id="editDeptId" name="deptId">
                            <div class="form-group">
                                <label for="editDescription">Description</label>
                                <textarea class="form-control" id="editDescription" name="description" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="editProjects">Current Projects</label>
                                <input type="text" class="form-control" id="editProjects" name="currentProjects">
                            </div>
                            <div class="form-group">
                                <label for="editSchedule">Regular Meeting Schedule</label>
                                <input type="text" class="form-control" id="editSchedule" name="regularMeetingSchedule">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="saveDepartmentChanges">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/simplebar.min.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
           $(document).ready(function () {
    $('.edit-dept').click(function () {
        var specialityId = $(this).data('dept-id');
        var clubId = $(this).data('club-id');
        var description = $('#description-' + specialityId).text();
        var projects = $('#projects-' + specialityId).text();
        var schedule = $('#schedule-' + specialityId).text();

        $('#editDeptId').val(specialityId);
        $('#editClubId').val(clubId);
        $('#editDescription').val(description);
        $('#editProjects').val(projects);
        $('#editSchedule').val(schedule);

        $('#editDepartmentModal').modal('show');
    });

    $('#saveDepartmentChanges').click(function () {
        var specialityId = $('#editDeptId').val();
        var clubId = $('#editClubId').val();
        var description = $('#editDescription').val();
        var projects = $('#editProjects').val();
        var schedule = $('#editSchedule').val();

        $.ajax({
            url: 'team?action=updateDepartment',
            type: 'POST',
            data: {
                specialityId: specialityId,
                clubId: clubId,
                description: description,
                currentProjects: projects,
                regularMeetingSchedule: schedule
            },
            success: function (response) {
                if (response === 'success') {
                    // Update the UI
                    $('#description-' + specialityId).text(description);
                    $('#projects-' + specialityId).text(projects);
                    $('#schedule-' + specialityId).text(schedule);

                    $('#editDepartmentModal').modal('hide');
                    alert('Department information updated successfully');
                } else {
                    alert('Failed to update department information: ' + response);
                }
            },
            error: function (xhr, status, error) {
                alert('An error occurred while updating department information: ' + error);
            }
        });
    });


                // ... rest of your code ...
         

            $('.toggle-active').click(function () {
            var button = $(this);
                    var memberId = button.data('member-id');
                    var currentStatus = button.data('active-status');
                    $.ajax({
                    url: 'toggleMemberStatus',
                            type: 'POST',
                            data: {
                            memberId: memberId,
                                    activeStatus: !currentStatus
                            },
                            success: function (response) {
                            if (response === 'success') {
                            var newStatus = !currentStatus;
                                    button.toggleClass('btn-success btn-danger');
                                    button.data('active-status', newStatus);
                                    button.text(newStatus ? 'Active' : 'Non-Active');
                            } else {
                            alert('Failed to update member status');
                            }
                            },
                            error: function () {
                            alert('An error occurred while updating member status');
                            }
                    });
            });
            }
            );
        </script>
    </body>
</html>