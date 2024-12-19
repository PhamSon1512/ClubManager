package controller.manager;

import dal.ClubRegistrationDAO;
import dal.AccountDAO;
import model.ClubRegistration;
import model.Account;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ViewRegistrationsServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ClubRegistrationDAO dao = new ClubRegistrationDAO();
        AccountDAO accountDao = new AccountDAO();
        
        String token = request.getParameter("token");
        HttpSession session = request.getSession(false);
        
        int clubId = -1;
        boolean isTokenAccess = false;
        
        if (token != null) {
            // Token-based access (from email link)
            clubId = dao.getClubIdFromToken(token);
            if (clubId == -1 || !dao.isValidToken(token, clubId)) {
                response.sendRedirect("404.jsp");
                return;
            }
            isTokenAccess = true;
            
            // Clear any existing session to prevent access with wrong account
            if (session != null) {
                session.invalidate();
            }
            session = request.getSession(true);
            session.setAttribute("tokenClubId", clubId);
        } else {
            // Session-based access (for logged-in managers)
            if (!isAuthenticatedManager(session)) {
                response.sendRedirect("user?action=login");
                return;
            }
            
            Account account = (Account) session.getAttribute("account");
            clubId = accountDao.getManagerClubId(account.getUser_id());
            if (clubId == -1) {
                response.sendRedirect("error.jsp");
                return;
            }
        }
        
        // Check if the logged-in manager has permission to view this club's registrations
        if (!isTokenAccess) {
            Account account = (Account) session.getAttribute("account");
            int managerClubId = accountDao.getManagerClubId(account.getUser_id());
            if (managerClubId != clubId) {
                response.sendRedirect("unauthorized.jsp");
                return;
            }
        }
        
        // Fetch registrations for the specific club
        List<ClubRegistration> registrations = dao.getPendingRegistrations(clubId);
        
        if (registrations != null && !registrations.isEmpty()) {
            int page = 1;
            int numPerPage = 8;
            int size = registrations.size();
            int num = (size % numPerPage == 0) ? (size / numPerPage) : ((size / numPerPage) + 1);
            String xPage = request.getParameter("page");
            if (xPage != null) {
                page = Integer.parseInt(xPage);
            }
            int start = (page - 1) * numPerPage;
            int end = Math.min(page * numPerPage, size);
            List<ClubRegistration> pagedViews = dao.getListByPage(registrations, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("registrations", pagedViews);
            request.setAttribute("clubId", clubId);
            request.setAttribute("isTokenAccess", isTokenAccess);
            request.getRequestDispatcher("admin/viewregistration.jsp").forward(request, response);
        } else {
            response.sendRedirect("no-registrations.jsp");
        }
    }

    private boolean isAuthenticatedManager(HttpSession session) {
        if (session == null) {
            return false;
        }
        Account account = (Account) session.getAttribute("account");
        return account != null && account.getStatus() == 2; // 2 is the status for manager
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
}