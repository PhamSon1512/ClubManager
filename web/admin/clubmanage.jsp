<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Plays Boy</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #FFDAB9;
            font-family: 'Roboto', sans-serif;
            display: flex;
        }
       
        .container {
            background-color: #f7f7f7;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            margin-top: 50px;
            margin-left: 270px;
            flex-grow: 1;
        }
        .table-title {
            padding-bottom: 15px;
            background-color: #008080;
            color: white;
            border-radius: 10px;
            text-align: center;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card img {
            border-bottom: 1px solid #e0e0e0;
        }
        .card-body {
            padding: 15px;
        }
        .btn-outline-dark {
            color: #008080;
            border-color: #008080;
        }
        .btn-outline-dark:hover {
            color: white;
            background-color: #008080;
        }
        .modal-header {
            background-color: #008080;
            color: white;
        }
        .btn-primary {
            background-color: #008080;
        }
        .btn-primary:hover {
            background-color: #00555F;
        }
        .form-control {
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <jsp:include page="layout/sidebar.jsp"/>
    <div class="container">
        <div class="table-title" style="margin-bottom: 100px;">
            <h2>Manage <b>Clubs</b></h2>
        </div>
        
        <div class="row">
            <c:forEach items="${listAllClubs}" var="P">
                <div class="col-md-4 mb-5">
                    <div class="card h-100 shadow-sm">
                        <a href="detail?club_id=${P.club_id}">
                            <img class="card-img-top" src="${P.imageUrl}" alt="Club Image" />
                        </a>
                        <div class="card-body text-center">
                            <h5 class="fw-bolder">${P.name}</h5>
                            <span class="text-muted">${P.code}</span>
                        </div>
                        <div class="card-footer text-center bg-transparent">
                            <a class="btn btn-outline-dark mt-auto" href="registerclub">Join</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="col-sm-6">
            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Club</span></a>
        </div>
    </div>

    <!-- Add Modal HTML -->
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="add" method="post">
                    <div class="modal-header bg-primary text-light">
                        <h4 class="modal-title">Add New Club</h4>
                        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="code">Code</label>
                                        <input type="text" class="form-control" id="code" name="code" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="imageUrl">Image</label>
                                        <input type="text" class="form-control" id="imageUrl" name="imageUrl" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="clubName">Name</label>
                                        <input type="text" class="form-control" id="clubName" name="name" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <textarea class="form-control" id="description" rows="3" name="description" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="phoneNumber">Phone Number</label>
                                        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="facebook">Facebook</label>
                                        <input type="text" class="form-control" id="facebook" name="facebook" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="category_id">Category</label>
                                        <select class="form-control" id="category_id" name="category_id">
                                            <c:forEach items="${listCategories}" var="category">
                                                <option value="${category.category_id}">${category.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="js/ManagerProduct.js" type="text/javascript"></script>
</body>
</html>
