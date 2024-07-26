/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.AccountDAO;
import dal.ClubDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Club;
import model.Notification;

/**
 *
 * @author sodok
 */
public class RegisterClubController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Fetch the list of clubs from the database
        ClubDBContext clubDAO = new ClubDBContext();
        List<Club> clubList = clubDAO.getAllClubs();
        request.setAttribute("clubList", clubList);

        // Fetch account details if logged in
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        request.setAttribute("account", account);

        request.getRequestDispatcher("registerclub.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    AccountDAO accountDAO = new AccountDAO();
    Account account = accountDAO.getAccountByUP(email, password);

    if (account != null) {
        HttpSession session = request.getSession();
        session.setAttribute("account", account);

        // Create a notification
        String clubName = request.getParameter("clublist");
        String purpose = request.getParameter("purpose");
        String customPurpose = request.getParameter("custom_purpose");
        String finalPurpose = "Other".equals(purpose) ? customPurpose : purpose;
        String message = "New registration: " + account.getFullname() + " has registered for " + clubName + " with purpose: " + finalPurpose;
        String timestamp = new java.util.Date().toString();

        Notification notification = new Notification(message, timestamp);
        List<Notification> notifications = (List<Notification>) session.getServletContext().getAttribute("notifications");
        if (notifications == null) {
            notifications = new ArrayList<>();
        }
        notifications.add(notification);
        session.getServletContext().setAttribute("notifications", notifications);
    }

    processRequest(request, response);
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
