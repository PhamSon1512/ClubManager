/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;

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
            // Mặc định hiển thị tất cả tài khoản nếu không có action hoặc action là "all"
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
            // Thêm các action khác nếu cần
        } catch (Exception e) {
            System.out.println("Error in AccountManager: " + e.getMessage());
            request.setAttribute("error", "An error occurred while processing your request.");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
