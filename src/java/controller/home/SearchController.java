package controller.home;

import dal.ClubDAO;
import dal.ClubDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Club;

/**
 * Servlet implementation class SearchController
 */
public class SearchController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String keyword = request.getParameter("keyword");

        ClubDAO clubDAO = new ClubDAO();
        List<Club> listProducts = new ClubDBContext().search(keyword);

        // Retrieve all categories
        List<Category> listCategories = clubDAO.getAllCategories();
        
        // Check if the keyword matches a category name
        for (Category category : listCategories) {
            if (category.getName().equalsIgnoreCase(keyword)) {
                // Redirect to the category page
                response.sendRedirect("categoryclub?categoryId=" + category.getCategory_id());
                return;
            }
        }

        // Set the attributes for the request
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listProducts", listProducts);
        request.setAttribute("key", keyword);

        // Forward the request to index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "SearchController handles search requests for clubs by keyword";
    }
}
