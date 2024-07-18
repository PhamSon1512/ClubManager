<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dal.ClubDAO" %>
<%@ page import="model.Club" %>
<%@ page import="model.Event" %>
<%@ page import="java.util.List" %>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="admin/layout/adminhead.jsp"/>
<body>

    <div class="page-wrapper doctris-theme toggled">
        <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#sidebar" aria-expanded="false" aria-controls="sidebar">
            ☰
        </button>
        <jsp:include page="admin/layout/menu.jsp"/>      

        <main class="page-content bg-light">
            <jsp:include page="admin/layout/headmenu.jsp"/>

            <div class="container">
                <h2>Event List</h2>
                <a href="EventController?action=new" class="btn btn-primary btn-add">Add New Event</a>

                <!-- Thêm form tìm kiếm và lọc -->
                <form action="EventController" method="get" class="mb-4">
                    <input type="hidden" name="action" value="list">
                    <div class="row">
                        <div class="col-md-3 mb-2">
                            <input type="text" name="search" class="form-control" placeholder="Search by title" value="${param.search}">
                        </div>
                        <div class="col-md-3 mb-2">
                            <select name="clubName" class="form-control">
                                <option value="">All Clubs</option>
                                <c:forEach var="club" items="${clubs}">
                                    <option value="${club.name}" ${param.clubName eq club.name ? 'selected' : ''}>${club.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <input type="date" name="startDate" class="form-control" value="${param.startDate}" placeholder="Start Date">
                        </div>
                        <div class="col-md-2 mb-2">
                            <input type="date" name="endDate" class="form-control" value="${param.endDate}" placeholder="End Date">
                        </div>
                        <div class="col-md-2 mb-2">
                            <button type="submit" class="btn btn-primary btn-block">Filter</button>
                        </div>
                    </div>
                </form>

                <div class="container">
                    <a href="dashboard.jsp" class="btn btn-secondary btn-back">Back</a>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Content</th>
                                <th>Thumbnail</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Club Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="event" items="${events}">
                                <tr>
                                    <td>${event.title}</td>
                                    <td>${event.content}</td>
                                    <td><img src="${event.thumbnailUrl}" width="100" height="100" alt="Event Thumbnail" class="img-thumbnail"></td>
                                    <td>${event.startDate}</td>
                                    <td>${event.endDate}</td>
                                    <td>${event.clubName}</td>
                                    <td>
                                        <c:if test="${sessionScope.account.status == 2}">
                                            <a href="EventController?action=edit&id=${event.eventId}" class="btn btn-warning btn-sm">Edit</a>
                                            <a href="EventController?action=delete&id=${event.eventId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this event?')">Delete</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Thêm phân trang -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage eq i ? 'active' : ''}">
                                    <a class="page-link" href="EventController?action=list&page=${i}&search=${param.search}&clubName=${param.clubName}&startDate=${param.startDate}&endDate=${param.endDate}">${i}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </main>
    </div>

    <style>
        /* Các style hiện có của bạn */
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .btn-back {
            margin-bottom: 10px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .table th {
            font-weight: bold;
            background-color: #007bff;
            color: #ffffff;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 123, 255, 0.1);
        }
        .table-striped tbody tr:hover {
            background-color: rgba(0, 123, 255, 0.2);
        }
        .btn-add {
            margin-bottom: 20px;
        }
    </style>
</body>
</html>
<%
    ClubDAO clubDAO = new ClubDAO();
    List<Club> clubs = clubDAO.getAllClubs();
    %>