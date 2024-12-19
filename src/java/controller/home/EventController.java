package controller.home;

import dal.ClubDAO;
import dal.EventDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import model.Club;
import model.Event;

@WebServlet(name = "EventController", urlPatterns = {"/EventController"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 100) // 100MB
public class EventController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertEvent(request, response);
                    break;
                case "delete":
                    deleteEvent(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateEvent(request, response);
                    break;
                case "view":
                    viewEvent(request, response);
                    break;
                default:
                    listEvent(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listEvent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
//        EventDAO eventDAO = new EventDAO();
//        List<Event> events = eventDAO.getAllEvents();
//        
//        request.setAttribute("events", events);
//        request.getRequestDispatcher("eventList.jsp").forward(request, response);

EventDAO eventDAO = new EventDAO();
    ClubDAO clubDAO = new ClubDAO();

    // Get filter parameters
    String search = request.getParameter("search");
    String clubName = request.getParameter("clubName");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    // Pagination
    int page = 1;
    int recordsPerPage = 10;  // You can adjust this value as needed
    if (request.getParameter("page") != null) {
        page = Integer.parseInt(request.getParameter("page"));
    }

    List<Event> events;
    int totalEvents;

    // Get filtered and paginated events
    events = eventDAO.getFilteredEvents(search, clubName, startDate, endDate, (page - 1) * recordsPerPage, recordsPerPage);
    totalEvents = eventDAO.getTotalFilteredEvents(search, clubName, startDate, endDate);

    int totalPages = (int) Math.ceil((double) totalEvents / recordsPerPage);

    // Get all clubs for the filter dropdown
    List<Club> clubs = clubDAO.getAllClubs();

    request.setAttribute("events", events);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("currentPage", page);
    request.setAttribute("clubs", clubs);
    request.setAttribute("search", search);
    request.setAttribute("clubName", clubName);
    request.setAttribute("startDate", startDate);
    request.setAttribute("endDate", endDate);

    request.getRequestDispatcher("eventList.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("event-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Initialize EventDAO and ClubDAO
        EventDAO eventDAO = new EventDAO();
        ClubDAO clubDAO = new ClubDAO(); // Assuming you have a ClubDAO

        // Fetch existing event by id
        Event existingEvent = eventDAO.getEventById(id);

        // Fetch list of clubs
        List<Club> clubs = clubDAO.getAllClubs(); // Implement this method in ClubDAO

        // Set event and clubs as attributes in request
        request.setAttribute("event", existingEvent);
        request.setAttribute("clubs", clubs);

        // Forward to event-form.jsp
        request.getRequestDispatcher("event-form.jsp").forward(request, response);
    }

    private void viewEvent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        EventDAO eventDAO = new EventDAO();
        Event event = eventDAO.getEventById(eventId);

        if (event != null) {
            request.setAttribute("event", event);
            request.getRequestDispatcher("event.jsp").forward(request, response);
        } else {
            // Xử lý trường hợp không tìm thấy sự kiện
            response.sendRedirect("EventController?action=list");
        }
    }

    private String uploadFile(HttpServletRequest request, Part filePart) throws IOException {
        String fileName = filePart.getSubmittedFileName();
        String uploadPath = request.getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        if (fileName != null && !fileName.isEmpty()) {
            String filePath = uploadPath + File.separator + fileName;
            try (InputStream inputStream = filePart.getInputStream(); FileOutputStream outputStream = new FileOutputStream(filePath)) {
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            }
            return UPLOAD_DIR + "/" + fileName;
        }
        return null;
    }

    private void insertEvent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Part filePart = request.getPart("thumbnail");
        String thumbnailUrl = uploadFile(request, filePart);
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        int clubId = Integer.parseInt(request.getParameter("clubId"));
        int userId = 8;

        Event event = new Event();
        event.setTitle(title);
        event.setContent(content);
        event.setThumbnailUrl(thumbnailUrl);
        event.setStartDate(startDate);
        event.setEndDate(endDate);
        event.setClubId(clubId);
        event.setUserId(userId);

        EventDAO eventDAO = new EventDAO();
        eventDAO.addEvent(event);
        response.sendRedirect("EventController");
    }

    private void updateEvent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Part filePart = request.getPart("thumbnail");
        String thumbnailUrl = uploadFile(request, filePart);
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        int clubId = Integer.parseInt(request.getParameter("clubId"));
        int userId = 8;

        Event event = new Event();
        event.setEventId(id);
        event.setTitle(title);
        event.setContent(content);
        if (thumbnailUrl != null && !thumbnailUrl.isEmpty()) {
            event.setThumbnailUrl(thumbnailUrl);
        }
        event.setStartDate(startDate);
        event.setEndDate(endDate);
        event.setClubId(clubId);
        event.setUserId(userId);

        EventDAO eventDAO = new EventDAO();
        eventDAO.updateEvent(event);
        response.sendRedirect("EventController");
    }

    private void deleteEvent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        EventDAO eventDAO = new EventDAO();
        eventDAO.deleteEvent(id);
        response.sendRedirect("EventController");
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
