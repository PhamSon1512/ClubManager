package controller.admin;

import dal.ClubRegisterDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Email.JavaMail;
import com.google.gson.Gson;
import dal.AccountDAO;
import dal.ClubDBContext;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;
import model.Account;

public class AdminApproveClub extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listPendingClubs(request, response);
                break;
            case "viewClub":
                viewClubDetails(request, response);
                break;
            case "viewUser":
                viewUserDetails(request, response);
                break;
            case "approve":
                approveClub(request, response);
                break;
            case "reject":
                rejectClub(request, response);
                break;
            default:
                listPendingClubs(request, response);
        }
    }

    private void listPendingClubs(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ClubRegisterDAO dao = new ClubRegisterDAO();
        List<Map<String, Object>> pendingRegistrations = dao.getAllPendingRegistrationsWithCategory();
        request.setAttribute("pendingRegistrations", pendingRegistrations);
        request.getRequestDispatcher("/admin/ClubRegis.jsp").forward(request, response);
    }

    private void viewClubDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int registrationId = Integer.parseInt(request.getParameter("id"));
        ClubRegisterDAO dao = new ClubRegisterDAO();
        Map<String, Object> clubDetails = dao.getClubRegistrationDetails(registrationId);
        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(clubDetails));
    }

    private void viewUserDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        AccountDAO dao = new AccountDAO();
        Account user = dao.getAccountsByEmail(email);
        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(user));
    }

    private void approveClub(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int registrationId = Integer.parseInt(request.getParameter("registrationId"));
        ClubRegisterDAO registerDao = new ClubRegisterDAO();
        ClubDBContext clubDao = new ClubDBContext();

        Map<String, Object> registration = registerDao.getClubRegistrationDetails(registrationId);

        // Move image
        String oldPath = getServletContext().getRealPath("") + File.separator + (String) registration.get("image");
        String newFileName = "club_" + System.currentTimeMillis() + ".jpg";
        String newPath = getServletContext().getRealPath("") + File.separator + "img" + File.separator + newFileName;
        Files.move(Paths.get(oldPath), Paths.get(newPath), StandardCopyOption.REPLACE_EXISTING);

        // Insert new club
        String code = generateClubCode((String) registration.get("name"));
        clubDao.insertClub(code, (String) registration.get("name"), (String) registration.get("description"),
                "img/" + newFileName, (Integer) registration.get("category_id"), "", "");

        registerDao.deleteRegistration(registrationId);

        String subject = "New Club Registration";
        String content = "<h1>New Club Registration</h1>"
                + "<p>Congratulations! Your club <strong>" + registration.get("name") + "</strong> has been approved.</p>"
                + "<p>Please check your account to update your club's information registration.</p>";

        // Send email
        JavaMail.sendEmail((String) registration.get("email"), subject, content);
        response.getWriter().write("Club approved successfully");
    }

    private void rejectClub(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int registrationId = Integer.parseInt(request.getParameter("registrationId"));
        ClubRegisterDAO dao = new ClubRegisterDAO();
        Map<String, Object> registration = dao.getClubRegistrationDetails(registrationId);

        dao.deleteRegistration(registrationId);

        String subject = "Club Registration Failed";
        String content = "<h1>New Club Registration Failed</h1>"
                + "<p>Your club registration was not approved</p>"
                + "<p>We're sorry, but your club " + registration.get("name") + " was not approved.</p>";

        JavaMail.sendEmail((String) registration.get("email"), subject, content);

        response.getWriter().write("Club registration rejected");
    }

    private String generateClubCode(String clubName) {
        return clubName.replaceAll("\\s+", "").toLowerCase() + System.currentTimeMillis();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
