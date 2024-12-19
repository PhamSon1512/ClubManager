package controller.home;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.EventRegistration;
import dal.EventRegistrationDAO;
import dal.EventDAO;
import model.Event;
import model.Account;


public class RegisterEventServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int eventId = Integer.parseInt(request.getParameter("eventId"));
        EventDAO eventDAO = new EventDAO();
        Event event = eventDAO.getEventById(eventId);
        
        request.setAttribute("event", event);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/registerEvent.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int eventId = Integer.parseInt(request.getParameter("eventId"));
        String status = request.getParameter("status");
        String notes = request.getParameter("notes");
        boolean attendance = request.getParameter("attendance") != null;

        EventRegistration registration = new EventRegistration();
        registration.setEventId(eventId);
        registration.setUserId(user.getUser_id());
        registration.setStatus(status);
        registration.setNotes(notes);
        registration.setAttendance(attendance);

        EventRegistrationDAO registrationDAO = new EventRegistrationDAO();
        boolean success = registrationDAO.addEventRegistration(registration);

        if (success) {
            // Registration successful, redirect to event.jsp
            request.getSession().setAttribute("successMessage", "Đăng ký sự kiện thành công!");
            response.sendRedirect("EventController?action=view&eventId=" + eventId);
        } else {
            // Registration failed, set error message and forward back to registration form
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("/registerEvent.jsp").forward(request, response);
        }
    
    }
}