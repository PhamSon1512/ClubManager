package controller.home;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import model.Account;
import dal.ClubRegisterDAO;
import Email.JavaMail;
import config.Encode;
import config.Validate;
import java.util.List;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import model.Category;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class ClubRegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ClubRegisterDAO categoryDAO = new ClubRegisterDAO();
        List<Category> listCategories = categoryDAO.getAllCategories();
        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("registerclub.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String clubName = request.getParameter("clubName");
        String clubDescription = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        boolean hasErrors = false;

        Account account = (Account) request.getSession().getAttribute("account");
        String email = (account != null) ? account.getEmail() : null;

        if (email == null || email.isEmpty()) {
            request.setAttribute("errorMessage", "Email is required.");
            hasErrors = true;
        }

        if (!Validate.checkFullName(clubName)) {
            request.setAttribute("clubnameError", "Club Name invalid. Please enter a valid name.");
            hasErrors = true;
        }

        Part filePart = request.getPart("clubImage");
        String fileName = "";

        if (filePart != null && filePart.getSize() > 0) {
            if (filePart.getSize() > 10 * 1024 * 1024) {
                request.setAttribute("errorMessage", "File size too large. Maximum size is 10MB.");
                hasErrors = true;
            } else {
                fileName = getFileName(filePart);
                String uploadPath = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "clubRegis";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, new File(uploadPath, fileName).toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
            }
        } else {
            request.setAttribute("errorMessage", "Please select an image file.");
            hasErrors = true;
        }

        if (!hasErrors) {
            ClubRegisterDAO clubDAO = new ClubRegisterDAO();
            String imagePath = "assets/clubRegis/" + fileName;
            boolean success = clubDAO.registerClub(clubName, email, clubDescription, imagePath, categoryId);

            if (success) {
                String subject = "New Club Registration";
                String content = "<h1>New Club Registration</h1>"
                        + "<p>A new club named <strong>" + clubName + "</strong> has been registered.</p>"
                        + "<p>Please check your account to approve new club registration.</p>";
                String userEmail = account.getEmail();
                String userPassword = Encode.deCode(account.getPassword());

                boolean emailSent = JavaMail.sendEmailFromUser(userEmail, userPassword, JavaMail.admin, subject, content);

                if (emailSent) {
                    request.setAttribute("successMessage", "Your club has successfully registered! Please wait for admin approval.");
                } else {
                    request.setAttribute("errorMessage", "Club registered successfully, but there was an error sending email notification.");
                }
            } else {
                request.setAttribute("errorMessage", "An error occurred while registering the club.");
            }
        }

        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
