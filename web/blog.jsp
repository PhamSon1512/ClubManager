<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Blog" %>
<!DOCTYPE html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/menu.jsp"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
           background: linear-gradient(135deg, #2c3e50 0%, #4ca1af 100%);
            font-family: 'Poppins', sans-serif;
            color: #333;
        }
        .navbar {
            position: fixed;
            width: 100%;
            z-index: 1000;
        }
        .container {
            margin-top: 0px;
        }
        .header-title {
            text-align: center;
            font-size: 3rem;
            font-weight: 900;
            margin-bottom: 2rem;
            color: #fff;
            margin-top: 100px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
        }
        .row {
            margin-top: 30px;
        }
        .card {
            border: none;
            border-radius: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        .card-img-top {
            height: 250px;
            object-fit: cover;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #495057;
        }
        .card-text {
            color: #6c757d;
            font-size: 1rem;
        }
        .btn-primary {
            background-color: #0069d9;
            border-color: #0062cc;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        #back-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            display: none;
            z-index: 100;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header-title">Club Blog</div>

    <!-- Form tìm kiếm -->
    <div class="row mt-4">
        <div class="col-md-6 offset-md-3">
            <form action="blog" method="GET" class="d-flex">
                <input class="form-control me-2" type="search" name="keyword" placeholder="Search blogs..." aria-label="Search">
                <button class="btn btn-outline-primary" type="submit">Search</button>
            </form>
        </div>
    </div>

    <div class="row">
        <%
            List<Blog> displayedBlogs = (List<Blog>) request.getAttribute("displayedBlogs");
            for (Blog blog : displayedBlogs) {
        %>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="<%= blog.getThumbnailUrl() %>" alt="Blog image">
                    <div class="card-body">
                        <h5 class="card-title"><%= blog.getTitle() %></h5>
                        <p class="card-text"><%= blog.getContent().length() > 100 ? blog.getContent().substring(0, 100) + "..." : blog.getContent() %></p>
                        <a href="blogDetails.jsp?id=<%= blog.getBlogId() %>" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

    <!-- Phân trang -->
    <div class="pagination justify-content-center mt-4">
        <% 
            int currentPage = (Integer) request.getAttribute("currentPage");
            int totalPosts = (Integer) request.getAttribute("totalPosts");
            int postsPerPage = (Integer) request.getAttribute("postsPerPage");
            int maxPagesDisplayed = (Integer) request.getAttribute("maxPagesDisplayed");
            int totalPageCount = (int) Math.ceil((double) totalPosts / postsPerPage);

            if (currentPage > 1) {
        %>
            <a class="btn btn-primary me-2" href="blog?page=<%= currentPage - 1 %>">Previous</a>
        <% 
            }

            int startPage = Math.max(1, currentPage - maxPagesDisplayed / 2);
            int endPage = Math.min(startPage + maxPagesDisplayed - 1, totalPageCount);

            for (int i = startPage; i <= endPage; i++) { 
        %>
            <a class="btn btn-primary me-2 <%= (i == currentPage) ? "active" : "" %>" href="blog?page=<%= i %>"><%= i %></a>
        <% 
            }

            if (currentPage < totalPageCount) {
        %>
            <a class="btn btn-primary" href="blog?page=<%= currentPage + 1 %>">Next</a>
        <% } %>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>

<jsp:include page="layout/footer.jsp"/>

<a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i class="fas fa-arrow-up"></i></a>

<jsp:include page="layout/search.jsp"/>
<jsp:include page="layout/facebookchat.jsp"/>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/tiny-slider.js"></script>
<script src="assets/js/tiny-slider-init.js"></script>
<script src="assets/js/counter.init.js"></script>
<script src="assets/js/feather.min.js"></script>
<script src="assets/js/app.js"></script>

<script>
    $(document).ready(function(){
        $(window).scroll(function(){
            if ($(this).scrollTop() > 100) {
                $('#back-to-top').fadeIn();
            } else {
                $('#back-to-top').fadeOut();
            }
        });
        $('#back-to-top').click(function(){
            $('html, body').animate({scrollTop : 0},800);
            return false;
        });
    });
</script>
</body>
</html>
