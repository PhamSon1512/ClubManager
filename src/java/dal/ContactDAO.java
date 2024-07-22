package dal;

import context.DBContext;
import model.Contact;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ContactDAO() {
        try {
            conn = new DBContext().getConnection();
        } catch (Exception e) {
            System.out.println("Error connecting to database: " + e.getMessage());
        }
    }

    public int saveContact(Contact contact) {
        String sql = "INSERT INTO contact (full_name, email, message, created_at) VALUES (?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, contact.getFullName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getMessage());
            ps.setTimestamp(4, contact.getCreatedAt());
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error saving contact: " + e.getMessage());
        }
        return -1;
    }

    public List<Contact> getPendingContacts() {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT * FROM contact WHERE responded = 0 ORDER BY created_at DESC";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setContactId(rs.getInt("contact_id"));
                contact.setFullName(rs.getString("full_name"));
                contact.setEmail(rs.getString("email"));
                contact.setMessage(rs.getString("message"));
                contact.setCreatedAt(rs.getTimestamp("created_at"));
                contacts.add(contact);
            }
        } catch (SQLException e) {
            System.out.println("Error getting pending contacts: " + e.getMessage());
        }
        return contacts;
    }

    public Contact getContactById(int contactId) {
        String sql = "SELECT * FROM contact WHERE contact_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, contactId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Contact contact = new Contact();
                contact.setContactId(rs.getInt("contact_id"));
                contact.setFullName(rs.getString("full_name"));
                contact.setEmail(rs.getString("email"));
                contact.setMessage(rs.getString("message"));
                contact.setCreatedAt(rs.getTimestamp("created_at"));
                contact.setResponded(rs.getBoolean("responded"));
                return contact;
            }
        } catch (SQLException e) {
            System.out.println("Error getting contact by ID: " + e.getMessage());
        }
        return null;
    }

    public void updateContactStatus(int contactId, boolean responded) {
        String sql = "UPDATE contact SET responded = ? WHERE contact_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, responded);
            ps.setInt(2, contactId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("No contact found with ID: " + contactId);
            }
        } catch (SQLException e) {
            System.out.println("Error updating contact status: " + e.getMessage());
        }
    }
    // Add other necessary methods
    public static void main(String[] args) {
        ContactDAO dao = new ContactDAO();
        
    }
}
