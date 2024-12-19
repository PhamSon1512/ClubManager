<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<html>
<head>
    <meta charset="UTF-8">
    <title>Blog List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Light gray background */
            padding-top: 50px;
        }
        .container {
            background-color: #ffffff; /* White background */
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Subtle shadow */
            margin-top: 20px;
        }
        .btn-back {
            margin-bottom: 20px;
        }
        .table th, .table td {
            vertical-align: middle; /* Center content vertically */
        }
        .table th {
            font-weight: bold;
            background-color: #007bff; /* Primary color for header background */
            color: #ffffff; /* White text color */
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 123, 255, 0.1); /* Lighter shade of primary color for odd rows */
        }
        .table-striped tbody tr:hover {
            background-color: rgba(0, 123, 255, 0.2); /* Darker shade of primary color on hover */
        }
        .pagination {
            justify-content: center; /* Center align pagination links */
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="mt-4">Blog List</h2>
    
    <!-- Search Form -->
    <form action="blog" method="get" class="mb-3">
        <input type="hidden" name="action" value="search">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search blogs..." name="searchTerm" value="${param.searchTerm}">
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit">Search</button>
            </div>
        </div>
    </form>

    <!-- Add New Blog Button -->
    <c:if test="${sessionScope.account.status == 2}">
    <form action="blog" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="insert">
        <button type="submit" class="btn btn-primary mb-3">Add New Blog</button>
    </form>
    </c:if>
    <!-- Back Button -->
    <a href="dashboard.jsp" class="btn btn-secondary btn-back">Back</a>

    <!-- Blog List Table -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Thumbnail</th>
                <th>Content</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="blog" items="${blogs}">
                <tr>
                    <td>${blog.title}</td>
                    <td><img src="${blog.thumbnailUrl}" width="100" height="100" alt="Blog Thumbnail" class="img-thumbnail"></td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:length(blog.content) > 100}">
                                ${fn:substring(blog.content, 0, 100)}...
                            </c:when>
                            <c:otherwise>
                                ${blog.content}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${blog.status}</td>
                    <td>
                        <c:if test="${sessionScope.account.status == 2}">
                            <a href="blog?action=edit&blogId=${blog.blogId}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="blog?action=delete&blogId=${blog.blogId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this blog?')">Delete</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Pagination -->
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:if test="${currentPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="blog?action=list&page=${currentPage - 1}&searchTerm=${param.searchTerm}">Previous</a>
                </li>
            </c:if>
            
            <c:forEach begin="1" end="${totalPages}" var="i">
                <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link" href="blog?action=list&page=${i}&searchTerm=${param.searchTerm}">${i}</a>
                </li>
            </c:forEach>
            
            <c:if test="${currentPage < totalPages}">
                <li class="page-item">
                    <a class="page-link" href="blog?action=list&page=${currentPage + 1}&searchTerm=${param.searchTerm}">Next</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
