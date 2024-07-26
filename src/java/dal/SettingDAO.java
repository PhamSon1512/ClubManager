/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Setting;

/**
 *
 * @author sodok
 */
public class SettingDAO {
    
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBContext dbc = new DBContext();
    Connection connection = null;

    // Constructor to initialize connection
    public SettingDAO() {
        connection = dbc.getConnection();
    }

    public List<Setting> getAllSettingTypes() {
        List<Setting> settings = new ArrayList<>();
        String sql = "SELECT DISTINCT type FROM setting";
        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSetting_type(rs.getString("type"));
                settings.add(setting);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return settings;
    }

    public List<Setting> getSettingsByType(String type) {
        List<Setting> settings = new ArrayList<>();
        String sql = "SELECT * FROM setting WHERE type = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, type);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Setting setting = new Setting();
                    setting.setSetting_id(rs.getInt("setting_id"));
                    setting.setSetting_name(rs.getString("name"));
                    setting.setSetting_type(rs.getString("type"));
                    setting.setDescription(rs.getString("description"));
                    setting.setStatus(rs.getBoolean("status"));
                    settings.add(setting);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return settings;
    }
}
