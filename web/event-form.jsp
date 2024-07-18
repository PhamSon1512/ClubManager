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

<!DOCTYPE html>
<%
    ClubDAO clubDAO = new ClubDAO();
    List<Club> clubs = clubDAO.getAllClubs();
    %>
<html>
    <jsp:include page="layout/head.jsp"/>
<head>
    <meta charset="UTF-8">
    <title>${event != null ? "Edit Event" : "Add Event"}</title>
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
        }
        .form-group label {
            font-weight: bold;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
    <div class="mb-3">
        <a href="javascript:history.back()" class="btn btn-secondary mb-3">Back</a>
    </div>
<div class="container">
    <h2 class="mb-4">${event != null ? "Edit Event" : "Add Event"}</h2>
    <form action="EventController" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${event.eventId}" />
        <input type="hidden" name="action" value="${event != null ? 'update' : 'insert'}" />

        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" class="form-control" value="${event.title}" required>
        </div>

        <div class="form-group">
            <label for="content">Content</label>
            <textarea id="content" name="content" class="form-control" rows="5" required>${event.content}</textarea>
        </div>

        <div class="form-group">
            <label for="thumbnail">Thumbnail</label>
            <input type="file" id="thumbnail" name="thumbnail" class="form-control-file">
            <c:if test="${not empty event.thumbnailUrl}">
                <p>Thumbnail URL: ${event.thumbnailUrl}</p>
                <img src="${event.thumbnailUrl}" alt="Event Thumbnail" class="img-thumbnail" style="max-width: 200px;">
            </c:if>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="startDate">Start Date</label>
                <input type="date" id="startDate" name="startDate" class="form-control" value="${event.startDate}" required>
            </div>

            <div class="form-group col-md-6">
                <label for="endDate">End Date</label>
                <input type="date" id="endDate" name="endDate" class="form-control" value="${event.endDate}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="clubId">Select Club</label>
            <select id="clubId" name="clubId" class="form-control" required>
                <option value="" disabled selected>Select a club</option>
                <% for (Club club : clubs) { %>
                <option value="<%= club.getClub_id() %>"><%= club.getName() %></option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">${event != null ? "Update" : "Add"}</button>
        </div>
    </form>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
</div>
</body>
</html>
