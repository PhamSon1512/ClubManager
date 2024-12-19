package controller.home;

import Email.JavaMail;
import dal.AccountDAO;
import dal.ClubDBContext;
import dal.ClubRegistrationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Club;

public class UserRegisterClub extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String club_id = request.getParameter("club_id");
        int clubId = Integer.parseInt(club_id);

        ClubDBContext pdb = new ClubDBContext();
        Club club = pdb.getClubById(clubId);

        request.setAttribute("clubId", club);

        request.getRequestDispatcher("userRegisterClub.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String club_id = request.getParameter("club_id");
        int clubId = Integer.parseInt(club_id);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String purpose = request.getParameter("purpose");
        String committees = request.getParameter("commit");
        String description = request.getParameter("description");
        String contextPath = request.getContextPath();
        boolean isValid = true;
        if (name == null || name.trim().isEmpty()) {
            isValid = false;
            request.setAttribute("NameError", "Name is required.");
        }
        if (email == null || email.trim().isEmpty()) {
            isValid = false;
            request.setAttribute("emailError", "Email is required.");
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            isValid = false;
            request.setAttribute("emailError", "Invalid email format.");
        }
        if (purpose == null || purpose.trim().isEmpty()) {
            isValid = false;
            request.setAttribute("purposeError", "Purpose is required.");
        }
         if (committees == null || committees.trim().isEmpty()) {
            isValid = false;
            request.setAttribute("committeesError", "Committees is required.");
        }
          if (description == null || description.trim().isEmpty()) {
            isValid = false;
            request.setAttribute("descriptionError", "Description is required.");
        }

        if (!isValid) {
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        AccountDAO dao = new AccountDAO();
        boolean emailExists = dao.checkEmailExists(email);
        ClubDBContext pdb = new ClubDBContext();
        Club club = pdb.getClubById(clubId);

        request.setAttribute("clubId", club);
        boolean emailExistClub = pdb.checkEmailAndClubId(email, clubId);
        if (emailExistClub) {
            request.setAttribute("errorMessages", "The provided email have exist in our records.");
            request.getRequestDispatcher("userRegisterClub.jsp").forward(request, response);
            return;
        }
        if (!emailExists) {
            request.setAttribute("errorMessage", "The provided email does not exist in our records.");
            request.getRequestDispatcher("userRegisterClub.jsp").forward(request, response);
            return;
        }

        ClubRegistrationDAO registrationDAO = new ClubRegistrationDAO();

        registrationDAO.insertRegistration(clubId, name, email, purpose, committees, description);
        String token = registrationDAO.createViewToken(clubId);
        String viewRegistrationsURL = "http://localhost:9999" + contextPath + "/ViewRegistrationsServlet?token=" + token;
        String subject = "<html><body>"
                + "<h2>New Club Registration</h2>"
                + "<p><strong>Description:</strong>" + description + "</p>"
                + "<p><strong>Name:</strong>" + name + "</p>"
                + "<p><strong>Email:</strong>" + email + "</p>"
                + "<p><strong>Purpose:</strong>" + purpose + "</p>"
                + "<p><strong>Committees:</strong>" + committees + "</p>"
                + "</body></html>"
                + "<button><a href='" + viewRegistrationsURL + "'>View Registrations</a></button>";

        String managerMail = new ClubDBContext().getEmailByStatus(clubId, 2);
        boolean isSend = JavaMail.sendEmailManager(managerMail, subject, "Manager");

        if (!isSend) {
            request.getRequestDispatcher("userRegisterClub.jsp").forward(request, response);

        } else {
            request.setAttribute("successMessage", "Registration successful, please wait for further results.");
            request.getRequestDispatcher("userRegisterClub.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
