package dal;

import context.DBContext;
import model.ClubRegistration;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ClubRegistrationDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;
    DBContext dbc = new DBContext();
    Connection connection = null;

    // Constructor to initialize connection
    public ClubRegistrationDAO() {
        connection = dbc.getConnection();
    }

    public void insertRegistration(int clubId, String name, String email, String purpose, String committees, String description) {
        String sql = "INSERT INTO club_registration (club_id, name, email, purpose, committees, description) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, clubId);
            statement.setString(2, name);
            statement.setString(3, email);
            statement.setString(4, purpose);
            statement.setString(5, committees);
            statement.setString(6, description);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<ClubRegistration> getPendingRegistrations(int clubId) {
        List<ClubRegistration> registrations = new ArrayList<>();
        String sql = "SELECT * FROM club_registration WHERE status = 'pending' AND club_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, clubId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ClubRegistration registration = new ClubRegistration();
                registration.setId(rs.getInt("registration_id"));
                registration.setClubId(rs.getInt("club_id"));
                registration.setName(rs.getString("name"));
                registration.setEmail(rs.getString("email"));
                registration.setPurpose(rs.getString("purpose"));
                registration.setCommittees(rs.getString("committees"));
                registration.setDescription(rs.getString("description"));
                registration.setStatus(rs.getString("status"));
                registration.setCreatedAt(rs.getTimestamp("created_at"));
                registrations.add(registration);
            }
            // Check if no records found
            if (registrations.isEmpty()) {
                System.out.println("No pending registrations found for club_id: " + clubId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registrations;
    }

    public String createViewToken(int clubId) {
        String token = generateToken(); // Implement this method to generate a unique token
        LocalDateTime expirationTime = LocalDateTime.now().plusHours(24);
        String sql = "INSERT INTO view_tokens (token, club_id, expiration_time) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, token);
            statement.setInt(2, clubId);
            statement.setTimestamp(3, Timestamp.valueOf(expirationTime));
            int affectedRows = statement.executeUpdate();
            if (affectedRows > 0) {
                return token;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isValidToken(String token, int clubId) {
        String sql = "SELECT * FROM view_tokens WHERE token = ? AND club_id = ? AND expiration_time > ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, token);
            statement.setInt(2, clubId);
            statement.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            ResultSet rs = statement.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void cleanupExpiredTokens() {
        String sql = "DELETE FROM view_tokens WHERE expiration_time <= ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private String generateToken() {
        // Implement a method to generate a unique token
        // For example, you could use java.util.UUID.randomUUID().toString()
        return java.util.UUID.randomUUID().toString();
    }

    public int getClubIdFromToken(String token) {
        String sql = "SELECT club_id FROM view_tokens WHERE token = ? AND expiration_time > ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, token);
            statement.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("club_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Trả về -1 nếu không tìm thấy token hợp lệ
    }

    public ClubRegistration getRegistrationById(int id) {
        String sql = "SELECT * FROM club_registration WHERE registration_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                ClubRegistration registration = new ClubRegistration();
                registration.setId(rs.getInt("registration_id"));
                registration.setClubId(rs.getInt("club_id"));
                registration.setName(rs.getString("name"));
                registration.setEmail(rs.getString("email"));
                registration.setPurpose(rs.getString("purpose"));
                registration.setCommittees(rs.getString("committees"));
                registration.setDescription(rs.getString("description"));
                registration.setStatus(rs.getString("status"));
                registration.setCreatedAt(rs.getTimestamp("created_at"));
                return registration;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if no registration found
    }

    public void updateRegistrationStatus(int id, String status) {
        String sql = "UPDATE club_registration SET status = ? WHERE registration_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, status);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ClubRegistrationDAO club = new ClubRegistrationDAO();
        System.out.println(club.getPendingRegistrations(2));

        // Test token creation and validation
        String token = club.createViewToken(2);
        System.out.println("Created token: " + token);
        System.out.println("Is token valid? " + club.isValidToken(token, 2));

        // Clean up expired tokens
        club.cleanupExpiredTokens();
    }
}
