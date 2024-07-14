package controller.admin;

import Email.JavaMail;
import com.google.gson.Gson;
import config.Encode;
import config.Validate;
import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import java.util.Random;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author sodok
 */
public class AccountManager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        AccountDAO accountDAO = new AccountDAO();
        List<Account> accountList;

        String action = request.getParameter("action");

        try {
            // list user
            if (action == null || action.equals("all")) {
                accountList = accountDAO.listAcc();
                if (accountList != null && !accountList.isEmpty()) {
                    int page = 1;
                    int numPerPage = 8;
                    int size = accountList.size();
                    int num = (size % numPerPage == 0) ? (size / numPerPage) : ((size / numPerPage) + 1);
                    String xPage = request.getParameter("page");
                    if (xPage != null) {
                        page = Integer.parseInt(xPage);
                    }
                    int start = (page - 1) * numPerPage;
                    int end = Math.min(page * numPerPage, size);
                    List<Account> pagedAccounts = accountDAO.getListByPage(accountList, start, end);
                    request.setAttribute("page", page);
                    request.setAttribute("num", num);
                    request.setAttribute("accountList", pagedAccounts);
                } else {
                    request.setAttribute("message", "No accounts found.");
                }
                request.getRequestDispatcher("admin/account.jsp").forward(request, response);
            }
            // add user
            if (action.equals("add")) {
                String fullname = request.getParameter("fullname");
                String username = request.getParameter("fullname");
                String email = request.getParameter("email");
                int setting = Integer.parseInt(request.getParameter("setting"));
                int role = Integer.parseInt(request.getParameter("status"));
                boolean verified = false;
                boolean hasErrors = false;
                
                // Validation checks
                if (!Validate.checkFullName(fullname)) {
                    request.setAttribute("fullnameError", "Invalid full name. Please enter a valid name.");
                    hasErrors = true;
                }
                if (!Validate.checkEmail(email)) {
                    request.setAttribute("emailError", "Invalid email format. Please enter a valid email.");
                    hasErrors = true;
                }
                if (accountDAO.getAccountsByEmail(email) != null) {
                    request.setAttribute("emailError", "Email already exists. Please use a different email.");
                    hasErrors = true;
                }

                if (hasErrors) {
                    request.setAttribute("showAddUserModal", true);
                    request.getRequestDispatcher("admin/account.jsp").forward(request, response);
                } else {
                    String randomPass = generateRandomPassword();
                    String defaultPassword = Encode.enCode(randomPass);
                    accountDAO.insertAccount(fullname, username, email, defaultPassword, setting, role, verified);

                    String subject = "Your New Account Password";
                    String content = "<h1>Password Account</h1>"
                            + "<p>Your new account has been create. Your temporary password is: <strong>" + randomPass + "</strong></p>"
                            + "<p>Please log in with the new password sent to your email, then change your password to secure your account</p>";
                    boolean emailSent = JavaMail.sendEmail(email, subject, content);

                    if (emailSent) {
                        response.sendRedirect("account?action=all&success=1");
                        return;
                    } else {
                        request.setAttribute("emailError", "Failed to send email. Please try again.");
                        request.getRequestDispatcher("admin/account.jsp").forward(request, response);
                    }
                }
            }
            //search
            if (action.equals("search")) {
                String searchTerm = request.getParameter("search");
                if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                    accountList = accountDAO.searchAccounts(searchTerm);
                } else {
                    accountList = accountDAO.listAcc();
                }

                int page = 1;
                int numPerPage = 8;
                int size = accountList.size();
                int num = (size % numPerPage == 0) ? (size / numPerPage) : ((size / numPerPage) + 1);
                String xPage = request.getParameter("page");
                if (xPage != null) {
                    page = Integer.parseInt(xPage);
                }
                int start = (page - 1) * numPerPage;
                int end = Math.min(page * numPerPage, size);
                List<Account> pagedAccounts = accountDAO.getListByPage(accountList, start, end);

                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("accountList", pagedAccounts);
                request.setAttribute("searchTerm", searchTerm);
                request.getRequestDispatcher("admin/account.jsp").forward(request, response);
            }
            //change status
            if (action.equals("toggleStatus")) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                int newStatus = Integer.parseInt(request.getParameter("newStatus"));

                boolean success = accountDAO.updateAccountStatus(userId, newStatus);

                if (success) {
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("failed");
                }
                return;
            }
            // Get user information
            if (action.equals("getUserInfo")) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                Account account = accountDAO.getAccountById(userId);
                if (account != null) {
                    Gson gson = new Gson();
                    String jsonAccount = gson.toJson(account);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(jsonAccount);
                }
            }
            // Edit user information
            if (action.equals("edit")) {
                String userIdParam = request.getParameter("userId");
                if (userIdParam != null && !userIdParam.isEmpty()) {
                    try {
                        int userId = Integer.parseInt(userIdParam);
                        Account accountToEdit = accountDAO.getAccountById(userId);
                        if (accountToEdit != null) {
                            Gson gson = new Gson();
                            String jsonAccount = gson.toJson(accountToEdit);
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
                            response.getWriter().write(jsonAccount);
                        } else {
                            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                            response.getWriter().write("User not found");
                        }
                    } catch (NumberFormatException e) {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("Invalid user ID format");
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().write("User ID is missing");
                }
            }
            // Update user information
            if (action.equals("updateUser")) {
                String userIdStr = request.getParameter("userId");
                String fullname = request.getParameter("fullname");
                String username = request.getParameter("username");
                String phoneNumber = request.getParameter("phone");
                String roleStr = request.getParameter("role");

                if (userIdStr != null && !userIdStr.isEmpty() && roleStr != null && !roleStr.isEmpty()) {
                    try {
                        int userId = Integer.parseInt(userIdStr);
                        int role = Integer.parseInt(roleStr);

                        boolean success = accountDAO.updateAccount(userId, fullname, username, phoneNumber, role);
                        if (success) {
                            response.getWriter().write("success");
                        } else {
                            response.getWriter().write("fail");
                        }
                    } catch (NumberFormatException e) {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("Invalid user ID or role.");
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().write("Missing required parameters.");
                }
            }
        } catch (Exception e) {
            System.out.println("Error in AccountManager: " + e.getMessage());
            e.printStackTrace(); // In ra stack trace để debug
            request.setAttribute("error", "An error occurred while updating user information: " + e.getMessage());
            request.getRequestDispatcher("admin/account.jsp").forward(request, response);
        }
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String generateRandomPassword() {
        String upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String combinedChars = upperCaseLetters + lowerCaseLetters + numbers;
        Random random = new Random();
        char[] password = new char[8];

        password[0] = upperCaseLetters.charAt(random.nextInt(upperCaseLetters.length()));
        password[1] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
        password[2] = numbers.charAt(random.nextInt(numbers.length()));

        for (int i = 3; i < 8; i++) {
            password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
        }
        return new String(password);
    }
}
