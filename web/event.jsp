<%-- 
    Document   : event
    Created on : Jun 12, 2024, 10:35:22 PM
    Author     : FANCY
--%>

<%@ page import="model.Event" %>
<%@ page import="dal.EventDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int postsPerPage = 6; // Number of posts per page
    int maxPagesDisplayed = 5; // Maximum number of pages displayed

    EventDAO eventDAO = new EventDAO();
    List<Event> allEvents = eventDAO.getAllEvents(); // Retrieve the list of all events from the DAO

    int totalPosts = allEvents.size(); // Total number of events

    // Determine the current page from the parameter
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

    // Calculate the start and end index of the event list on the current page
    int startIndex = (currentPage - 1) * postsPerPage;
    int endIndex = Math.min(startIndex + postsPerPage, totalPosts);

    // Retrieve the list of events for the current page
    List<Event> displayedEvents = allEvents.subList(startIndex, endIndex);

    String keyword = request.getParameter("keyword");
    String category = request.getParameter("category");
    List<Event> searchResults = new ArrayList<>();

    if (keyword != null && !keyword.isEmpty()) {
        // Filter the event list by keyword
        for (Event event : allEvents) {
            if (event.getTitle().toLowerCase().contains(keyword.toLowerCase()) || 
                event.getContent().toLowerCase().contains(keyword.toLowerCase())) {
                searchResults.add(event);
            }
        }
    } else if (category != null && !category.isEmpty()) {
        // Filter the event list by category
        for (Event event : allEvents) {
            if (event.getClubName().toLowerCase().contains(category.toLowerCase())) {
                searchResults.add(event);
            }
        }
    } else {
        searchResults = allEvents; // If no keyword or category, display all events
    }

    // Update the displayed event list
    totalPosts = searchResults.size();
    currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
    startIndex = (currentPage - 1) * postsPerPage;
    endIndex = Math.min(startIndex + postsPerPage, totalPosts);
    displayedEvents = searchResults.subList(startIndex, endIndex);
%>
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
    <div class="header-title">Club Events</div>
    
    <!-- Search Form -->
    <div class="row mt-4">
        <div class="col-md-6 offset-md-3">
            <form action="event.jsp" method="GET" class="d-flex">
                <input class="form-control me-2" type="search" name="keyword" placeholder="Search events..." aria-label="Search">
                <button class="btn btn-outline-primary" type="submit">Search</button>
            </form>
        </div>
    </div>

    

    <div class="row">
        <% for (Event event : displayedEvents) { %>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="<%= event.getThumbnailUrl() %>" alt="Event image">
                    <div class="card-body">
                        <h5 class="card-title"><%= event.getTitle() %></h5>
                        <p class="card-text"><%= event.getContent().length() > 100 ? event.getContent().substring(0, 100) + "..." : event.getContent() %></p>
                        <a href="eventDetails.jsp?id=<%= event.getEventId() %>" class="btn btn-primary">Read More</a>
                        <a href="RegisterEventServlet?eventId=<%= event.getEventId() %>" class="btn btn-success btn-sm">Register</a>
                        <p class="card-text mt-2"><small class="text-muted">From <%= event.getStartDate() %> to <%= event.getEndDate() %></small></p>
                        <p class="card-text mt-2"><small class="text-muted">Club: <%= event.getClubName() %></small></p>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

    <!-- Pagination -->
    <div class="pagination justify-content-center mt-4">
        <%-- Previous Button --%>
        <% if (currentPage > 1) { %>
            <a class="btn btn-primary me-2" href="event.jsp?page=<%= currentPage - 1 %>">Previous</a>
        <% } %>

        <%-- Page Buttons --%>
        <% 
            int startPage = Math.max(1, currentPage - maxPagesDisplayed / 2);
            int endPage = Math.min(startPage + maxPagesDisplayed - 1, (int) Math.ceil((double) totalPosts / postsPerPage));

            for (int i = startPage; i <= endPage; i++) { 
        %>
            <a class="btn btn-primary me-2 <%= (i == currentPage) ? "active" : "" %>" href="event.jsp?page=<%= i %>"><%= i %></a>
        <% } %>

        <%-- Next Button --%>
        <% if (currentPage < (int) Math.ceil((double) totalPosts / postsPerPage)) { %>
            <a class="btn btn-primary" href="event.jsp?page=<%= currentPage + 1 %>">Next</a>
        <% } %>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    // Show or hide the back-to-top button based on scroll position
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });

    // Scroll smoothly to the top of the page when the back-to-top button is clicked
    $('#back-to-top').click(function() {
        $('html, body').animate({scrollTop: 0}, 800);
        return false;
    });
</script>

<!-- Back-to-Top Button -->
<a href="#" id="back-to-top" class="btn btn-primary"><i class="fas fa-arrow-up"></i></a>

</body>
</html>

<jsp:include page="layout/footer.jsp"/>
