package controller.home;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import dal.BlogDAO;
import java.util.ArrayList;
import java.util.List;

public class BlogController extends HttpServlet {
    private static final int POSTS_PER_PAGE = 6;
    private static final int MAX_PAGES_DISPLAYED = 5;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        BlogDAO blogDAO = new BlogDAO();
        List<Blog> allBlogs = blogDAO.getAllBlogs();

        String keyword = request.getParameter("keyword");
        List<Blog> searchResults = new ArrayList<>();

        if (keyword != null && !keyword.isEmpty()) {
            for (Blog blog : allBlogs) {
                if (blog.getTitle().toLowerCase().contains(keyword.toLowerCase()) ||
                    blog.getContent().toLowerCase().contains(keyword.toLowerCase())) {
                    searchResults.add(blog);
                }
            }
        } else {
            searchResults = allBlogs;
        }

        int totalPosts = searchResults.size();
        int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
        int startIndex = (currentPage - 1) * POSTS_PER_PAGE;
        int endIndex = Math.min(startIndex + POSTS_PER_PAGE, totalPosts);
        List<Blog> displayedBlogs = searchResults.subList(startIndex, endIndex);

        request.setAttribute("displayedBlogs", displayedBlogs);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPosts", totalPosts);
        request.setAttribute("postsPerPage", POSTS_PER_PAGE);
        request.setAttribute("maxPagesDisplayed", MAX_PAGES_DISPLAYED);

        request.getRequestDispatcher("Blogs.jsp").forward(request, response);
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
        return "BlogController Servlet";
    }
}
