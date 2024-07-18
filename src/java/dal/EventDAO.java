package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Event;
import java.util.logging.Logger;
import java.util.logging.Level;
import model.Club;

public class EventDAO extends DBContext {
    private static final Logger LOGGER = Logger.getLogger(EventDAO.class.getName());

    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
    String query = "SELECT e.event_id, e.club_id, e.user_id, e.title, e.content, e.thumbnailUrl, e.startDate, e.endDate, c.name AS club_name " +
                   "FROM event e " +
                   "JOIN club c ON e.club_id = c.club_id";
    
    try (Connection connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            Event event = new Event();
            event.setEventId(rs.getInt("event_id"));
            event.setClubId(rs.getInt("club_id"));
            event.setUserId(rs.getInt("user_id"));
            event.setTitle(rs.getString("title"));
            event.setContent(rs.getString("content"));
            event.setThumbnailUrl(rs.getString("thumbnailUrl"));
            event.setStartDate(rs.getString("startDate"));
            event.setEndDate(rs.getString("endDate"));
            event.setClubName(rs.getString("club_name"));
            events.add(event);
            
            LOGGER.info("Retrieved event: ID=" + event.getEventId() + 
                        ", Title=" + event.getTitle() + 
                        ", Club=" + event.getClubName());
        }
    } catch (SQLException e) {
        LOGGER.log(Level.SEVERE, "Error fetching all events", e);
    }
    LOGGER.info("Total events retrieved: " + events.size());
    return events;
    }

    public void addEvent(Event event) throws SQLException {
        String sql = "INSERT INTO event (title, content, thumbnailUrl, startDate, endDate, club_id, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, event.getTitle());
            stmt.setString(2, event.getContent());
            stmt.setString(3, event.getThumbnailUrl());
            stmt.setString(4, event.getStartDate());
            stmt.setString(5, event.getEndDate());
            stmt.setInt(6, event.getClubId());
            stmt.setInt(7, event.getUserId());
            stmt.executeUpdate();
            LOGGER.info("Added new event: " + event.getTitle());
        }
    }
    
    public Event getEventById(int eventId) {
        Event event = null;
        String query = "SELECT e.event_id, e.club_id, e.user_id, e.title, e.content, e.thumbnailUrl, e.startDate, e.endDate, c.name AS club_name " +
                       "FROM event e " +
                       "JOIN club c ON e.club_id = c.club_id " +
                       "WHERE e.event_id = ?";
        
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, eventId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    event = new Event();
                    event.setEventId(rs.getInt("event_id"));
                    event.setClubId(rs.getInt("club_id"));
                    event.setUserId(rs.getInt("user_id"));
                    event.setTitle(rs.getString("title"));
                    event.setContent(rs.getString("content"));
                    event.setThumbnailUrl(rs.getString("thumbnailUrl"));
                    event.setStartDate(rs.getString("startDate"));
                    event.setEndDate(rs.getString("endDate"));
                    event.setClubName(rs.getString("club_name"));
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching event by ID: " + eventId, e);
        }
        return event;
    }
    
    public List<String> getAllCategories() {
        List<String> categories = new ArrayList<>();
        String query = "SELECT DISTINCT category FROM event"; // Assuming there's a 'category' field in 'events' table
        
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(query); 
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                categories.add(rs.getString("category"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return categories;
    }
    public List<Event> getRecentEvents() {
        List<Event> recentEvents = new ArrayList<>();
        String query = "SELECT TOP 5 event_id, title, content, startDate, endDate, thumbnailUrl, clubName FROM events ORDER BY startDate DESC\""; // Adjust the limit as needed
        
        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(query); 
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Event event = new Event();
                event.setEventId(rs.getInt("event_id"));
                    event.setClubId(rs.getInt("club_id"));
                    event.setUserId(rs.getInt("user_id"));
                    event.setTitle(rs.getString("title"));
                    event.setContent(rs.getString("content"));
                    event.setThumbnailUrl(rs.getString("thumbnailUrl"));
                    event.setStartDate(rs.getString("startDate"));
                    event.setEndDate(rs.getString("endDate"));
                    event.setClubName(rs.getString("club_name"));
                // Set other fields as needed
                
                recentEvents.add(event);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return recentEvents;
    }
    
    public void updateEvent(Event event) throws SQLException {
        String sql = "UPDATE event SET title = ?, content = ?, thumbnailUrl = ?, startDate = ?, endDate = ?, club_id = ?, user_id = ? WHERE event_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, event.getTitle());
            statement.setString(2, event.getContent());
            statement.setString(3, event.getThumbnailUrl());
            statement.setString(4, event.getStartDate());
            statement.setString(5, event.getEndDate());
            statement.setInt(6, event.getClubId());
            statement.setInt(7, event.getUserId());
            statement.setInt(8, event.getEventId());
            statement.executeUpdate();
            LOGGER.info("Updated event: " + event.getTitle());
        }
    }

    public void deleteEvent(int eventId) throws SQLException {
        String sql = "DELETE FROM event WHERE event_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, eventId);
            statement.executeUpdate();
            LOGGER.info("Deleted event with ID: " + eventId);
        }
    }
    public List<Club> getAllClubs() {
        List<Club> clubs = new ArrayList<>();
        String query = "SELECT * FROM club";

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Club club = new Club();
                club.setClub_id(rs.getInt("club_id"));
                club.setName(rs.getString("name"));
                // Add more properties as needed
                clubs.add(club);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching all clubs", e);
        }

        return clubs;
    }
    public static void main(String[] args) {
       EventDAO dao = new EventDAO();
        
        
    }
    
    
   public List<Event> getFilteredEvents(String search, String clubName, String startDate, String endDate, int offset, int limit) {
    List<Event> events = new ArrayList<>();
    StringBuilder queryBuilder = new StringBuilder("SELECT e.*, c.name AS club_name FROM event e JOIN club c ON e.club_id = c.club_id WHERE 1=1");
    List<Object> params = new ArrayList<>();

    if (search != null && !search.isEmpty()) {
        queryBuilder.append(" AND e.title LIKE ?");
        params.add("%" + search + "%");
    }
    if (clubName != null && !clubName.isEmpty()) {
        queryBuilder.append(" AND c.name = ?");
        params.add(clubName);
    }
    if (startDate != null && !startDate.isEmpty()) {
        queryBuilder.append(" AND e.startDate >= ?");
        params.add(startDate);
    }
    if (endDate != null && !endDate.isEmpty()) {
        queryBuilder.append(" AND e.endDate <= ?");
        params.add(endDate);
    }

    queryBuilder.append(" ORDER BY e.startDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
    params.add(offset);
    params.add(limit);

    System.out.println("Query: " + queryBuilder.toString());
    System.out.println("Params: " + params);

    try (Connection conn = getConnection();
         PreparedStatement stmt = conn.prepareStatement(queryBuilder.toString())) {

        for (int i = 0; i < params.size(); i++) {
            stmt.setObject(i + 1, params.get(i));
        }

        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Event event = new Event();
                // Set event properties
                event.setTitle(rs.getString("title"));
                event.setContent(rs.getString("content"));
                event.setThumbnailUrl(rs.getString("thumbnailUrl"));
                event.setStartDate(rs.getString("startDate"));
                event.setEndDate(rs.getString("endDate"));
                event.setClubName(rs.getString("club_name"));
                events.add(event);
            }
        }
    } catch (SQLException e) {
        LOGGER.log(Level.SEVERE, "Error fetching filtered events", e);
    }

    return events;
}



    public int getTotalFilteredEvents(String search, String clubName, String startDate, String endDate) {
    StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(*) FROM event e JOIN club c ON e.club_id = c.club_id WHERE 1=1");
    List<Object> params = new ArrayList<>();

    if (search != null && !search.isEmpty()) {
        queryBuilder.append(" AND e.title LIKE ?");
        params.add("%" + search + "%");
    }
    if (clubName != null && !clubName.isEmpty()) {
        queryBuilder.append(" AND c.name = ?");
        params.add(clubName);
    }
    if (startDate != null && !startDate.isEmpty()) {
        queryBuilder.append(" AND e.startDate >= ?");
        params.add(startDate);
    }
    if (endDate != null && !endDate.isEmpty()) {
        queryBuilder.append(" AND e.endDate <= ?");
        params.add(endDate);
    }

    System.out.println("Count Query: " + queryBuilder.toString());
    System.out.println("Params: " + params);

    try (Connection conn = getConnection();
         PreparedStatement stmt = conn.prepareStatement(queryBuilder.toString())) {

        for (int i = 0; i < params.size(); i++) {
            stmt.setObject(i + 1, params.get(i));
        }

        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
    } catch (SQLException e) {
        LOGGER.log(Level.SEVERE, "Error getting total filtered events count", e);
    }

    return 0;
}


    
           
}