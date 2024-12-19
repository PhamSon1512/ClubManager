package dal;

import context.DBContext;
import model.EventRegistration;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class EventRegistrationDAO extends DBContext {
   private static final Logger LOGGER = Logger.getLogger(EventRegistrationDAO.class.getName());

    public boolean addEventRegistration(EventRegistration registration) {
        String query = "INSERT INTO event_registration (event_id, user_id, status, notes, attendance) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, registration.getEventId());
            ps.setInt(2, registration.getUserId());
            ps.setString(3, registration.getStatus());
            ps.setString(4, registration.getNotes());
            ps.setBoolean(5, registration.isAttendance());
            
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding event registration", e);
            return false;
        }
    }
    
    public List<EventRegistration> getEventRegistrationsByUserId(int userId) {
    List<EventRegistration> registrations = new ArrayList<>();
    String query = "SELECT er.registration_id, er.event_id, er.user_id, er.registration_date, er.status, er.notes, er.attendance, " +
                   "e.title as event_title, e.startDate as start_time, e.endDate as end_time " +
                   "FROM event_registration er " +
                   "JOIN event e ON er.event_id = e.event_id " +
                   "WHERE er.user_id = ?";
    
    try (Connection conn = getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setInt(1, userId);
        
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                EventRegistration registration = new EventRegistration();
                registration.setRegistrationId(rs.getInt("registration_id"));
                registration.setEventId(rs.getInt("event_id"));
                registration.setUserId(rs.getInt("user_id"));
                registration.setRegistrationDate(rs.getString("registration_date"));
                registration.setStatus(rs.getString("status"));
                registration.setNotes(rs.getString("notes"));
                registration.setAttendance(rs.getBoolean("attendance"));
                registration.setEventTitle(rs.getString("event_title"));
                registration.setEventStartTime(rs.getString("start_time"));
                registration.setEventEndTime(rs.getString("end_time"));
                registrations.add(registration);
            }
        }
    } catch (SQLException e) {
        LOGGER.log(Level.SEVERE, "Error getting event registrations for user", e);
    }
    return registrations;
}
    public static void main(String[] args) {
        EventRegistrationDAO dao = new EventRegistrationDAO();
        System.out.println(dao.getEventRegistrationsByUserId(11));
                
    }
    

}
