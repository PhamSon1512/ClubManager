package controller.admin;

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

public class NewClubController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> listCategories = new ClubDAO().getAllCategories();
        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("admin/clubmanage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");
        String category_id = request.getParameter("category_id");
        String phoneNumber = request.getParameter("phoneNumber");
        String facebook = request.getParameter("facebook");

        if (code == null || name == null || description == null || imageUrl == null || category_id == null || phoneNumber == null || facebook == null) {
            request.setAttribute("error", "All fields are required.");
            doGet(request, response);
            return;
        }

        int categoryId = Integer.parseInt(category_id);
        ClubDBContext newClub = new ClubDBContext();
        newClub.insertClub(code, name, description, imageUrl, categoryId, phoneNumber, facebook);
        List<Club> listAllClubs = new ClubDBContext().getAllClubs();
        request.setAttribute("listAllClubs", listAllClubs);
        List<Club> listClubs = new ClubDBContext().getClubsByCategoryId(categoryId);
        request.setAttribute("listClubs", listClubs);
        List<Category> listCategories = new ClubDAO().getAllCategories();
        request.setAttribute("listCategories", listCategories);

        request.getRequestDispatcher("admin/clubmanage.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
