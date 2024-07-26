package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Category;
import model.ClubRegister;

public class ClubRegisterDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    DBContext dbc = new DBContext();
    Connection connection = null;

    public ClubRegisterDAO() {
        connection = dbc.getConnection();
    }

    public boolean registerClub(String name, String email, String description, String imagePath, int categoryId) {
        String sql = "INSERT INTO club_register (name, email, description, image, category_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = dbc.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, description);
            stmt.setString(4, imagePath);
            stmt.setInt(5, categoryId);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM club_category";
        try (Connection conn = dbc.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Category category = new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setName(rs.getString("name"));
                categories.add(category);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return categories;
    }

    public List<Map<String, Object>> getAllPendingRegistrationsWithCategory() {
        List<Map<String, Object>> registrations = new ArrayList<>();
        String sql = "SELECT cr.*, cc.name AS category_name FROM club_register cr "
                + "LEFT JOIN club_category cc ON cr.category_id = cc.category_id "
                + "WHERE cr.club_id IS NULL";
        try (Connection conn = dbc.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> registration = new HashMap<>();
                registration.put("registration_id", rs.getInt("registration_id"));
                registration.put("name", rs.getString("name"));
                registration.put("email", rs.getString("email"));
                registration.put("description", rs.getString("description"));
                registration.put("image", rs.getString("image"));
                registration.put("category_id", rs.getInt("category_id"));
                registration.put("category_name", rs.getString("category_name"));
                registrations.add(registration);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registrations;
    }

    public ClubRegister getRegistrationById(int registrationId) {
        String sql = "SELECT * FROM club_register WHERE registration_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, registrationId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    ClubRegister registration = new ClubRegister();
                    registration.setRegistration_id(rs.getInt("registration_id"));
                    registration.setName(rs.getString("name"));
                    registration.setEmail(rs.getString("email"));
                    registration.setDescription(rs.getString("description"));
                    registration.setImage(rs.getString("image"));
                    registration.setCategory_id(rs.getInt("category_id"));
                    return registration;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Map<String, Object> getClubRegistrationDetails(int registrationId) {
        Map<String, Object> details = new HashMap<>();
        String sql = "SELECT cr.*, cc.name AS category_name FROM club_register cr "
                + "LEFT JOIN club_category cc ON cr.category_id = cc.category_id "
                + "WHERE cr.registration_id = ?";
        try (Connection conn = dbc.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, registrationId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    details.put("registration_id", rs.getInt("registration_id"));
                    details.put("name", rs.getString("name"));
                    details.put("email", rs.getString("email"));
                    details.put("description", rs.getString("description"));
                    details.put("image", rs.getString("image"));
                    details.put("category_id", rs.getInt("category_id"));
                    details.put("category_name", rs.getString("category_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }

    public boolean deleteRegistration(int registrationId) {
        String sql = "DELETE FROM club_register WHERE registration_id = ?";
        try (Connection conn = dbc.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, registrationId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        ClubRegisterDAO dao = new ClubRegisterDAO();

        // Thay đổi số này thành ID của một đăng ký thực tế trong cơ sở dữ liệu của bạn
        int testRegistrationId = 5;

        ClubRegister registration = dao.getRegistrationById(testRegistrationId);

        if (registration != null) {
            System.out.println("Found registration:");
            System.out.println("ID: " + registration.getRegistration_id());
            System.out.println("Name: " + registration.getName());
            System.out.println("Email: " + registration.getEmail());
            System.out.println("Description: " + registration.getDescription());
            System.out.println("Image: " + registration.getImage());
            System.out.println("Category ID: " + registration.getCategory_id());
        } else {
            System.out.println("No registration found with ID: " + testRegistrationId);
        }
    }
}
