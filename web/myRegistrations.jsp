<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<jsp:include page="layout/head.jsp"/>

<html>
<head>
    <meta charset="UTF-8">
    <title>My Registrations</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        h2 {
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
        }
        .btn-back {
            margin-bottom: 20px;
        }
        .table {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0,0,0,0.1);
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-4 mb-4">My Event Registrations</h2>
        <a href="home" class="btn btn-secondary btn-back">Back</a>
        
        <c:if test="${empty registrations}">
            <p>No registrations found.</p>
        </c:if>
        
        <c:if test="${not empty registrations}">
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Event Title</th>
                        <th>Registration Date</th>
                        <th>Event Start Time</th>
                        <th>Event End Time</th>
                        <th>Status</th>
                        <th>Notes</th>
                        <th>Attendance</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${registrations}" var="registration">
                        <tr>
                            <td>${registration.eventTitle}</td>
                            <td>${registration.registrationDate}</td>
                            <td>${registration.eventStartTime}</td>
                            <td>${registration.eventEndTime}</td>
                            <td>${registration.status}</td>
                            <td>${registration.notes}</td>
                            <td>${registration.attendance ? 'Yes' : 'No'}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
