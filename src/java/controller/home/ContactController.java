/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import Email.JavaMail;
import dal.ClubDBContext;
import dal.ContactDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Contact;
import java.sql.Timestamp;

/**
 *
 * @author sodok
 */
public class ContactController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Validation
        boolean isValid = true;
        if (fullName == null || fullName.trim().isEmpty()) {
            isValid = false;
            request.setAttribute("fullNameError", "Full name is required.");
        }
        if (email == null || email.trim().isEmpty()) {
            isValid = false;
            request.setAttribute("emailError", "Email is required.");
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            isValid = false;
            request.setAttribute("emailError", "Invalid email format.");
        }
        if (message == null || message.trim().isEmpty()) {
            isValid = false;
            request.setAttribute("messageError", "Message is required.");
        }

        if (!isValid) {
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        // Save contact to database
        ContactDAO contactDAO = new ContactDAO();
        Contact contact = new Contact();
        contact.setFullName(fullName);
        contact.setEmail(email);
        contact.setMessage(message);
        contact.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        int contactId = contactDAO.saveContact(contact);

        if (contactId > 0) {
            // Generate view token
            String viewToken = generateViewToken(contactId);

            // Prepare email content
            String subject = "New Contact Submission";
            String emailContent = "<html><body>"
                    + "<h2>New Contact Submission</h2>"
                    + "<p><strong>Name:</strong> " + fullName + "</p>"
                    + "<p><strong>Email:</strong> " + email + "</p>"
                    + "<p><strong>Message:</strong> " + message + "</p>"
                    + "<p><a href='http://localhost:9999/Iter2/contactList?token=" + viewToken + "'>View Contact List</a></p>"
                    + "</body></html>";

            // Send email to admin
            String adminEmail = new ClubDBContext().getAdminEmailByStatus(1);
            boolean isSent = JavaMail.sendEmailAdmin(adminEmail, emailContent, subject);

            if (isSent) {
                request.setAttribute("successMessage", "Your message has been sent successfully. We will contact you soon.");
            } else {
                request.setAttribute("errorMessage", "There was an error sending your message. Please try again later.");
            }
        } else {
            request.setAttribute("errorMessage", "There was an error saving your message. Please try again later.");
        }

        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    private String generateViewToken(int contactId) {
        // Implement a method to generate a unique token
        // This is a simple example, you might want to use a more secure method
        return contactId + "-" + System.currentTimeMillis();
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
