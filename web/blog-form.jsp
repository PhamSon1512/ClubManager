<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

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
    <title>${blog != null ? "Edit Blog" : "Add Blog"}</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #007bff;
            margin-bottom: 30px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-back {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>${blog != null ? "Edit Blog" : "Add Blog"}</h2>
    <a href="dashboard.jsp" class="btn btn-secondary btn-back">Back</a>

    <form action="blog" method="post" enctype="multipart/form-data">
        <input type="hidden" name="blogId" value="${blog != null ? blog.blogId : ''}" />
        <input type="hidden" name="action" value="${blog != null ? 'update' : 'insert'}" />
        
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" class="form-control" value="${blog != null ? blog.title : ''}" required>
        </div>
        
        <div class="form-group">
            <label for="thumbnail">Thumbnail</label>
            <input type="file" id="thumbnail" name="thumbnail" class="form-control-file" accept="image/*">
            <c:if test="${blog != null && not empty blog.thumbnailUrl}">
                <small class="form-text text-muted">Current thumbnail: ${blog.thumbnailUrl}</small>
                <input type="hidden" name="currentThumbnailUrl" value="${blog.thumbnailUrl}">
            </c:if>
        </div>
        
        <div class="form-group">
            <label for="content">Content</label>
            <textarea id="content" name="content" class="form-control" rows="6" required>${blog != null ? blog.content : ''}</textarea>
        </div>
        
        <div class="form-group">
            <label for="status">Status</label>
            <select id="status" name="status" class="form-control" required>
                <option value="1" ${blog != null && blog.status.equals("1") ? 'selected' : ''}>Active</option>
                <option value="0" ${blog != null && blog.status.equals("0") ? 'selected' : ''}>Inactive</option>
            </select>
        </div>
        
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">${blog != null ? "Update" : "Add"}</button>
        </div>
    </form>
</div>
</body>
</html>
