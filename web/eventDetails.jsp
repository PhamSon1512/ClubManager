<%@ page import="java.util.List" %>
<%@ page import="model.Event" %>
<%@ page import="dal.EventDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="layout/head.jsp"/>
        <jsp:include page="layout/menu.jsp"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <title>Event Detail</title>
        <style>
            body {
                background: linear-gradient(135deg, #2c3e50 0%, #FF66CC 100%);
                font-family: 'Poppins', sans-serif;
                color: #333;
            }
            .row {
                margin-top: 80px;
            }
            .event-title {
                font-size: 2.5rem;
                font-weight: 700;
                color: #fff;
                text-align: center;
                margin-bottom: 20px;
            }
            .event-thumbnail {
                display: block;
                max-width: 100%;
                height: auto;
                margin: 20px auto;
                border-radius: 10px;
            }
            .event-content {
                background: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }
            .back-to-events {
                position: fixed;
                bottom: 20px;
                right: 20px;
                z-index: 999;
            }
            .card {
                background-color: #fff;
                border: none;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
            }
            .card:hover {
                transform: translateY(-5px);
            }
            .card img {
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                height: 200px;
                object-fit: cover;
            }
            .card-body {
                padding: 20px;
            }
            .card-title {
                font-size: 1.5rem;
                font-weight: 700;
                color: #333;
                margin-bottom: 10px;
            }
            .card-text {
                color: #666;
                line-height: 1.6;
            }
            .btn-read-more {
                background-color: #FF66CC;
                color: #fff;
                border: none;
            }
            .btn-read-more:hover {
                background-color: #E64980;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <% 
                int eventId = Integer.parseInt(request.getParameter("id"));
                EventDAO eventDAO = new EventDAO();
                Event event = eventDAO.getEventById(eventId);
            
                if (event != null) { 
            %>
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <a href="event.jsp" class="btn btn-secondary mb-3">&larr; Back to Events</a>
                    <h1 class="event-title"><%= event.getTitle() %></h1>
                    <p><img src="<%= event.getThumbnailUrl() %>" class="event-thumbnail img-fluid" alt="Event Thumbnail"></p>
                    <div class="event-content">
                        <p><%= event.getContent() %></p>
                        <p><strong>Start Date:</strong> <%= event.getStartDate() %></p>
                        <p><strong>End Date:</strong> <%= event.getEndDate() %></p>
                        <p><strong>Club:</strong> <%= event.getClubName() %></p>
                        <a href="RegisterEventServlet?eventId=<%= event.getEventId() %>" class="btn btn-success btn-sm">Register</a>

                    </div>
                </div>
            </div>

            <!-- Display related events -->
            <div class="row justify-content-center mt-5">
                <div class="col-md-10">
                    <h3>Other Events</h3>
                    <div class="row">
                        <% List<Event> allEvents = eventDAO.getAllEvents();
                           int count = 0;
                           for (Event otherEvent : allEvents) {
                               if (count < 3 && otherEvent.getEventId() != event.getEventId()) {
                        %>
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <img src="<%= otherEvent.getThumbnailUrl() %>" class="card-img-top" alt="Event Thumbnail">
                                <div class="card-body">
                                    <h5 class="card-title"><%= otherEvent.getTitle() %></h5>
                                    <p class="card-text"><%= otherEvent.getContent().substring(0, Math.min(otherEvent.getContent().length(), 100)) %>...</p>
                                    <a href="eventDetails.jsp?id=<%= otherEvent.getEventId() %>" class="btn btn-primary btn-read-more">Read More</a>
                                </div>
                            </div>
                        </div>
                        <% 
                               count++;
                               } 
                           } 
                        %>
                    </div>
                </div>
            </div>

            <% } else { %>
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <h1 class="event-title">Event Not Found</h1>
                </div>
            </div>
            <% } %>
        </div>

        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-events">
            <i class="fas fa-arrow-up"></i>
        </a>

        <jsp:include page="layout/footer.jsp"/>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script>
            window.onscroll = function () {
                let backToTopButton = document.getElementById("back-to-top");
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    backToTopButton.style.display = "block";
                } else {
                    backToTopButton.style.display = "none";
                }
            };

            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/tiny-slider.js"></script>
        <script src="assets/js/tiny-slider-init.js"></script>
        <script src="assets/js/counter.init.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>
    </body>
</html>